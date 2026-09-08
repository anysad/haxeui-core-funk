package haxe.ui.events;

class ReorderEvent extends UIEvent {
    public static final REORDER_START:EventType<ReorderEvent> = EventType.name("reorderstart");
    public static final REORDER:EventType<ReorderEvent> = EventType.name("reorder");
    public static final REORDER_END:EventType<ReorderEvent> = EventType.name("reordered");

    public override function clone():ReorderEvent {
        var c:ReorderEvent = new ReorderEvent(this.type);
        c.type = this.type;
        c.bubble = this.bubble;
        c.target = this.target;
        c.data = this.data;
        c.value = this.value;
        c.previousValue = this.previousValue;
        c.canceled = this.canceled;
        c.relatedEvent = this.relatedEvent;
        c.relatedComponent = this.relatedComponent;
        // c.left = this.left;
        // c.top = this.top;
        postClone(c);
        return c;
    }
    
    public override function copyFrom(c:UIEvent) {
        var d = cast(c, ReorderEvent);
        // left = d.left;
        // top = d.top;
    }
}