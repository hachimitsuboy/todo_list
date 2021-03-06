// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// **************************************************************************
// MoorGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps, unnecessary_this
class Todo extends DataClass implements Insertable<Todo> {
  final String toDo;
  final int priority;
  final String deadline;
  Todo({required this.toDo, required this.priority, required this.deadline});
  factory Todo.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return Todo(
      toDo: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}to_do'])!,
      priority: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}priority'])!,
      deadline: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}deadline'])!,
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['to_do'] = Variable<String>(toDo);
    map['priority'] = Variable<int>(priority);
    map['deadline'] = Variable<String>(deadline);
    return map;
  }

  TodosCompanion toCompanion(bool nullToAbsent) {
    return TodosCompanion(
      toDo: Value(toDo),
      priority: Value(priority),
      deadline: Value(deadline),
    );
  }

  factory Todo.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return Todo(
      toDo: serializer.fromJson<String>(json['toDo']),
      priority: serializer.fromJson<int>(json['priority']),
      deadline: serializer.fromJson<String>(json['deadline']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'toDo': serializer.toJson<String>(toDo),
      'priority': serializer.toJson<int>(priority),
      'deadline': serializer.toJson<String>(deadline),
    };
  }

  Todo copyWith({String? toDo, int? priority, String? deadline}) => Todo(
        toDo: toDo ?? this.toDo,
        priority: priority ?? this.priority,
        deadline: deadline ?? this.deadline,
      );
  @override
  String toString() {
    return (StringBuffer('Todo(')
          ..write('toDo: $toDo, ')
          ..write('priority: $priority, ')
          ..write('deadline: $deadline')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      $mrjf($mrjc(toDo.hashCode, $mrjc(priority.hashCode, deadline.hashCode)));
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Todo &&
          other.toDo == this.toDo &&
          other.priority == this.priority &&
          other.deadline == this.deadline);
}

class TodosCompanion extends UpdateCompanion<Todo> {
  final Value<String> toDo;
  final Value<int> priority;
  final Value<String> deadline;
  const TodosCompanion({
    this.toDo = const Value.absent(),
    this.priority = const Value.absent(),
    this.deadline = const Value.absent(),
  });
  TodosCompanion.insert({
    required String toDo,
    required int priority,
    required String deadline,
  })  : toDo = Value(toDo),
        priority = Value(priority),
        deadline = Value(deadline);
  static Insertable<Todo> custom({
    Expression<String>? toDo,
    Expression<int>? priority,
    Expression<String>? deadline,
  }) {
    return RawValuesInsertable({
      if (toDo != null) 'to_do': toDo,
      if (priority != null) 'priority': priority,
      if (deadline != null) 'deadline': deadline,
    });
  }

  TodosCompanion copyWith(
      {Value<String>? toDo, Value<int>? priority, Value<String>? deadline}) {
    return TodosCompanion(
      toDo: toDo ?? this.toDo,
      priority: priority ?? this.priority,
      deadline: deadline ?? this.deadline,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (toDo.present) {
      map['to_do'] = Variable<String>(toDo.value);
    }
    if (priority.present) {
      map['priority'] = Variable<int>(priority.value);
    }
    if (deadline.present) {
      map['deadline'] = Variable<String>(deadline.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TodosCompanion(')
          ..write('toDo: $toDo, ')
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
  final VerificationMeta _toDoMeta = const VerificationMeta('toDo');
  late final GeneratedColumn<String?> toDo = GeneratedColumn<String?>(
      'to_do', aliasedName, false,
      typeName: 'TEXT', requiredDuringInsert: true);
  final VerificationMeta _priorityMeta = const VerificationMeta('priority');
  late final GeneratedColumn<int?> priority = GeneratedColumn<int?>(
      'priority', aliasedName, false,
      typeName: 'INTEGER', requiredDuringInsert: true);
  final VerificationMeta _deadlineMeta = const VerificationMeta('deadline');
  late final GeneratedColumn<String?> deadline = GeneratedColumn<String?>(
      'deadline', aliasedName, false,
      typeName: 'TEXT', requiredDuringInsert: true);
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
    if (data.containsKey('to_do')) {
      context.handle(
          _toDoMeta, toDo.isAcceptableOrUnknown(data['to_do']!, _toDoMeta));
    } else if (isInserting) {
      context.missing(_toDoMeta);
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
