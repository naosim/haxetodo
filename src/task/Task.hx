package task;
class Task {
    var title: TaskTitle;
    var description: TaskDescription;
    public function new(title: TaskTitle, description: TaskDescription, state: TaskState) {
        this.title = title;
        this.description = description;
    }

    public static function main() {

    }
}
