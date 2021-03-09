import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CopyPasteIcon extends StatelessWidget {
  const CopyPasteIcon({
    required this.color,
    this.size = const Size(19.54, 12.54),
  });

  final Color color;
  final Size size;

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: size,
      painter: CopyPasteIconPainter(color: color),
    );
  }
}

class CopyPasteIconPainter extends CustomPainter {
  const CopyPasteIconPainter({required this.color});
  final Color color;

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 1
      ..color = color
      ..style = PaintingStyle.stroke;

    canvas.drawLine(Offset.zero, Offset(size.width, 0), paint);
    canvas.drawLine(Offset(0, size.height / 2),
        Offset(size.width * 0.7779, size.height / 2), paint);
    canvas.drawLine(Offset(0, size.height),
        Offset(size.width * 0.5558, size.height), paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    final oldPainter = oldDelegate as CopyPasteIconPainter;
    return oldPainter.color != color;
  }
}
