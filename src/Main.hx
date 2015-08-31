package ;
import haxe.Log;
import task.TaskId;
import lib.Entity;
import lib.Error;
import haxe.ds.Either;
import service.TaskService;
import task.TaskState;
import task.TaskDescription;
import task.TaskTitle;
import task.Task;
class Main {
    public static function main() {
        var service: TaskService = new TaskService();
        var task = new Task(new TaskTitle("aaa"), new TaskDescription("bbb"), TaskState.TODO);
        service.insert(task, function(result: Entity<TaskId, Task>): Void {
            trace(result.id);
            service.get(result.id, function(r: Either<Error, Entity<TaskId, Task>>){
                switch r {
                    case Either.Left(err): trace("err");
                    case Either.Right(entity): trace("ok");
                }
            });
        });
    }
}
