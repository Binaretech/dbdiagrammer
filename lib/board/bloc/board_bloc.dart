import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'board_event.dart';
part 'board_state.dart';

class BoardBloc extends Bloc<BoardEvent, BoardState> {
  BoardBloc() : super(BoardInitial());

  @override
  Stream<BoardState> mapEventToState(
    BoardEvent event,
  ) async* {
    // TODO: implement mapEventToState
  }
}
