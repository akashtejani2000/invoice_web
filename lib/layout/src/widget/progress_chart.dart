import 'dart:math' as math;

import 'package:flutter/material.dart';

class ChartData {
  final double value;
  final Color color;

  const ChartData(this.value, this.color);
}

class CircleProgressChart extends StatelessWidget {
  final List<ChartData> data;
  final double strokeWidth;
  final Color strokeColor;
  final bool hasIndicator;

  const CircleProgressChart({
    Key? key,
    required this.data,
    this.strokeWidth = 64,
    this.strokeColor = Colors.transparent,
    this.hasIndicator = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 2,
      child: CustomPaint(
        painter: CircleProgressChartPainter(
          data,
          hasIndicator: hasIndicator,
          strokeColor: strokeColor,
          strokeWidth: strokeWidth,
        ),
      ),
    );
  }
}

class CircleProgressChartPainter extends CustomPainter {
  final List<ChartData> data;
  final bool hasIndicator;
  final double strokeWidth;
  final Color strokeColor;
  late Paint _foregroundPaint;

  CircleProgressChartPainter(
    this.data, {
    this.hasIndicator = false,
    this.strokeWidth = 16,
    this.strokeColor = Colors.transparent,
  }) {
    _foregroundPaint = Paint()
      ..color = strokeColor
      ..strokeCap = StrokeCap.butt
      ..style = PaintingStyle.stroke
      ..strokeJoin = StrokeJoin.round
      ..strokeWidth = strokeWidth;
  }

  @override
  void paint(Canvas canvas, Size size) {
    final width = size.width;
    final height = size.height;
    var radius = (width / 2) - (strokeWidth / 2);
    var center = Offset(width / 2, height);
    double totalValue = 0.0;
    for (var element in data) {
      totalValue += element.value;
    }
    var gap = data.length == 1 ? 0 : 1;
    totalValue += data.length * gap;
    var startAngle = 0.0;
    for (var element in data) {
      var sweepAngle = (element.value * math.pi) / totalValue;
      canvas.drawArc(
        Rect.fromCircle(center: center, radius: radius),
        startAngle - math.pi,
        sweepAngle,
        false,
        _foregroundPaint..color = element.color,
      );
      startAngle += (sweepAngle + ((gap * math.pi * 2) / totalValue));
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
