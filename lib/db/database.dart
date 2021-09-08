import 'package:moor/ffi.dart';
import 'package:moor/moor.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;
import 'dart:io';

part 'database.g.dart';

class Todos extends Table {
  TextColumn get toDo => text()();

  IntColumn get priority => integer()();

  TextColumn get deadline => text()();

  @override
  // TODO: implement primaryKey
  Set<Column>? get primaryKey => {toDo};
}

LazyDatabase _openConnection() {
  // the LazyDatabase util lets us find the right location for the file async.
  return LazyDatabase(() async {
    // put the database file, called db.sqlite here, into the documents folder
    // for your app.
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'db.sqlite'));
    return VmDatabase(file);
  });
}

@UseMoor(tables: [Todos])
class MyDatabase extends _$MyDatabase {
  // we tell the database where to store the data with this constructor
  MyDatabase() : super(_openConnection());

  // you should bump this number whenever you change or add a table definition. Migrations
  // are covered later in this readme.
  @override
  int get schemaVersion => 1;

  //create
  Future addTodo(Todo todo) => into(todos).insert(todo);

  //read
  Future<List<Todo>> get allTodos => select(todos).get();

  //update
  Future updateTodo(Todo todo) => update(todos).replace(todo);

  //delete
  Future deleteTodo(Todo todo) =>
      (delete(todos)..where((tbl) => tbl.toDo.equals(todo.toDo))).go();

  //sort
  Future<List<Todo>> get allTodosSort => (select(todos)
        ..orderBy([(tbl) => OrderingTerm(expression: tbl.priority)]))
      .get();
}
