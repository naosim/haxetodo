package viewmodel;
import task.TaskEntity;
import service.TaskService;

/**
* jsから呼ばれるアクション
* jsから呼ばれるのでプリミティブな型を使ってもOK
**/
@:expose
class ViewAction {
    var viewModelData:ViewModelData;
    var service = new TaskService();
    public function new(viewModelData:ViewModelData) this.viewModelData = viewModelData;
    public function init(): Void service.getAll(viewModelData.applyTaskEntityList);
    public function add(title:String){

    }
}
