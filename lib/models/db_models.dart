import 'package:dbdiagrammer/models/db_types.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class Table extends Equatable {
  final Offset position;

  final double height;

  final Color headerColor = Colors.blue;
  final TextStyle textStyle = TextStyle(
    color: Colors.black,
    fontSize: 14,
  );

  final Color borderColor = Colors.black;

  final String name;
  final List<Field> fields;

  Table(
    this.name, {
    this.position = const Offset(100, 100),
    this.fields = const [],
  }) : this.height = (fields.length + 1) * 20.0;

  Table.copy(Table table, {String name, Offset position, List<Field> fields})
      : this.name = name ?? table.name,
        this.position = position ?? table.position,
        this.fields = fields ?? table.fields,
        this.height = ((fields ?? table.fields).length + 1) * 22.0;

  @override
  List<Object> get props => [name];
}

class Field extends Equatable {
  final Color backgroundColor = Colors.white;
  final TextStyle textStyle = TextStyle(
    color: Colors.black,
    fontSize: 12,
  );

  final Color borderColor = Colors.black;

  final String name;
  final Type type;

  final int limit;

  final List<Constrainst> constraints = [];

  Field(this.name, this.type, [this.limit]);

  @override
  List<Object> get props => [name, type, limit];
}

class Constrainst extends Equatable {
  final TextStyle textStyle = TextStyle(
    color: Colors.black,
    fontSize: 12,
  );

  final ConstraintType type;

  Constrainst(this.type);

  @override
  List<Object> get props => [type];
}

class Relation {
  int to;
  RelationType type;
}
