import 'package:flutter/material.dart';
import 'dart:async';
import 'package:intl/intl.dart';
import 'package:todo_list/db/database.dart';
import 'package:todo_list/main.dart';

class EditScreen extends StatefulWidget {
  const EditScreen({Key? key}) : super(key: key);

  @override
  _EditScreenState createState() => _EditScreenState();
}

class _EditScreenState extends State<EditScreen> {
  TextEditingController _todoEditingController = TextEditingController();

  String _priorityValue = "1";
  String _deadLine = "";
  List<DropdownMenuItem<String>> _priorityList = [];

  @override
  void initState() {
    setPriorityList();
    super.initState();
  }

  void setPriorityList() {
    _priorityList
      ..add(DropdownMenuItem(
        child: Text("高"),
        value: "1",
      ))
      ..add(DropdownMenuItem(
        child: Text("中"),
        value: "2",
      ))
      ..add(DropdownMenuItem(
        child: Text("低"),
        value: "3",
      ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () => tapRegistration(context),
            icon: Icon(Icons.done),
            tooltip: "登録",
          ),
        ],
        title: Text("登録画面"),
        centerTitle: true,
      ),
      body: Column(
        children: [
          SizedBox(
            height: 50,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 35.0),
            child: TextField(
              controller: _todoEditingController,
              decoration: InputDecoration(
                labelText: "やることを入力してください",
              ),
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(height: 80),
          Text(
            "締め切り",
            style: TextStyle(fontSize: 20),
          ),
          Text(
            _deadLine,
            style: TextStyle(fontSize: 15),
          ),
          IconButton(
              onPressed: () => openCalender(context),
              icon: Icon(Icons.date_range_sharp)),
          SizedBox(
            height: 50,
          ),
          Text("優先度"),
          DropdownButton(
            items: _priorityList,
            value: _priorityValue,
            onChanged: (String? value) {
              print(value);
              setState(() {
                _priorityValue = value!;
              });
            },
          ),
          SizedBox(height: 100),
          SizedBox(
            height: 50,
            width: 120,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Colors.tealAccent,
                onPrimary: Colors.black,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
              onPressed: () => tapRegistration(context),
              child: Text(
                "登録",
                style: TextStyle(fontSize: 20),
              ),
            ),
          )
        ],
      ),
    );
  }

  Future<void> openCalender(BuildContext context) async {
    final DateTime? selected = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2015),
      lastDate: DateTime(2022),
    );
    if (selected != null) {
      setState(() {
        _deadLine = (DateFormat.yMMMd()).format(selected);
      });
    }
  }

  tapRegistration(BuildContext context) async{
    //TODO DBに登録

    if (_todoEditingController.text == "") {
      return;
    }

    var _priorityIntValue = 0;
    switch (_priorityValue) {
      case "1":
        _priorityIntValue = 1;
        break;
      case "2":
        _priorityIntValue = 2;
        break;
      case "3":
        _priorityIntValue = 3;
        break;
    }

    Todo todo = Todo(
      toDo: _todoEditingController.text,
      priority: _priorityIntValue,
      deadline: _deadLine,
    );

    print(todo);
    await database.addTodo(todo);
    _todoEditingController.text = "";

    //TODO 登録完了メッセージを表示させる

    Navigator.pop(context,true);
  }
}

//TODO 画面に黄色いテープ見たいなエラーが発生する
//ScaffoldにresizeToAvoidBottomInset: falseを追加する。
