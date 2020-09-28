import 'package:dbdiagrammer/models/db_models.dart' as db;
import 'package:dbdiagrammer/models/db_types.dart';
import 'package:flutter/material.dart';

class Table extends StatelessWidget {
  final db.Table table;
  final Function(Velocity, Offset) onDraggableCanceled;

  Table({this.table, this.onDraggableCanceled});

  Widget title(BuildContext context) {
    return Expanded(
      flex: 1,
      child: Container(
        constraints: BoxConstraints(minWidth: 150.0),
        child: Center(
          child: Text(
            table.name,
            style: Theme.of(context).textTheme.caption.copyWith(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                ),
          ),
        ),
      ),
    );
  }

  List<Widget> fields(BuildContext context) {
    return table.fields.map((field) {
      return Expanded(
          flex: 1,
          child: Container(
            decoration: BoxDecoration(
              border: BorderDirectional(
                top: BorderSide(color: Colors.black),
              ),
            ),
            padding: EdgeInsets.symmetric(horizontal: 5.0, vertical: 2.0),
            constraints: BoxConstraints(minWidth: 200.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  field.name,
                  style: Theme.of(context).textTheme.caption.copyWith(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                      ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 20.0),
                  child: field.type.toWidget(limit: field.limit),
                ),
                constraints(field, context),
              ],
            ),
          ));
    }).toList();
  }

  Widget constraints(db.Field field, BuildContext context) {
    return Row(
      children: [
        ...field.constraints.map((constraint) {
          return Container(
            padding: EdgeInsets.symmetric(horizontal: 5),
            child: constraint.type.toWidget(),
          );
        }).toList(),
      ],
    );
  }

  Widget buildTable(BuildContext context) {
    return GestureDetector(
      // onTap: () => onTap(context),
      child: Card(
        elevation: 3.0,
        child: Container(
          // width: table.width,
          height: table.height,
          child: Column(
            children: [
              title(context),
              ...fields(context),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: table.position.dx,
      top: table.position.dy - table.height + 20,
      child: Draggable(
        affinity: Axis.horizontal,
        childWhenDragging: Container(),
        child: buildTable(context),
        feedback: Transform(
          child: buildTable(context),
          transform: Matrix4.rotationZ(-0.1),
        ),
        onDraggableCanceled: onDraggableCanceled,
      ),
    );
  }
}
