import 'package:ass_simple_ecommorce/core/routes/router.dart';
import 'package:ass_simple_ecommorce/features/product/view/cart_view.dart';
import 'package:ass_simple_ecommorce/features/product/view/product_view.dart';
import 'package:ass_simple_ecommorce/features/splash/view/splash_view.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:get/get_navigation/src/routes/transitions_type.dart';

class AppRouter {
  static List<GetPage<dynamic>> routes = [
    //Splash screen
    GetPage(
      name: AppRoutes.splashScreen,
      page: () => const SplashView(),
      transition: Transition.cupertino,
      transitionDuration: const Duration(milliseconds: 800),
    ),
    //Product screen
    GetPage(
      name: AppRoutes.productScreen,
      page: () => const ProductView(),
      transition: Transition.cupertino,
      transitionDuration: const Duration(milliseconds: 800),
    ),
    //Cart screen
    GetPage(
      name: AppRoutes.cartScreen,
      page: () => const CartView(),
      transition: Transition.cupertino,
      transitionDuration: const Duration(milliseconds: 800),
    ),
  ];
}
