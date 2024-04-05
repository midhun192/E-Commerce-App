import 'package:ecommerce_app/models/product_model.dart';
import 'package:ecommerce_app/models/shop_model.dart';
import 'package:ecommerce_app/utils/app_colors.dart';
import 'package:ecommerce_app/widgets/expandable_text_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class ProductTile extends StatelessWidget {
  final Product product;
  const ProductTile({super.key, required this.product});

  void addToCart(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: AppColors.backgroundColor,
          content: const Text('Add this item to your Cart ?'),
          actions: [
            // To cancel
            MaterialButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Cancel'),
            ),

            // to confirm
            MaterialButton(
              onPressed: () {
                Navigator.pop(context);
                context.read<Shop>().addToCart(product);
              },
              child: const Text('Yes'),
            )
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300.h,
      margin: EdgeInsets.all(10.h),
      padding: EdgeInsets.all(25.h),
      decoration: BoxDecoration(
          color: Colors.amber[50], borderRadius: BorderRadius.circular(15.h)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Product Image
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AspectRatio(
                    aspectRatio: 1,
                    child: Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage(product.imagePath),
                            fit: BoxFit.cover),
                        color: AppColors.secondaryColor,
                        borderRadius: BorderRadius.circular(15.h),
                      ),
                      width: double.infinity,
                      padding: EdgeInsets.all(25.h),
                      // child: Image.asset(product.imagePath),
                    ),
                  ),

                  SizedBox(height: 25.h),

                  // Product name
                  Text(
                    product.name,
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 24.h),
                  ),

                  SizedBox(height: 10.h),

                  // Product Description

                  SingleChildScrollView(
                    child: Column(
                      children: [
                        ExpandableTextWidget(text: product.description)
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),

          // Product price

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '\$ ' + product.price.toStringAsFixed(2),
                style: const TextStyle(fontWeight: FontWeight.w500),
              ),
              Container(
                decoration: BoxDecoration(
                    color: AppColors.secondaryColor,
                    borderRadius: BorderRadius.circular(12.h)),
                child: IconButton(
                  onPressed: () {
                    addToCart(context);
                  },
                  icon: const Icon(Icons.add),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
