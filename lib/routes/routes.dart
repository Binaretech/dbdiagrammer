import 'package:dbdiagrammer/board/views/board_view.dart';
import 'package:flutter/material.dart';

final _routes = {
  '/': BoardView(),
};

Route routeResolver(RouteSettings settings) {
  return MaterialPageRoute(
    builder: (_) => _routes[settings.name.toLowerCase()] ?? Container(),
  );
}

Route notFoundRoute(RouteSettings settings) {
  return MaterialPageRoute(builder: (_) => Container());
}
