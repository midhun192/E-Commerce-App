import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomButton extends StatelessWidget {
  final void Function()? onTap;
  final Widget child;
  const CustomButton({super.key, required this.child, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(20.h),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.h),
          color: Colors.amber[50],
        ),
        child: child,
      ),
    );
  }
}
