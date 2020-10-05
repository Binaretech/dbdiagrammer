import 'package:flutter/material.dart';

class RelationPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final from = Offset(100, 100);
    final to = Offset(300, 100);

    Paint paint = Paint()
      ..color = Colors.blue
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2.0;

    Path path = Path();

    path.moveTo(from.dx, from.dy);
    path.lineTo(to.dx, to.dy);
    canvas.drawPath(path, paint);

    // final markOrigin = findPointY(from, to, to.dx - 20);

    // Paint paint2 = Paint()
    //   ..color = Colors.red
    //   ..style = PaintingStyle.stroke
    //   ..strokeWidth = 4.0;

    // Path path2 = Path();

    // path2.moveTo(markOrigin.dx, markOrigin.dy);
    // path2.lineTo(to.dx, to.dy + 10);
    // canvas.drawPath(path2, paint2);
  }

  Offset findPointY(Offset from, Offset to, double x) {
    final m = slope(from, to);
    final b = independentTerm(from, m);
    return Offset(x, (m * x) + b);
  }

  double slope(Offset from, Offset to) {
    final x = to.dx - from.dx;
    final y = to.dy - from.dy;

    return y / x;
  }

  double independentTerm(Offset point, double slope) {
    return point.dy - (slope * point.dx);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
