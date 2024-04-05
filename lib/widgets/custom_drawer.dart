import 'package:ecommerce_app/utils/app_colors.dart';
import 'package:ecommerce_app/widgets/custom_list_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: AppColors.backgroundColor,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              //  Logo

              DrawerHeader(
                child: Icon(
                  Icons.shopping_bag,
                  color: AppColors.inversePrimaryColor,
                  size: 72.h,
                ),
              ),

              SizedBox(height: 10.h),

              //  Shop Tile
              CustomListTile(
                text: 'Shop',
                icon: Icons.home,
                onTap: () {
                  Navigator.pushNamed(context, "/main_page");
                },
              ),

              // Cart Tile
              CustomListTile(
                text: 'Cart',
                icon: Icons.shopping_cart,
                onTap: () {
                  Navigator.pushNamed(context, "/cart_page");
                },
              ),
            ],
          ),
          // Exit Tile

          Padding(
            padding: EdgeInsets.only(bottom: 25.h),
            child: CustomListTile(
              text: 'Exit',
              icon: Icons.exit_to_app,
              onTap: () {
                Navigator.pushNamedAndRemoveUntil(
                    context, "/screen_home", (route) => false);
              },
            ),
          ),
        ],
      ),
    );
  }
}
