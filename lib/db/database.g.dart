// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// **************************************************************************
// MoorGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps, unnecessary_this
class Todo extends DataClass implements Insertable<Todo> {
  final String todo;
  final String priority;
  final int deadline;
  Todo({required this.todo, required this.priority, required this.deadline});
  factory Todo.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return Todo(
      todo: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}todo'])!,
      priority: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}priority'])!,
      deadline: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}deadline'])!,
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['todo'] = Variable<String>(todo);
    map['priority'] = Variable<String>(priority);
    map['deadline'] = Variable<int>(deadline);
    return map;
  }

  TodosCompanion toCompanion(bool nullToAbsent) {
    return TodosCompanion(
      todo: Value(todo),
      priority: Value(priority),
      deadline: Value(deadline),
    );
  }

  factory Todo.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return Todo(
      todo: serializer.fromJson<String>(json['todo']),
      priority: serializer.fromJson<String>(json['priority']),
      deadline: serializer.fromJson<int>(json['deadline']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'todo': serializer.toJson<String>(todo),
      'priority': serializer.toJson<String>(priority),
      'deadline': serializer.toJson<int>(deadline),
    };
  }

  Todo copyWith({String? todo, String? priority, int? deadline}) => Todo(
        todo: todo ?? this.todo,
        priority: priority ?? this.priority,
        deadline: deadline ?? this.deadline,
      );
  @override
  String toString() {
    return (StringBuffer('Todo(')
          ..write('todo: $todo, ')
          ..write('priority: $priority, ')
          ..write('deadline: $deadline')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      $mrjf($mrjc(todo.hashCode, $mrjc(priority.hashCode, deadline.hashCode)));
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Todo &&
          other.todo == this.todo &&
          other.priority == this.priority &&
          other.deadline == this.deadline);
}

class TodosCompanion extends UpdateCompanion<Todo> {
  final Value<String> todo;
  final Value<String> priority;
  final Value<int> deadline;
  const TodosCompanion({
    this.todo = const Value.absent(),
    this.priority = const Value.absent(),
    this.deadline = const Value.absent(),
  });
  TodosCompanion.insert({
    required String todo,
    required String priority,
    required int deadline,
  })  : todo = Value(todo),
        priority = Value(priority),
        deadline = Value(deadline);
  static Insertable<Todo> custom({
    Expression<String>? todo,
    Expression<String>? priority,
    Expression<int>? deadline,
  }) {
    return RawValuesInsertable({
      if (todo != null) 'todo': todo,
      if (priority != null) 'priority': priority,
      if (deadline != null) 'deadline': deadline,
    });
  }

  TodosCompanion copyWith(
      {Value<String>? todo, Value<String>? priority, Value<int>? deadline}) {
    return TodosCompanion(
      todo: todo ?? this.todo,
      priority: priority ?? this.priority,
      deadline: deadline ?? this.deadline,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (todo.present) {
      map['todo'] = Variable<String>(todo.value);
    }
    if (priority.present) {
      map['priority'] = Variable<String>(priority.value);
    }
    if (deadline.present) {
      map['deadline'] = Variable<int>(deadline.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TodosCompanion(')
          ..write('todo: $todo, ')
          ..write('priority: $priority, ')
          ..write('deadline: $deadline')
          ..write(')'))
        .toString();
  }
}

class $TodosTable extends Todos with TableInfo<$TodosTable, Todo> {
  final GeneratedDatabase _db;
  final String? _alias;
  $TodosTable(this._db, [this._alias]);
  final VerificationMeta _todoMeta = const VerificationMeta('todo');
  late final GeneratedColumn<String?> toDo = GeneratedColumn<String?>(
      'todo', aliasedName, false,
      typeName: 'TEXT', requiredDuringInsert: true);
  final VerificationMeta _priorityMeta = const VerificationMeta('priority');
  late final GeneratedColumn<String?> priority = GeneratedColumn<String?>(
      'priority', aliasedName, false,
      typeName: 'TEXT', requiredDuringInsert: true);
  final VerificationMeta _deadlineMeta = const VerificationMeta('deadline');
  late final GeneratedColumn<int?> deadline = GeneratedColumn<int?>(
      'deadline', aliasedName, false,
      typeName: 'INTEGER', requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [toDo, priority, deadline];
  @override
  String get aliasedName => _alias ?? 'todos';
  @override
  String get actualTableName => 'todos';
  @override
  VerificationContext validateIntegrity(Insertable<Todo> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('todo')) {
      context.handle(
          _todoMeta, toDo.isAcceptableOrUnknown(data['todo']!, _todoMeta));
    } else if (isInserting) {
      context.missing(_todoMeta);
    }
    if (data.containsKey('priority')) {
      context.handle(_priorityMeta,
          priority.isAcceptableOrUnknown(data['priority']!, _priorityMeta));
    } else if (isInserting) {
      context.missing(_priorityMeta);
    }
    if (data.containsKey('deadline')) {
      context.handle(_deadlineMeta,
          deadline.isAcceptableOrUnknown(data['deadline']!, _deadlineMeta));
    } else if (isInserting) {
      context.missing(_deadlineMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {toDo};
  @override
  Todo map(Map<String, dynamic> data, {String? tablePrefix}) {
    return Todo.fromData(data, _db,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $TodosTable createAlias(String alias) {
    return $TodosTable(_db, alias);
  }
}

abstract class _$MyDatabase extends GeneratedDatabase {
  _$MyDatabase(QueryExecutor e) : super(SqlTypeSystem.defaultInstance, e);
  late final $TodosTable todos = $TodosTable(this);
  @override
  Iterable<TableInfo> get allTables => allSchemaEntities.whereType<TableInfo>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [todos];
}
