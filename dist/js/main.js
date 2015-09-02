var todoList = [
    { childMsg: 'Foo' },
    { childMsg: 'Bar' }
];

var data = new viewmodel.ViewModelData();
var viewAction = new viewmodel.ViewAction(data);

var demo = new Vue({
    el: '#demo',
    data: data
})
//data.taskViewDataList

viewAction.init();

console.log(data);