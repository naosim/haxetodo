package service;
import haxe.ds.Either;
import haxe.ds.HashMap;
import lib.*;
import task.*;
class TaskService {
    var map:Map<String, Entity<TaskId, Task>> = new Map<String, Entity<TaskId, Task>>();
    var idCount = 0;


    public function new() {
    }

    public function get(taskId: TaskId, callback: Either<Error, Entity<TaskId, Task>> -> Void) {
        var result = this.map.get(taskId.getValue());
//        var obj:Either<Int, String> = true ? Either.Left(1) : Either.Right("hoge");
//        var a:Either<Error, Entity<TaskId, Task>> = ;
        callback(result == null ? Either.Left(new Error("not found")) : Either.Right(result));
    }

    public function insert(task: Task, callback: Entity<TaskId, Task> -> Void) {
        var id = "task_" + idCount;
        var result: Entity<TaskId, Task> = new Entity(new TaskId(id), task);
        map.set(id, result);
        idCount++;
        callback(result);
    }

    public function update(taskEntity: Entity<TaskId, Task>, callback: Either<Error, Entity<TaskId, Task>> -> Void) {

    }
}
//
//abstract AcceptEither<A,B> (Either<A,B>) {
//
//    public inline function new( e:Either<A,B> ) this = e;
//
//    public var value(get,never):Dynamic;
//    public var type(get,never):Either<A,B>;
//
//    inline function get_value() switch this { case Left(v) | Right(v): return v; }
//    @:to inline function get_type() return this;
//
//    @:from static function fromA(v:A) return new AcceptEither( Left(v) );
//    @:from static function fromB(v:B) return new AcceptEither( Right(v) );
//}
