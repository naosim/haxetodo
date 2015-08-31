package task;
class TaskState {
    public static var TODO = new TaskState("todo");
    public static var DOING = new TaskState("doing");
    public static var DONE = new TaskState("done");

    var state: String;
    function new(state: String) {
        this.state = state;
    }
}
