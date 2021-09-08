import 'package:flutter/material.dart';
import 'package:todo_list/db/database.dart';
import 'package:todo_list/main.dart';

class ListCard extends StatefulWidget {
  final Todo toDo;
  VoidCallback setTodoList;

  ListCard({required this.toDo, required this.setTodoList});

  @override
  _ListCardState createState() => _ListCardState();
}

class _ListCardState extends State<ListCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.indigoAccent,
      elevation: 10.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: ListTile(
        title: Text(widget.toDo.toDo),
        subtitle: Text("期限:${widget.toDo.deadline}"),
        onLongPress: () => _tapDelete(),
        trailing: Column(
          children: [
            SizedBox(height: 3.8),
            Text(
              "優先度",
              style: TextStyle(fontSize: 10.0),
            ),
            SizedBox(height: 3.0),
            _priorityShow(),
          ],
        ),
      ),
    );
  }

  Text _priorityShow() {
    switch (widget.toDo.priority) {
      case 1:
        return Text(
          "高",
          style: TextStyle(fontSize: 18.0, color: Colors.red),
        );

      case 2:
        return Text(
          "中",
          style: TextStyle(fontSize: 18.0, color: Colors.yellow),
        );

      case 3:
        return Text(
          "低",
          style: TextStyle(fontSize: 18.0, color: Colors.green),
        );

      default:
        return Text(
          "高",
          style: TextStyle(fontSize: 18.0, color: Colors.red),
        );
    }
  }

  _tapDelete() async {
    await database.deleteTodo(widget.toDo);
    widget.setTodoList();
    print("TODOを消した");
  }
}
