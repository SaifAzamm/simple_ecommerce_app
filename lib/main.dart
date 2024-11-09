import 'package:ass_simple_ecommorce/core/resources/app_theme.dart';
import 'package:ass_simple_ecommorce/core/routes/router.dart';
import 'package:ass_simple_ecommorce/core/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(393, 852),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, __) {
        return GetMaterialApp(
          initialRoute: AppRoutes.splashScreen,
          title: 'Simple E-Commerce',
          theme: ApplicationTheme.lightTheme,
          debugShowCheckedModeBanner: false,
          getPages: AppRouter.routes,
        );
      },
    );
  }
}
