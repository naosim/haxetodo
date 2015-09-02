package datasource.task.db;

interface TaskDbMapper {
    public function get(taskId: String, callback: TaskRecord -> Void): Void;
    public function getAll(callback: Array<TaskRecord> -> Void): Void;
    public function insert(task: TaskRecord, callback: TaskRecord -> Void): Void;
    public function updateStatus(taskId: String, taskState: String, callback: TaskRecord -> Void): Void;
}