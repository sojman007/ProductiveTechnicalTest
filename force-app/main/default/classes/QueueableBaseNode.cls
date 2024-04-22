public without sharing abstract class  QueueableBaseNode {
    
    public abstract object get();
    public abstract void execute();
    public abstract void finish();
    protected QueueableBaseLink parent;

    public void setParent(QueueableBaseLink parent){
        this.parent = parent;
    }
    

}