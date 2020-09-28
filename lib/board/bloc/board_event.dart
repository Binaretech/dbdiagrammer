part of 'board_bloc.dart';

abstract class BoardEvent extends Equatable {
  const BoardEvent();

  @override
  List<Object> get props => [];
}

class TableAddedEvent extends BoardEvent {
  final models.Table table;

  TableAddedEvent(this.table);

  @override
  List<Object> get props => [table];
}

class TableUpdatedEvent extends BoardEvent {
  final models.Table table;

  TableUpdatedEvent(this.table);

  @override
  List<Object> get props => [table];
}

class TableDeletedEvent extends BoardEvent {
  final models.Table table;

  TableDeletedEvent(this.table);

  @override
  List<Object> get props => [table];
}
