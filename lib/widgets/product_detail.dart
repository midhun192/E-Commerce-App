import 'package:ecommerce_app/models/product_model.dart';
import 'package:ecommerce_app/models/shop_model.dart';
import 'package:ecommerce_app/utils/app_colors.dart';
import 'package:ecommerce_app/widgets/expandable_text_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class ProductDetails extends StatelessWidget {
  final Product product;
  const ProductDetails({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            backgroundColor: Colors.amber[50],
            toolbarHeight: 120.h,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                // Icon(Icons.clear),
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, '/cart_page');
                  },
                  child: Container(
                    height: 50.h,
                    width: 50.h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(40),
                      color: AppColors.backgroundColor,
                    ),
                    child: const Icon(
                      Icons.shopping_bag,
                      color: Colors.black,
                    ),
                  ),
                )
              ],
            ),
            bottom: PreferredSize(
              preferredSize: Size.fromHeight(20),
              child: Container(
                padding: EdgeInsets.only(top: 5.h, bottom: 10.h),
                width: double.maxFinite,
                decoration: BoxDecoration(
                  color: AppColors.backgroundColor,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20.h),
                    topRight: Radius.circular(20.h),
                  ),
                ),
                child: Center(
                  child: Text(
                    product.name,
                    style:
                        TextStyle(fontSize: 26.h, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
            expandedHeight: 320.h,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              background: Image.asset(
                product.imagePath,
                fit: BoxFit.cover,
                width: double.maxFinite,
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.only(
                      left: 20.h, right: 20.h, bottom: 20.h, top: 20.h),
                  child: ExpandableTextWidget(
                    text: product.description,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
      bottomNavigationBar: Container(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              padding: EdgeInsets.only(
                  left: 50.h, right: 50.h, top: 10.h, bottom: 10.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Icon(
                    Icons.remove,
                    color: Colors.black,
                  ),
                  Text(
                    "\$ " + product.price.toString(),
                    style: TextStyle(fontSize: 24.h, color: Colors.black),
                  ),
                  const Icon(
                    Icons.add,
                    color: Colors.black,
                  ),
                ],
              ),
            ),
            Container(
              height: 120.h,
              padding: EdgeInsets.only(left: 20.h, right: 20.h, top: 30.h),
              decoration: BoxDecoration(
                color: Colors.amber[50],
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(40.h),
                  topRight: Radius.circular(40.h),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    padding: EdgeInsets.only(
                      left: 20.h,
                      right: 20.h,
                      top: 15.h,
                      bottom: 15.h,
                    ),
                    decoration: BoxDecoration(
                      color: AppColors.backgroundColor,
                      borderRadius: BorderRadius.circular(20.h),
                    ),
                    child: Icon(
                      Icons.favorite,
                      size: 24.h,
                      color: Colors.red[300],
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      context.read<Shop>().addToCart(product);
                    },
                    child: Container(
                        padding: EdgeInsets.only(
                          left: 20.h,
                          right: 20.h,
                          top: 15.h,
                          bottom: 15.h,
                        ),
                        decoration: BoxDecoration(
                          color: AppColors.backgroundColor,
                          borderRadius: BorderRadius.circular(20.h),
                        ),
                        child: Text(
                          "\$ " + product.price.toString() + " | Add to Cart",
                          style: TextStyle(
                              color: Colors.black, fontWeight: FontWeight.w300),
                        )),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
