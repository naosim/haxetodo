package viewmodel;
import domain.task.*;
@:expose
interface MainViewModel {
    public function applyTaskEntityList(list: Array<TaskEntity>): Void;
    public function getNewTaskTitle(): String;
    public function clearNewTaskTitle(): Void;
}
