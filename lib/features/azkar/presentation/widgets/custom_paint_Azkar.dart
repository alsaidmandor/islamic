import 'package:flutter/material.dart';

class RPSCustomPainter extends CustomPainter {
  final BuildContext context;

  @override
  void paint(Canvas canvas, Size size) {
    // Layer 1

    Paint paint_fill_0 = Paint()
      ..color = Theme.of(context).colorScheme.background
      ..style = PaintingStyle.fill
      ..strokeWidth = size.width * 0.00
      ..strokeCap = StrokeCap.butt
      ..strokeJoin = StrokeJoin.miter;

    Path path_0 = Path();
    path_0.moveTo(size.width * -0.0037535, size.height * 0.5048531);
    path_0.quadraticBezierTo(size.width * 0.1874242, size.height * 0.5027121,
        size.width * 0.3423898, size.height * 0.4986791);
    path_0.cubicTo(
        size.width * 0.4149020,
        size.height * 0.4876755,
        size.width * 0.3933625,
        size.height * 0.1313500,
        size.width * 0.4991625,
        size.height * 0.1325000);
    path_0.cubicTo(
        size.width * 0.5987625,
        size.height * 0.1190000,
        size.width * 0.5878500,
        size.height * 0.5023000,
        size.width * 0.6546806,
        size.height * 0.5038075);
    path_0.quadraticBezierTo(size.width * 0.8519710, size.height * 0.4984302,
        size.width * 1.0028823, size.height * 0.4960403);
    path_0.lineTo(size.width, size.height);
    path_0.lineTo(0, size.height);

    canvas.drawPath(path_0, paint_fill_0);

    // Layer 1

    Paint paint_stroke_0 = Paint()
      ..color = Theme.of(context).colorScheme.outlineVariant.withOpacity(0.1)
      ..style = PaintingStyle.stroke
      ..strokeWidth = size.width * 0.00
      ..strokeCap = StrokeCap.butt
      ..strokeJoin = StrokeJoin.round;

    canvas.drawPath(path_0, paint_stroke_0);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }

  const RPSCustomPainter({
    required this.context,
  });
}
