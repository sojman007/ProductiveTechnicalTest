public with sharing abstract class QueueableBaseLink implements Queueable {
    
    protected List<QueueableBaseNode> nodes;
    protected integer index = 0;

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
        system.debug('total numnber of nodes : ' + nodes.size());
        System.debug('current index ' + index);
        return   (nodes.size() - 1) > index;
    }

    public void execute(QueueableContext context){
        try{
            QueueableBaseNode node = getCurrentNodeToExecute();
            node.execute();
            node.finish();
            

        }catch(Exception e){
            // publish custom notification type for the User
            System.debug(e.getMessage());
            System.debug(e.getStackTraceString());
        }
        
        if(hasNext()){
            index += 1;
            if(!Test.isRunningTest()){
                System.enqueueJob(this);
            }else{
                //mimic execution of other nodes
                execute(null);
            }
        }else{
            finish();
        }
    }


}