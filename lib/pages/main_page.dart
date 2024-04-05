import 'package:ecommerce_app/models/product_model.dart';
import 'package:ecommerce_app/models/shop_model.dart';
import 'package:ecommerce_app/utils/app_colors.dart';
import 'package:ecommerce_app/widgets/custom_drawer.dart';
import 'package:ecommerce_app/widgets/product_detail.dart';
import 'package:ecommerce_app/widgets/product_tile.dart';
import 'package:ecommerce_app/widgets/small_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    final products = context.watch<Shop>().shop;

    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: AppColors.inversePrimaryColor,
        title: const Text('Main Page'),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, '/cart_page');
            },
            icon: Icon(Icons.shopping_cart),
          ),
        ],
      ),
      drawer: CustomDrawer(),
      body: ListView(
        children: [
          SizedBox(height: 25.h),
          // SubTitle
          Center(
            child: Text(
              'Please Select a Product from the Following',
              style: TextStyle(
                  color: AppColors.inversePrimaryColor, fontSize: 15.h),
            ),
          ),
          SizedBox(
            height: 550.h,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              padding: EdgeInsets.all(15.h),
              itemBuilder: (context, index) {
                final product = products[index];
                return GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (BuildContext context) =>
                            ProductDetails(product: product),
                      ),
                    );
                  },
                  child: ProductTile(product: product),
                );
              },
              itemCount: products.length,
            ),
          ),
        ],
      ),
    );
  }
}
