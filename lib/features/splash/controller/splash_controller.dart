import 'dart:async';
import 'package:ass_simple_ecommorce/core/routes/router.dart';
import 'package:get/get.dart';

class SplashController extends GetxController {
  void authenticate() async {
    Get.offAllNamed(AppRoutes.productScreen);
  }

  @override
  void onInit() {
    super.onInit();
    Timer(
      const Duration(seconds: 2),
      () {
        authenticate();
      },
    );
  }
}
