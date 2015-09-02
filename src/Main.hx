package ;

import datasource.task.db.TaskDbMapperCollection;
import di.DI;
import haxe.Log;
import haxe.ds.Either;
import viewmodel.*;
import viewcontroller.*;
class Main {
    // 別にいらないけど コンパイル通すために必要
    var b:MainViewController;
    var a:MainViewModelForVue;
    var di:DI;
    var taskDbMapperCollection:TaskDbMapperCollection;

    public static function main() {}
}
