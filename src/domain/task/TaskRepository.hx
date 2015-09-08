package domain.task;
import lib.Error;
import haxe.ds.Either;
interface TaskRepository {
    public function get(taskId: TaskId, callback: Either<Error, TaskEntity> -> Void): Void;
    public function getAll(callback: Array<TaskEntity> -> Void): Void;
    public function insert(task: Task, callback: TaskEntity -> Void): Void;
    public function updateStatus(taskId: TaskId, taskState: TaskState, callback: Either<Error, TaskEntity> -> Void): Void;
}