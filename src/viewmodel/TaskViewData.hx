package viewmodel;
import task.TaskEntity;
@:expose
class TaskViewData {
    var title: String;
    var state: String;
    public function new(taskEntity: TaskEntity) apply(taskEntity);

    public function apply(taskEntity: TaskEntity) {
        this.title = taskEntity.value.title.value;
        this.state = taskEntity.value.state.value;
    }
}
