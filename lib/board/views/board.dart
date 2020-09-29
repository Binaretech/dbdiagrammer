import 'package:dbdiagrammer/board/bloc/board_bloc.dart';
import 'package:dbdiagrammer/board/widgets/table.dart' as widgets;
import 'package:dbdiagrammer/models/db_models.dart' as models;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
    return BlocBuilder<BoardBloc, BoardState>(
      builder: (context, state) {
        return Container(
          child: Stack(
            children: [
              ...state.tables.values.map((table) {
                return widgets.Table(
                  onDraggableCanceled: onDragCanceled(table, context),
                  table: table,
                );
              }).toList(),
            ],
          ),
        );
      },
    );
  }
}
