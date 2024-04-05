import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BigText extends StatelessWidget {
  final String text;
  Color? color;
  double size;
  BigText({
    super.key,
    required this.text,
    this.color = const Color(0xFF332d2b),
    this.size = 0,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
          color: color,
          fontSize: size == 0 ? 24.h : size,
          fontFamily: 'Roboto',
          fontWeight: FontWeight.bold),
    );
  }
}
