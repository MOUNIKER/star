import 'dart:math';

import 'package:flutter/material.dart';

class CustomStarIcon extends StatelessWidget {
  final Color color;
  final double size;

  CustomStarIcon({required this.color, required this.size});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      child: CustomPaint(
        painter: StarPainter(color),
      ),
    );
  }
}

class StarPainter extends CustomPainter {
  final Color color;

  StarPainter(this.color);

  @override
  void paint(Canvas canvas, Size size) {
    final double radius = size.width / 2;
    final double centerX = size.width / 2;
    final double centerY = size.height / 2;

    final double angle = pi / 5; // 36 degrees for each point of the star
    final double shortRadius = radius * sin(angle / 2) / cos(angle);

    final Paint paint = Paint()
      ..color = color
      ..strokeCap = StrokeCap.round
      ..strokeWidth = size.width / 10;

    final Path path = Path();

    for (int i = 0; i < 5; i++) {
      double x = centerX + cos(2 * i * pi / 5) * radius;
      double y = centerY + sin(2 * i * pi / 5) * radius;
      if (i == 0) {
        path.moveTo(x, y);
      } else {
        path.lineTo(x, y);
      }
      x = centerX + cos((2 * i + 1) * pi / 5) * shortRadius;
      y = centerY + sin((2 * i + 1) * pi / 5) * shortRadius;
      path.lineTo(x, y);
    }
    path.close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}

Widget buildRatingIndicator(double rating) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: List.generate(5, (index) {
      if (index < rating.floor()) {
        return CustomStarIcon(color: Colors.amber, size: 40);
      } else if (index == rating.floor() && rating % 1 == 0.5) {
        return CustomStarIcon(color: Colors.amber, size: 40);
      } else {
        return CustomStarIcon(color: Colors.grey, size: 40);
      }
    }),
  );
}
