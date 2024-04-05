import 'package:ecommerce_app/utils/app_colors.dart';
import 'package:ecommerce_app/widgets/big_text.dart';
import 'package:ecommerce_app/widgets/button.dart';
import 'package:ecommerce_app/widgets/small_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.backgroundColor,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.shopping_bag,
                color: AppColors.inversePrimaryColor,
                size: 72.h,
              ),
              SizedBox(height: 10.h),
              BigText(text: 'Shopify App'),
              SizedBox(height: 5.h),
              SmallText(
                text: 'Quality Products Online',
                color: AppColors.inversePrimaryColor,
              ),
              SizedBox(height: 10.h),
              Button(
                onTap: () {
                  Navigator.pushNamed(context, '/main_page');
                },
                child: const Icon(Icons.arrow_forward),
              ),
            ],
          ),
        ));
  }
}
