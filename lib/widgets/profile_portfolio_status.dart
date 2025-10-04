import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfilePortfolioStatus extends StatelessWidget {
  const ProfilePortfolioStatus({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(16),
      padding: const EdgeInsets.all(2),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0xFF35B9E9), Color(0xFF2D9F75)],
        ),
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16.r),
        ),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  RichText(
                    text: TextSpan(
                      style: TextStyle(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w400,
                        color: Colors.black,
                      ),
                      children: const [
                        TextSpan(
                          text: "Profiles with fully completed portfolios are ",
                        ),
                        TextSpan(
                          text: "3 times more likely",
                          style: TextStyle(fontWeight: FontWeight.w700),
                        ),
                        TextSpan(
                          text: " to be chosen by clients.",
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 6.h),
                  GestureDetector(
                    child: Text(
                      "Complete Portfolio",
                      style: TextStyle(
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w700,
                          color: Color(0xFF2D9F75)),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(width: 12.w),
            TweenAnimationBuilder<double>(
              tween: Tween(begin: 0.0, end: 0.7),
              duration: const Duration(milliseconds: 700),
              builder: (context, animatedValue, child) {
                return SizedBox(
                  width: 70,
                  height: 70,
                  child: CustomPaint(
                    painter: _RoundedCircularProgressPainter(
                      value: animatedValue,
                      strokeWidth: 8,
                      backgroundColor: Colors.grey.shade300,
                    ),
                    child: Center(
                      child: Text(
                        '${(animatedValue * 100).round()}%',
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}

class _RoundedCircularProgressPainter extends CustomPainter {
  final double value;
  final double strokeWidth;
  final Color backgroundColor;

  _RoundedCircularProgressPainter({
    required this.value,
    required this.strokeWidth,
    required this.backgroundColor,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = (math.min(size.width, size.height) - strokeWidth) / 2;
    final rect = Rect.fromCircle(center: center, radius: radius);

    final bgPaint = Paint()
      ..color = backgroundColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth
      ..strokeCap = StrokeCap.round;

    final gradient = LinearGradient(
      // startAngle: -math.pi / 2,
      // endAngle: -math.pi / 2 + math.pi * 2,
      colors: const [
        Color(0xFF2D9F75),
        Color(0xFF35B9E9),
      ],
    );

    canvas.drawArc(rect, 0, math.pi * 2, false, bgPaint);

    final fgPaint = Paint()
      ..shader = gradient.createShader(rect)
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth
      ..strokeCap = StrokeCap.round;

    final startAngle = -math.pi / 2;
    final sweepAngle = 2 * math.pi * value;
    canvas.drawArc(rect, startAngle, sweepAngle, false, fgPaint);
  }

  @override
  bool shouldRepaint(covariant _RoundedCircularProgressPainter old) {
    return old.value != value ||
        old.strokeWidth != strokeWidth ||
        old.backgroundColor != backgroundColor;
  }
}