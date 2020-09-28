import 'package:dbdiagrammer/board/bloc/board_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BoardView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => BoardBloc(),
      child: Container(),
    );
  }
}
