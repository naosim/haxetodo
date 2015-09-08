package di;
import viewmodel.MainViewModel;
import viewcontroller.MainViewController;
import domain.service.TaskService;
import datasource.task.TaskRepositoryDb;
import domain.task.TaskRepository;
import datasource.task.db.TaskDbMapper;
@:expose
class DI {
    private static var instance: DI;
    public static function init(viewModelData: MainViewModel, taskDbMapper: TaskDbMapper) {
        instance = new DI(viewModelData, taskDbMapper);
    }

    public static function getInstance():DI {
        return instance;
    }


    private var viewModelData: MainViewModel;
    private var taskDbMapper: TaskDbMapper;

    private var taskRepository: TaskRepository;
    private var taskService: TaskService;
    private var mainViewController: MainViewController;

    public function new(viewModelData: MainViewModel, taskDbMapper: TaskDbMapper) {
        this.viewModelData = viewModelData;
        this.taskDbMapper = taskDbMapper;
    }

    public function getViewModelData() {
        return viewModelData;
    }
    public function getTaskDbMapper() {
        return taskDbMapper;
    }

    public function getTaskRepository() {
        if(taskRepository == null) this.taskRepository = new TaskRepositoryDb(getTaskDbMapper());
        return taskRepository;
    }
    public function getTaskService() {
        if(taskService == null) taskService = new TaskService(getTaskRepository());
        return taskService;
    }

    public function getMainViewController() {
        if(mainViewController == null) mainViewController = new MainViewController(getViewModelData());
        return mainViewController;
    }
}
