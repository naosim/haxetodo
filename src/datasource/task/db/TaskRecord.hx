package datasource.task.db;
typedef TaskRecord = {
    @:optional var id: String;
    var title: String;
    var state: String;
    @:optional var firstAddDate: Float;

    @:optional var _id:String;
    @:optional var c1:Int;
    @:optional var startDate:Float;
    @:optional var endDate:Float;
}