package datasource.task.db;
@:expose
class TaskDbMapperCollection implements TaskDbMapper {
    var table: CollectionDb<TaskRecord>;
    var idCount = 0;
    public function new(table: CollectionDb<TaskRecord>) {
        this.table = table;
    }

    public function get(taskId: String, callback: TaskRecord -> Void): Void{
        var result: Array<TaskRecord> = table.find(function(a: TaskRecord): Bool {
            return a.id == taskId && a.c1 == 0;
        });
        callback(result != null && result.length > 0 ? result[0] : null);


    }
    public function getAll(callback: Array<TaskRecord> -> Void): Void {
        var result: Array<TaskRecord> = table.find(isLatestRecord, function(a:TaskRecord, b:TaskRecord): Int {
            var value:Int = Std.int(a.firstAddDate - b.firstAddDate);
            return if(value == 0) {
                value;
            } else if(value > 0) {
                1;
            } else {
                -1;
            }
        });
        callback(result);

    }
    public function insert(task: TaskRecord, callback: TaskRecord -> Void): Void{
        var firstAddDate = Date.now().getTime();
        var taskRecord: TaskRecord = {
            id: "task_" + (idCount++),
            title: task.title,
            state: task.state,
            firstAddDate: firstAddDate,
            c1: 0,
            startDate: firstAddDate,
            endDate: -1
        }
        table.save(taskRecord);
        callback(taskRecord);

    }
    public function updateStatus(taskId: String, taskState: String, callback: TaskRecord -> Void): Void{
        var list = table.find(function(a: TaskRecord): Bool { return a.id == taskId; });
        var title = null;
        var firstAddDate = null;
        var date = Date.now().getTime();
        for(oldRecord in list) {
            if(isLatestRecord(oldRecord)) {
                oldRecord.endDate = date;
                title = oldRecord.title;
                firstAddDate = oldRecord.firstAddDate;
            }
            oldRecord.c1++;
            table.save(oldRecord);
        }

        var taskRecord: TaskRecord = {
            id: taskId,
            title: title,
            state: taskState,
            firstAddDate: firstAddDate,
            c1: 0,
            startDate: date,
            endDate: -1
        }
        table.save(taskRecord);
        callback(taskRecord);
    }

    private static function isLatestRecord(record: TaskRecord) {
        return record.c1 == 0;
    }
}
