import 'package:flutter/material.dart';

class TestScreen extends StatefulWidget {
  const TestScreen({Key? key}) : super(key: key);

  @override
  _TestScreenState createState() => _TestScreenState();
}

class _TestScreenState extends State<TestScreen> {

  TextEditingController _todoEditingController = TextEditingController();

  String _dropdownValue = "高";
  String _deadLine = "";
  List<DropdownMenuItem<String>> _priorityList = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("test画面"),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Text("テスト画面に遷移完了"),
        ],
      ),
    );
  }
}
