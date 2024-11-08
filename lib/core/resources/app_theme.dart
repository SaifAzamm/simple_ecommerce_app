import 'package:ass_simple_ecommorce/core/config/pallet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ApplicationTheme {
  static ThemeData lightTheme = ThemeData(
    scaffoldBackgroundColor: Palette.backGround,
    fontFamily: 'Poppins',
    iconTheme: const IconThemeData(color: Palette.blackText),
    dividerTheme: const DividerThemeData(color: Palette.blackText),
    appBarTheme: AppBarTheme(
      backgroundColor: Palette.backGround,
      centerTitle: true,
      iconTheme: IconThemeData(color: Palette.blackText, size: 20.sp),
      actionsIconTheme: IconThemeData(color: Palette.blackText, size: 22.sp),
      titleTextStyle: TextStyle(
        fontSize: 18.sp,
        color: Palette.blackText,
        fontWeight: FontWeight.w500,
        fontFamily: "Poppins",
      ),
    ),
    checkboxTheme: CheckboxThemeData(
      fillColor:
          WidgetStateProperty.all(Palette.backGround), // Customize fill color
      checkColor:
          WidgetStateProperty.all(Palette.orange), // Customize check color
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(4.0),
      ),
      side: WidgetStateBorderSide.resolveWith(
        (states) => BorderSide(
          color: Palette.iconDisable,
          width: 1.w,
        ),
      ),
    ),
    radioTheme: RadioThemeData(
      fillColor:
          WidgetStateProperty.all(Palette.orange), // Customize fill color
      overlayColor:
          WidgetStateProperty.resolveWith<Color?>((Set<WidgetState> states) {
        if (states.contains(WidgetState.hovered)) {
          return Palette.orange.withOpacity(0.04);
        }
        if (states.contains(WidgetState.focused) ||
            states.contains(WidgetState.pressed)) {
          return Palette.orange.withOpacity(0.12);
        }
        return null; // Defer to the default value
      }),
    ),
    dividerColor: const Color(0xffE4E4E4),
    useMaterial3: true,
    brightness: Brightness.light,
    textTheme: TextTheme(
      titleLarge: TextStyle(
        fontSize: 28.sp,
        color: Palette.blackText,
        fontWeight: FontWeight.w500,
        fontFamily: "Poppins",
      ),
      titleMedium: TextStyle(
        fontSize: 24.sp,
        color: Palette.blackText,
        fontWeight: FontWeight.w500,
        fontFamily: "Poppins",
      ),
      titleSmall: TextStyle(
        fontSize: 22.sp,
        color: Palette.blackText,
        fontWeight: FontWeight.w500,
        fontFamily: "Poppins",
      ),
      headlineLarge: TextStyle(
        fontSize: 20.sp,
        color: Palette.blackText,
        fontWeight: FontWeight.w500,
        fontFamily: "Poppins",
      ),
      headlineSmall: TextStyle(
        fontSize: 18.sp,
        color: Palette.blackText,
        fontWeight: FontWeight.w500,
        fontFamily: "Poppins",
      ),
      bodyLarge: TextStyle(
        fontSize: 16.sp,
        color: Palette.blackText,
        fontWeight: FontWeight.w500,
        fontFamily: "Poppins",
      ),
      bodyMedium: TextStyle(
        fontSize: 14.sp,
        color: Palette.blackText,
        fontWeight: FontWeight.w500,
        fontFamily: "Poppins",
      ),
      bodySmall: TextStyle(
        fontSize: 12.sp,
        color: Palette.blackText,
        fontWeight: FontWeight.w500,
        fontFamily: "Poppins",
      ),
    ),
  );
}
