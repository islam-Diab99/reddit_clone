import 'package:flutter/material.dart';

class CommentConnectorPainter extends CustomPainter {
  final int depth;

  CommentConnectorPainter({required this.depth});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = const Color(0xff878487)
      ..strokeWidth = 1.0;

    final double x = depth * 16.0 - 8.0;
    canvas.drawLine(Offset(x, 20), Offset(x, size.height), paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
