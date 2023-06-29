import 'package:flutter/material.dart';
import 'package:todoapp/constants/colors.dart';
import 'package:todoapp/model/todo.dart';

class Todoitems extends StatelessWidget {
  final todo Todo;
  final onTodoChanged;
  final onDelete;
  final addTodo;
  const Todoitems(
      {Key? key,
      required this.Todo,
      required this.onTodoChanged,
      required this.onDelete,
      required  this.addTodo,
      })
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 15),
      child: ListTile(
          onTap: () {
            onTodoChanged(Todo);
          },
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          contentPadding: EdgeInsets.symmetric(vertical: 5, horizontal: 20),
          tileColor: Colors.white,
          leading: Icon(
            Todo.isDone ? Icons.check_box : Icons.check_box_outline_blank,
            color: tdBlue,
          ),
          title: Text(
            Todo.TodoText!,
            style: TextStyle(
                fontSize: 16,
                color: tdBlack,
                decoration: Todo.isDone
                    ? TextDecoration.lineThrough
                    : TextDecoration.none),
          ),
          trailing: Container(
            height: 35,
            width: 35,
            padding: EdgeInsets.all(0),
            margin: EdgeInsets.symmetric(vertical: 8),
            decoration: BoxDecoration(
                color: tdRed, borderRadius: BorderRadius.circular(5)),
            child: IconButton(
              onPressed: () {onDelete(Todo.id);},
              color: Colors.white,
              icon: const Icon(Icons.delete),
            ),
          )),
    );
  }
}
