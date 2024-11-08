// cart_screen.dart
import 'package:ass_simple_ecommorce/features/product/controller/product_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartView extends StatelessWidget {
  const CartView({super.key});

  @override
  Widget build(BuildContext context) {
    final ProductController controller = Get.find();
    return Scaffold(
      appBar: AppBar(
        title: const Text("Shopoo Cart"),
      ),
      body: Obx(() {
        if (controller.cart.isEmpty) {
          return const Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.remove_shopping_cart, size: 100, color: Colors.grey),
                SizedBox(height: 10),
                Text("You have no items in your Cart",
                    style: TextStyle(fontSize: 18)),
              ],
            ),
          );
        }

        double subtotal = controller.cart
            .fold(0, (sum, item) => sum + (item.price! * item.quantity));

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'Subtotal Amount: \$ ${subtotal.toStringAsFixed(2)}',
                style:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: controller.cart.length,
                itemBuilder: (context, index) {
                  final product = controller.cart[index];
                  return Card(
                    margin:
                        const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Image.network(
                            product.image!,
                            width: 80,
                            height: 80,
                            fit: BoxFit.cover,
                          ),
                          const SizedBox(width: 16),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(product.title ?? '',
                                    style: const TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold)),
                                const SizedBox(height: 4),
                                Text("\$ ${product.price}",
                                    style: const TextStyle(
                                        color: Colors.green, fontSize: 16)),
                                const SizedBox(height: 4),
                                const Text("Eligible for free shipping",
                                    style: TextStyle(color: Colors.grey)),
                                const SizedBox(height: 4),
                                const Text("In Stock",
                                    style: TextStyle(color: Colors.green)),
                                const SizedBox(height: 4),
                                Text("Category : ${product.category}",
                                    style: const TextStyle(color: Colors.grey)),
                                const SizedBox(height: 8),
                                Row(
                                  children: [
                                    IconButton(
                                      onPressed: () =>
                                          controller.decreaseQuantity(product),
                                      icon: const Icon(
                                          Icons.remove_circle_outline),
                                    ),
                                    Text('${product.quantity}',
                                        style: const TextStyle(fontSize: 16)),
                                    IconButton(
                                      onPressed: () =>
                                          controller.increaseQuantity(product),
                                      icon:
                                          const Icon(Icons.add_circle_outline),
                                    ),
                                    const Spacer(),
                                    ElevatedButton.icon(
                                      onPressed: () =>
                                          controller.removeFromCart(product),
                                      icon: const Icon(Icons.delete),
                                      label: const Text("Delete"),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        );
      }),
    );
  }
}
