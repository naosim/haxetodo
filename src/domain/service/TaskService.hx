package domain.service;
import haxe.ds.Either;
import haxe.ds.HashMap;
import lib.*;
import domain.task.*;

@:expose
class TaskService {
    var taskRepository: TaskRepository;
    public function new(taskRepository: TaskRepository) {
        this.taskRepository = taskRepository;
    }

    public function get(taskId: TaskId, callback: Either<Error, TaskEntity> -> Void): Void {
        taskRepository.get(taskId, callback);
    }

    public function getAll(callback: Array<TaskEntity> -> Void): Void {
        taskRepository.getAll(callback);
    }

    public function insert(task: Task, callback: TaskEntity -> Void): Void {
        taskRepository.insert(task, callback);
    }

    public function updateStatus(taskId: TaskId, taskState: TaskState, callback: Either<Error, TaskEntity> -> Void): Void {
        taskRepository.updateStatus(taskId, taskState, callback);
    }
}
