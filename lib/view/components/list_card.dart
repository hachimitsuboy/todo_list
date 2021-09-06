import 'package:flutter/material.dart';
import 'package:todo_list/db/database.dart';
import 'package:todo_list/main.dart';

class ListCard extends StatelessWidget {
  final Todo toDo;


  ListCard({required this.toDo});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.indigoAccent,
      elevation: 10.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: ListTile(
        title: Text(toDo.toDo),
        subtitle: Text("期限:${toDo.deadline}"),
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
    switch (toDo.priority) {
      case 1:
        return Text(
          "高",
          style: TextStyle(fontSize: 18.0, color: Colors.red),
        );

      case 2:
        return Text(
          "中",
          style: TextStyle(fontSize:  18.0, color: Colors.yellow),
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

  _tapDelete() async{
    await database.deleteTodo(toDo);
    print("TODOを消した");

  }
}
