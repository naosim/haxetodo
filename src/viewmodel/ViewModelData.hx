package viewmodel;
import task.TaskEntity;
@:expose
class ViewModelData {
    public var taskViewDataList: Array<TaskViewData> = [];

    public function applyTaskEntityList(list: Array<TaskEntity>) {
        var newList = [];
        for(entity in list) newList.push(new TaskViewData(entity));
        this.taskViewDataList = newList;
    }
}
