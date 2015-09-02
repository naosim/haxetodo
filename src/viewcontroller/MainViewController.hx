package viewcontroller;
import lib.Error;
import haxe.ds.Either;
import di.DI;
import domain.service.TaskService;
import domain.task.*;
import viewmodel.*;

/**
* jsから呼ばれるアクション
* jsから呼ばれるのでプリミティブな型を使ってもOK
**/
@:expose
class MainViewController {
    var mainViewModel:MainViewModel;
    var service:TaskService;
    public function new(viewModelData:MainViewModel) {
        this.mainViewModel = viewModelData;
        this.service = DI.getInstance().getTaskService();
    }
    public function init() refreshList();
    public function refreshList() service.getAll(mainViewModel.applyTaskEntityList);
    public function addNewTask(){
        if(mainViewModel.getNewTaskTitle().length == 0) return;
        service.insert(new AddingTask(new TaskTitle(mainViewModel.getNewTaskTitle()), TaskState.TODO), function(taskEntity: TaskEntity) {
            init();
            mainViewModel.clearNewTaskTitle();
        });
    }

    public function updateTaskState(taskId: String, taskState: String){
        trace("updateStatus start " + taskId);
        service.updateStatus(new TaskId(taskId), new TaskState(taskState), function(result:Either<Error, TaskEntity>) {
            trace("updateStatus end");
            refreshList();
        });
    }
}
