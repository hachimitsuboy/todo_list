import 'package:flutter/material.dart';
import 'package:todo_list/db/database.dart';
import 'package:todo_list/view/screens/edit_screen.dart';
import 'package:todo_list/view/screens/home_screen.dart';
import 'package:todo_list/view/screens/test_screen.dart';

late MyDatabase database;

void main (){
  database = MyDatabase();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "TodoList",
      theme: ThemeData(
        brightness: Brightness.dark,
      ),
      home: HomeScreen(),
      routes: <String, WidgetBuilder>{
        '/home':(BuildContext context) => new HomeScreen(),
        '/test':(BuildContext context) => new TestScreen(),
      },
    );
  }
}
