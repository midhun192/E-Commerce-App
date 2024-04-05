import 'package:ecommerce_app/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Button extends StatelessWidget {
  final void Function()? onTap;
  final Widget child;
  const Button({super.key, required this.onTap, required this.child});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(25.h),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12.h),
            color: AppColors.primaryColor),
        child: child,
      ),
    );
  }
}
