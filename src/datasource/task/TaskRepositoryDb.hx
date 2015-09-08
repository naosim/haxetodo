package datasource.task;
import haxe.ds.Either;
import haxe.ds.HashMap;
import lib.*;
import domain.task.*;
import datasource.task.db.*;

class TaskRepositoryDb implements TaskRepository{
    var taskDbMapper: TaskDbMapper;

    public function new(taskDbMapper: TaskDbMapper) {
        this.taskDbMapper = taskDbMapper;
    }

    public function get(taskId: TaskId, callback: Either<Error, TaskEntity> -> Void): Void {
    }

    public function getAll(callback: Array<TaskEntity> -> Void): Void {
        taskDbMapper.getAll(function(taskRecordList: Array<TaskRecord>) {
            var list = [];
            trace(taskRecordList.length);
            for(record in taskRecordList) {
                trace(record);
                list.push(new TaskEntity(new TaskId(record.id), new TaskTitle(record.title), new TaskState(record.state)));
            }
            callback(list);
        });
    }

    public function insert(task: Task, callback: TaskEntity -> Void): Void {
        taskDbMapper.insert({
            title: task.title.value,
            state: task.state.value
        },
        function(record: TaskRecord) {
            callback(new TaskEntity(new TaskId(record.id), new TaskTitle(record.title), new TaskState(record.state)));
        });
    }

    public function updateStatus(taskId: TaskId, taskState: TaskState, callback: Either<Error, TaskEntity> -> Void): Void {
        taskDbMapper.updateStatus(taskId.value, taskState.value, function(taskRecord: TaskRecord) {
            callback(Either.Right(new TaskEntity(
                new TaskId(taskRecord.id), new TaskTitle(taskRecord.title), new TaskState(taskRecord.state)
            )));
        });
    }
}
