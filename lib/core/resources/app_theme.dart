import 'package:ass_simple_ecommorce/core/config/pallet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ApplicationTheme {
  static ThemeData lightTheme = ThemeData(
    scaffoldBackgroundColor: Palette.background,
    fontFamily: 'Poppins',
    brightness: Brightness.light,
    appBarTheme: AppBarTheme(
      backgroundColor: Palette.surface,
      centerTitle: true,
      iconTheme: IconThemeData(color: Palette.iconActive, size: 22.sp),
      titleTextStyle: TextStyle(
        fontSize: 20.sp,
        color: Palette.textPrimary,
        fontWeight: FontWeight.bold,
      ),
    ),
    buttonTheme: ButtonThemeData(
      buttonColor: Palette.buttonPrimary,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: Palette.buttonPrimary,
        textStyle: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
    ),
    iconTheme: const IconThemeData(color: Palette.iconActive),
    dividerTheme: const DividerThemeData(color: Palette.divider),
    checkboxTheme: CheckboxThemeData(
      fillColor: WidgetStateProperty.all(Palette.primary),
    ),
    textTheme: TextTheme(
      headlineLarge: TextStyle(
        fontSize: 24.sp,
        fontWeight: FontWeight.bold,
        color: Palette.textPrimary,
      ),
      bodyLarge: TextStyle(
        fontSize: 16.sp,
        color: Palette.textSecondary,
      ),
      bodyMedium: TextStyle(
        fontSize: 14.sp,
        color: Palette.textSecondary,
      ),
    ),
  );
}
