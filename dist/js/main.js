// import
var DI = di.DI;
var TaskDbMapperCollection = datasource.task.db.TaskDbMapperCollection;
var MainViewModelForVue = viewmodel.MainViewModelForVue;

var data = new MainViewModelForVue();

var taskCollection = new Collection('taskCollection');
DI.init(data, new TaskDbMapperCollection(taskCollection));
var mainViewController = DI.getInstance().getMainViewController();
var demo = new Vue({
    el: '#demo',
    data: data,
    methods: {
        onAddNewTask: function() {
            mainViewController.addNewTask();
        },
        done: function(task) {
            mainViewController.updateTaskState(task.id, task.state == "todo" ? "done" : "todo");
        }
    }
})
mainViewController.init();
