package domain.task;
class TaskEntity implements Task {
    public var id(default, null): TaskId;
    public var title(default, null): TaskTitle;
    public var state(default, null): TaskState;

    public function new(id: TaskId, title: TaskTitle, state: TaskState) {
        this.id = id;
        this.title = title;
        this.state = state;
    }

    public static function createFromTask(id: TaskId, task:Task):TaskEntity {
        return new TaskEntity(id, task.title, task.state);
    }
}
