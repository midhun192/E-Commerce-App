import 'package:ecommerce_app/models/product_model.dart';
import 'package:flutter/cupertino.dart';

class Shop extends ChangeNotifier {
  // Product List

  List<Product> _shop = [
    // Product 1

    Product(
      name: 'Nike Sneakers',
      price: 424.77,
      description:
          '''Say hello to the next generation of Air technology. The Air Max Dn features our Dynamic Air unit system of dual-pressure tubes, creating a reactive sensation with every step. This results in a futuristic design that's comfortable enough to wear from day to night. Go ahead—Feel the Unreal.''',
      imagePath: "assets/images/image1.jpg",
    ),

    // Product 2

    Product(
      name: '''Men's Sneakers''',
      price: 74.99,
      description:
          'If you love the thrill of riding a motorcycle, you need a pair of shoes that match your passion. That’s why we created City-Ride, a part of our exclusive Motomania Collection. These shoes are designed to give you a unique and stylish look, whether you’re on the road or off it. The shoes feature a stunning design on the top, with intricate details that make them stand out. They also have a PU Foam insole and a Tyre-Tech sole, which provide comfort and durability for your feet. With City-Ride, you can enjoy the speed and style of a true motorcycle enthusiast. CAMPUS brings you the ultimate shoes for your ride',
      imagePath: "assets/images/image2.jpg",
    ),

    // Product 3

    Product(
      name: 'BaseBall Cap',
      price: 25.00,
      description:
          '''This 5-panel, flexfit, low-profile baseball cap is a great wear. It's perfect for teams or individuals, for the field or the street. The addition of spandex to the material makes for a form-fit, and the extras like a sewn-in sweatband and embroidered ventilation holes make this piece a smart buy.''',
      imagePath: "assets/images/image3.jpg",
    ),

    // Product 4

    Product(
      name: '''Men's Sandal''',
      price: 24.77,
      description:
          '''he often imitated, never duplicated, category-defining, two-strap wonder from Birkenstock. A comfort legend and a fashion staple. With adjustable straps and a magical cork footbed that conforms to the shape of your foot, a truly custom fit is as effortless as the classic design.''',
      imagePath: "assets/images/image4.jpg",
    ),

    // Product 5

    Product(
      name: '''Men's T-shirt''',
      price: 30.55,
      description:
          '''T-shirt in lightweight cotton jersey with a round, rib-trimmed neckline and a straight-cut hem. Regular fit for comfortable wear and a classic silhouette.''',
      imagePath: "assets/images/image5.jpg",
    ),
  ];

  // User Cart
  List<Product> _cart = [];

  // Get Product List
  List<Product> get shop {
    return _shop;
  }

  // Get Cart list
  List<Product> get cart {
    return _cart;
  }

  // Add to Cart
  void addToCart(Product item) {
    _cart.add(item);
    notifyListeners();
  }

  // Delete item from cart
  void deleteFromCart(Product item) {
    _cart.remove(item);
    notifyListeners();
  }

  getItem(Product item) {
    return item;
  }
}
