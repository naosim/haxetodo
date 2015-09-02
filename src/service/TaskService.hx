package service;
import haxe.ds.Either;
import haxe.ds.HashMap;
import lib.*;
import task.*;

@:expose
class TaskService {
    var map:Map<String, TaskEntity> = new Map<String, TaskEntity>();
    var idCount = 0;


    public function new() {
        var sample = new TaskEntity(new TaskId("001"), new Task(new TaskTitle("aaaa"), new TaskDescription("bbbb"), TaskState.TODO));
        map.set(sample.id.value, sample);
    }

    public function get(taskId: TaskId, callback: Either<Error, TaskEntity> -> Void): Void {
        var result = this.map.get(taskId.getValue());
        callback(result == null ? Either.Left(new Error("not found")) : Either.Right(result));
    }

    public function getAll(callback: Array<TaskEntity> -> Void): Void {
        var result = [];
        for(entity in map) {
            result.push(entity);
        }
        callback(result);
    }

    public function insert(task: Task, callback: TaskEntity -> Void): Void {
        var id = "task_" + idCount;
        var result: TaskEntity = new TaskEntity(new TaskId(id), task);
        map.set(id, result);
        idCount++;
        callback(result);
    }

    public function updateStatus(taskId: TaskId, taskState: TaskState, callback: Either<Error, TaskEntity> -> Void): Void {
        var entity:TaskEntity = map.get(taskId.value);
        if(entity == null) {
            callback(Either.Left(new Error("not found")));
            return;
        }

        entity.value.state = taskState;
        callback(Either.Right(entity));
    }
}
