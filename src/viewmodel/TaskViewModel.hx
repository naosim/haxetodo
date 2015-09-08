package viewmodel;
import domain.task.*;
@:expose
class TaskViewModel {
    var id: String;
    var title: String;
    var state: String;
    public function new(taskEntity: TaskEntity) apply(taskEntity);

    public function apply(taskEntity: TaskEntity) {
        this.id = taskEntity.id.value;
        this.title = taskEntity.title.value;
        this.state = taskEntity.state.value;
    }
}