import 'package:dbdiagrammer/board/bloc/board_bloc.dart';
import 'package:dbdiagrammer/board/widgets/table.dart' as widgets;
import 'package:dbdiagrammer/models/db_models.dart' as models;
import 'package:flutter/material.dart';

class Board extends StatelessWidget {
  Function(Velocity, Offset) onDragCanceled(
      models.Table table, BuildContext context) {
    return (velocity, offset) {
      BoardBloc.of(context)
          .add(TableUpdatedEvent(models.Table.copy(table, position: offset)));
    };
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: [
          ...BoardBloc.of(context).state.tables.values.map((table) {
            return widgets.Table(
              onDraggableCanceled: onDragCanceled(table, context),
              table: table,
            );
          }).toList(),
        ],
      ),
    );
  }
}
