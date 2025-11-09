import 'package:flutter/material.dart';

// =====================
// COLORS
// =====================
class AppColors {
  // ===== LIGHT THEME COLORS =====
  static const Color lightBackgroundStart = Color(0xFF42A5F5); // آبی روشن
  static const Color lightBackgroundEnd = Color(0xFF90CAF9); // آبی آسمانی
  static const Color lightPrimaryText = Color(0xFF0D47A1); // آبی تیره برای متن
  static const Color lightSecondaryText = Color(0xFF1565C0); // آبی متوسط
  static const Color lightAccentText = Color(0xFFFFC107); // طلایی برای تأکید
  static const Color lightCardBackground = Color(0x80FFFFFF); // سفید نیمه‌شفاف
  static const Color lightCardShadow = Color(0x33000000); // سایه ملایم
  static const Color lightIcon = Color(0xFF0D47A1); // آبی تیره

  // ===== DARK THEME COLORS =====
  static const Color darkBackgroundStart = Color(
    0xFF0D1B2A,
  ); // آبی سرمه‌ای تیره
  static const Color darkBackgroundEnd = Color(0xFF1B263B); // آبی خاکستری
  static const Color darkPrimaryText = Color(0xFFFFFFFF); // سفید
  static const Color darkSecondaryText = Color(0xB3FFFFFF); // سفید نیمه‌شفاف
  static const Color darkAccentText = Color(0xFF00B4D8); // آبی فیروزه‌ای
  static const Color darkCardBackground = Color(0x33FFFFFF); // شیشه‌ای سفید
  static const Color darkCardShadow = Color(0x66000000); // سایه مشکی
  static const Color darkIcon = Color(0xFFFFFFFF); // سفید
}

// =====================
// TEXT STYLES
// =====================
class AppTextStyles {
  // روشن
  static const TextStyle lightCityName = TextStyle(
    color: AppColors.lightPrimaryText,
    fontSize: 28,
    fontWeight: FontWeight.bold,
  );

  static const TextStyle lightTemperature = TextStyle(
    color: AppColors.lightPrimaryText,
    fontSize: 80,
    fontWeight: FontWeight.w300,
  );

  static const TextStyle lightDescription = TextStyle(
    color: AppColors.lightSecondaryText,
    fontSize: 22,
    fontWeight: FontWeight.w400,
  );

  // تاریک
  static const TextStyle darkCityName = TextStyle(
    color: AppColors.darkPrimaryText,
    fontSize: 28,
    fontWeight: FontWeight.bold,
  );

  static const TextStyle darkTemperature = TextStyle(
    color: AppColors.darkPrimaryText,
    fontSize: 80,
    fontWeight: FontWeight.w300,
  );

  static const TextStyle darkDescription = TextStyle(
    color: AppColors.darkSecondaryText,
    fontSize: 22,
    fontWeight: FontWeight.w400,
  );
}

// =====================
// THEMES
// =====================

/// 🌤️ تم روشن
final ThemeData lightTheme = ThemeData(
  scaffoldBackgroundColor: AppColors.lightBackgroundStart,
  primaryColor: AppColors.lightBackgroundStart,
  colorScheme: ColorScheme.fromSeed(
    seedColor: AppColors.lightBackgroundStart,
    primary: AppColors.lightBackgroundStart,
    secondary: AppColors.lightAccentText,
    brightness: Brightness.light,
  ),
  textTheme: const TextTheme(
    headlineLarge: AppTextStyles.lightTemperature,
    headlineMedium: AppTextStyles.lightCityName,
    bodyLarge: AppTextStyles.lightDescription,
  ),
  cardColor: AppColors.lightCardBackground,
  shadowColor: AppColors.lightCardShadow,
  iconTheme: const IconThemeData(color: AppColors.lightIcon, size: 28),
  appBarTheme: const AppBarTheme(
    backgroundColor: Colors.transparent,
    elevation: 0,
    iconTheme: IconThemeData(color: AppColors.lightIcon),
    titleTextStyle: TextStyle(
      color: AppColors.lightPrimaryText,
      fontSize: 20,
      fontWeight: FontWeight.bold,
    ),
  ),
);

/// 🌙 تم تاریک
final ThemeData darkTheme = ThemeData(
  scaffoldBackgroundColor: AppColors.darkBackgroundStart,
  primaryColor: AppColors.darkBackgroundStart,
  colorScheme: ColorScheme.fromSeed(
    seedColor: AppColors.darkBackgroundStart,
    primary: AppColors.darkBackgroundStart,
    secondary: AppColors.darkAccentText,
    brightness: Brightness.dark,
  ),
  textTheme: const TextTheme(
    headlineLarge: AppTextStyles.darkTemperature,
    headlineMedium: AppTextStyles.darkCityName,
    bodyLarge: AppTextStyles.darkDescription,
  ),
  cardColor: AppColors.darkCardBackground,
  shadowColor: AppColors.darkCardShadow,
  iconTheme: const IconThemeData(color: AppColors.darkIcon, size: 28),
  appBarTheme: const AppBarTheme(
    backgroundColor: Colors.transparent,
    elevation: 0,
    iconTheme: IconThemeData(color: AppColors.darkIcon),
    titleTextStyle: TextStyle(
      color: AppColors.darkPrimaryText,
      fontSize: 20,
      fontWeight: FontWeight.bold,
    ),
  ),
);
