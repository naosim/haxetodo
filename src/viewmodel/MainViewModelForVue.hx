package viewmodel;
import domain.task.*;
@:expose
class MainViewModelForVue implements MainViewModel {
    public var taskViewDataList: Array<TaskViewModel> = [];
    public var newTaskTitle: String = "aa";

    @Override
    public function applyTaskEntityList(list: Array<TaskEntity>): Void {
        var newList = [];
        for(entity in list) newList.push(new TaskViewModel(entity));
        this.taskViewDataList = newList;
    }

    @Override
    public function getNewTaskTitle(): String {
        return newTaskTitle;
    }

    @Override
    public function clearNewTaskTitle(): Void {
        newTaskTitle = "";
    }
}
