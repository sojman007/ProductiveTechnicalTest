public with sharing abstract class QueueableBaseLink implements Queueable {
    
    protected List<QueueableBaseNode> nodes;
    protected integer index =0;

    public abstract void finish();
    public abstract void addResult(Object result);

    public QueueableBaseLink(){
        nodes = new List<QueueableBaseNode>();
    }


    protected void addNode(QueueableBaseNode node){
        nodes.add(node);
    }

    public QueueableBaseNode getCurrentNodeToExecute(){
        return nodes[index];
    }

    public boolean hasNext(){
        return index < nodes.size() -1;
    }

    public void execute(QueueableContext context){
        try{
            QueueableBaseNode node = getCurrentNodeToExecute();
            string accountId = (string)node.get();
            node.execute();
            if(hasNext()){
                node.finish();
                index += 1;
                if(!Test.isRunningTest()){
                    System.enqueueJob(this);
                }
            }else{
                finish();
            }

        }catch(Exception e){
            // publish custom notification type for the User
            System.debug(e.getMessage());
            System.debug(e.getStackTraceString());
        }

    }


}