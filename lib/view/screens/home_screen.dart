import 'package:flutter/material.dart';
import 'package:todo_list/db/database.dart';
import 'package:todo_list/main.dart';
import 'package:todo_list/view/components/list_card.dart';
import 'package:todo_list/view/screens/edit_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Todo> _todoList = [];

  @override
  void initState() {
    super.initState();
    _setTodoList();
    print("initState完了");
  }

  Future<void> _setTodoList() async {
    _todoList = await database.allTodos;

    setState(() {});
    print(_todoList);
    print("todoListロード完了");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () => _tapSort(),
            icon: Icon(Icons.sort),
          ),
        ],
        title: Text("やることリスト"),
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => _startEditScreen(),
      ),
      body: Container(
        child: ListView.builder(
          itemCount: _todoList.length,
          itemBuilder: (BuildContext context, int index) {
            return ListCard(
              toDo: _todoList[index],
              setTodoList: _setTodoList,
            );
          },
        ),
      ),
    );
  }

  _tapSort() async{
    //TODO 優先度順にtodoリストを並び替える
    print("優先度順に並び替える");
    _todoList = await database.allTodosSort;
    setState(() {

    });
  }

  //HomeScreenにpopした時に際描画するための処理
  _startEditScreen() async {
    final result = await Navigator.push(context,
        new MaterialPageRoute<bool>(builder: (context) => EditScreen()));

    if (result != null) {
      if (result) {
        _setTodoList();
        setState(() {});
        print("HomeScreenに戻ってきたよ");
      }
    }
  }
}
