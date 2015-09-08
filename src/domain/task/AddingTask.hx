package domain.task;
class AddingTask implements Task {
    public var title(default, null): TaskTitle;
    public var state(default, null): TaskState;

    public function new(title: TaskTitle, state: TaskState) {
        this.title = title;
        this.state = state;
    }
}
