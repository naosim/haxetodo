package domain.task;
interface Task {
    public var title(default, null): TaskTitle;
    public var state(default, null): TaskState;
}
