import 'package:flutter/material.dart';

class Todo{
  final String title;
  final String description;

  Todo({@required this.title,@required this.description})
    : assert(title != null),
      assert(description != null);
}

void main()=>runApp(MaterialApp(
  title: 'Navigation',
  home: TodoScreen(
    //this code is sample so,create list by machine
    todos:List<Todo>.generate(20,(i) =>Todo(
      title: 'TODO $i',
      description: 'TODO $i の詳細',
    ) ),
  ),
));

class TodoScreen extends StatelessWidget{
  final List<Todo> _todos;
  TodoScreen({key key,@required List<Todo> todos})
    :assert(todos != null),
    this._todos = todos,
    super(key:key);
  
  @override 
  Widget build(BuildContext context)=>Scaffold (
    appBar: AppBar(
      title: Text('ToDoList'),
      ),
    body: ListView.builder(
      itemCount: _todos.length,
      itemBuilder: (context,index)=>ListTile(
        title:Text(_todos[index].title),
        onTap: () {
          // ToDo の詳細画面にいくやつ
        
        }
      ),
    ),
  );
}

class DetailScreen extends StatelessWidget{

  final Todo _todo;

  DetailScreen({key key,@required Todo todo})
    : assert(todo != null,
    this._todo = todo,
    super(Key:key);
@override
Widget build(BuildContext context) => Scaffold(
  appBar:AppBar(
    title: Text(_todo.title),
  ) ,
  body: Padding(
    padding:EdgeInsets.all(16.0) ,
    child: Text(_todo.description),
    ),
  );

}