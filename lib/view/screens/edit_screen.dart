import 'package:flutter/material.dart';
import 'dart:async';
import 'package:intl/intl.dart';


class EditScreen extends StatefulWidget {
  const EditScreen({Key? key}) : super(key: key);

  @override
  _EditScreenState createState() => _EditScreenState();
}

class _EditScreenState extends State<EditScreen> {
  TextEditingController _todoEditingController = TextEditingController();

  String _dropdownValue = "高";
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
        value: "高",
      ))
      ..add(DropdownMenuItem(
        child: Text("中"),
        value: "中",
      ))
      ..add(DropdownMenuItem(
        child: Text("低"),
        value: "低",
      ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
          SizedBox(
            height: 30,
          ),
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
            height: 30,
          ),
          Text("優先度"),
          DropdownButton(
            items: _priorityList,
            value: _dropdownValue,
            onChanged: (String? value) {
              print(value);
              setState(() {
                _dropdownValue = value!;
              });
            },
          ),
          ElevatedButton(

            onPressed: () => tapRegistration(context),
            child: Text(
              "登録",
              style: TextStyle(fontSize: 20),
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

  tapRegistration(BuildContext context) {
    //TODO DBに登録
    print("押されたよおお");
    //なぜかここが原因で画面遷移しなかった
    // Navigator.of(context).pop();
    // Navigator.pop(context, true);
  }
}
