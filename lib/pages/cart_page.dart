import 'package:ecommerce_app/models/product_model.dart';
import 'package:ecommerce_app/models/shop_model.dart';
import 'package:ecommerce_app/utils/app_colors.dart';
import 'package:ecommerce_app/widgets/button.dart';
import 'package:ecommerce_app/widgets/custom_button.dart';
import 'package:ecommerce_app/widgets/custom_drawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  void removeItem(BuildContext context, Product product) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            backgroundColor: AppColors.backgroundColor,
            content: const Text('Remove this item from your Cart ?'),
            actions: [
              // to cancel the action
              MaterialButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text('Cancel'),
              ),

              // to remove the item from cart
              MaterialButton(
                onPressed: () {
                  Navigator.pop(context);
                  context.read<Shop>().deleteFromCart(product);
                },
                child: const Text('Yes'),
              ),
            ],
          );
        });
  }

  void onPayButton(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          content: const Text('Are you Sure you want to Proceed'),
          actions: [
            MaterialButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Cancel'),
            ),
            MaterialButton(
              onPressed: () {
                Navigator.pushNamed(context, "/checkout_page");
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
    final cart = context.watch<Shop>().cart;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        foregroundColor: AppColors.inversePrimaryColor,
        elevation: 0,
        centerTitle: true,
        title: const Text('Cart Page'),
      ),
      drawer: const CustomDrawer(),
      backgroundColor: AppColors.backgroundColor,
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Expanded(
              child: cart.isEmpty
                  ? const Center(
                      child: Text('Your Cart is Empty...'),
                    )
                  : ListView.builder(
                      itemBuilder: (context, index) {
                        // Individual Cart Items
                        final item = cart[index];

                        return ListTile(
                          leading: ConstrainedBox(
                            constraints: BoxConstraints(
                                minWidth: 44.h,
                                minHeight: 64.h,
                                maxHeight: 64.h,
                                maxWidth: 44.h),
                            child: Image.asset(item.imagePath),
                          ),
                          title: Text(item.name),
                          subtitle: Text("\$ " + item.price.toStringAsFixed(2)),
                          trailing: IconButton(
                            color: Colors.red[400],
                            onPressed: () {
                              removeItem(context, item);
                            },
                            icon: Icon(Icons.cancel_outlined),
                          ),
                        );
                      },
                      itemCount: cart.length,
                    ),
            ),
            CustomButton(
              onTap: () {
                return onPayButton(context);
              },
              child: const Text("Proceed to Checkout"),
            ),
          ],
        ),
      ),
    );
  }
}
