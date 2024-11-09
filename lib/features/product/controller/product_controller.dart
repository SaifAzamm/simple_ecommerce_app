// controllers/product_controller.dart
import 'package:ass_simple_ecommorce/features/product/data/repo/product_repo.dart';
import 'package:ass_simple_ecommorce/features/product/data/response/get_product_response.dart';
import 'package:get/get.dart';

class ProductController extends GetxController {
  final ProductRepo _productRepo = ProductRepo();
  RxList<GetProductResponse> products = <GetProductResponse>[].obs;
  var cart = <GetProductResponse>[].obs;
  var isLoading = true.obs;

  @override
  void onInit() {
    fetchProducts();
    super.onInit();
  }

  Future<void> fetchProducts() async {
    isLoading.value = true;
    final response = await _productRepo.getProducts();
    response.fold(
      (l) {
        isLoading.value = false;
      },
      (r) {
        products.value = r;
        isLoading.value = false;
      },
    );
  }

  void addToCart(GetProductResponse product) {
    final existingProduct =
        cart.firstWhereOrNull((item) => item.id == product.id);
    if (existingProduct != null) {
      existingProduct.quantity++;
    } else {
      product.quantity = 1;
      cart.add(product);
    }
    Get.snackbar('Cart Updated', '${product.title} added to cart',
        duration: const Duration(milliseconds: 900));
  }

  void increaseQuantity(GetProductResponse product) {
    product.quantity++;
    cart.refresh(); // Updates the UI
  }

  void decreaseQuantity(GetProductResponse product) {
    if (product.quantity > 1) {
      product.quantity--;
    } else {
      cart.remove(product);
    }
    cart.refresh(); // Updates the UI
  }

  void removeFromCart(GetProductResponse product) {
    cart.remove(product);
    Get.snackbar('Cart Updated', '${product.title} removed from cart',
        duration: const Duration(milliseconds: 900));
  }
}
