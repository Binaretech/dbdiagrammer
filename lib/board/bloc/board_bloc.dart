import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dbdiagrammer/models/db_models.dart' as models;
import 'package:dbdiagrammer/models/db_types.dart' as dbtypes;
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'board_event.dart';
part 'board_state.dart';

class BoardBloc extends Bloc<BoardEvent, BoardState> {
  BoardBloc() : super(BoardState({}));

  static BoardBloc of(BuildContext context) =>
      BlocProvider.of<BoardBloc>(context);

  @override
  Stream<BoardState> mapEventToState(
    BoardEvent event,
  ) async* {
    if (event is TableAddedEvent) {
      yield _mapTableAddedEventToState(event);
    }

    if (event is TableUpdatedEvent) {
      yield _mapTableUpdatedEventToState(event);
    }

    if (event is TableDeletedEvent) {
      yield _mapTableDeletedEventToState(event);
    }
  }

  BoardState _mapTableAddedEventToState(TableAddedEvent event) {
    return BoardState(Map.of(state.tables)..[event.table.name] = event.table);
  }

  BoardState _mapTableUpdatedEventToState(TableUpdatedEvent event) {
    return BoardState(Map.of(state.tables)..[event.table.name] = event.table);
  }

  BoardState _mapTableDeletedEventToState(TableDeletedEvent event) {
    return BoardState(Map.of(state.tables)..remove(event.table.name));
  }
}
