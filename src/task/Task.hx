package task;
class Task {
    public var title: TaskTitle;
    var description: TaskDescription;
    public var state: TaskState;
    public function new(title: TaskTitle, description: TaskDescription, state: TaskState) {
        this.title = title;
        this.description = description;
        this.state = state;
    }

    public static function main() {}
}
