package task;
import lib.Value;

class TaskState extends Value<String> {
    public static var TODO = new TaskState("todo");
    public static var DOING = new TaskState("doing");
    public static var DONE = new TaskState("done");
}
