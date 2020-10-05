import 'package:dbdiagrammer/board/bloc/board_bloc.dart';
import 'package:dbdiagrammer/board/views/relation_painter.dart';
import 'package:dbdiagrammer/board/widgets/table.dart' as widgets;
import 'package:dbdiagrammer/models/db_models.dart' as models;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Board extends StatelessWidget {
  Function(DragUpdateDetails) onDrag(models.Table table, BuildContext context) {
    return (details) {
      BoardBloc.of(context).add(TableUpdatedEvent(
          models.Table.copy(table, position: details.globalPosition)));
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
                  table: table,
                  onDrag: onDrag(table, context),
                );
              }).toList(),
            ],
          ),
        );
      },
    );
  }
}
