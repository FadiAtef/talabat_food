import 'package:flutter/material.dart';

/// ملف الـ Text Styles المركزي للتطبيق
/// يحتوي على جميع أنماط النصوص المستخدمة في التطبيق بشكل منظم ونظيف
class AppTextStyles {
  // الخط الافتراضي المستخدم في التطبيق
  static const String _defaultFontFamily = 'NotoKufiArabic';

  // ========== App Bar Styles ==========

  /// نص الموقع الرئيسي في الـ App Bar
  static const TextStyle appBarLocationTitle = TextStyle(
    fontSize: 18,
    color: Colors.black87,
    fontWeight: FontWeight.w700,
    fontFamily: _defaultFontFamily,
  );

  /// نص العنوان التفصيلي في الـ App Bar
  static const TextStyle appBarLocationSubtitle = TextStyle(
    fontSize: 16,
    color: Colors.black87,
    fontWeight: FontWeight.w500,
    fontFamily: _defaultFontFamily,
  );

  // ========== Tab Bar / Category Styles ==========

  /// نص الفئات في الـ Tab Bar
  static const TextStyle tabBarCategory = TextStyle(
    color: Color(0xffF55540),
    fontSize: 16,
    fontWeight: FontWeight.w400,
    fontFamily: _defaultFontFamily,
  );

  // ========== Title Styles ==========

  /// العناوين الكبيرة (مثل: الأفضل، بيتزا)
  static const TextStyle sectionTitle = TextStyle(
    fontSize: 22,
    fontWeight: FontWeight.w700,
    color: Colors.black,
    fontFamily: _defaultFontFamily,
  );

  /// العناوين المتوسطة
  static const TextStyle mediumTitle = TextStyle(
    fontSize: 22,
    fontWeight: FontWeight.w700,
    color: Colors.black,
    fontFamily: _defaultFontFamily,
  );

  /// العناوين الصغيرة
  static const TextStyle smallTitle = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w600,
    color: Colors.black,
    fontFamily: _defaultFontFamily,
  );

  // ========== Product Card Styles ==========

  /// اسم المنتج
  static const TextStyle productName = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w500,
    color: Colors.black,
    fontFamily: _defaultFontFamily,
  );

  /// وصف المنتج
  static const TextStyle productDescription = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w400,
    color: Colors.black,
    fontFamily: _defaultFontFamily,
  );

  /// سعر المنتج
  static const TextStyle productPrice = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w500,
    color: Color(0xff868686),
    fontFamily: _defaultFontFamily,
  );

  // ========== Restaurant Card Styles ==========

  /// اسم المطعم
  static const TextStyle restaurantName = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w700,
    color: Colors.black,
    fontFamily: _defaultFontFamily,
  );

  /// تفاصيل المطعم (التقييم، الوقت، إلخ)
  static const TextStyle restaurantDetails = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w500,
    color: Color(0xff868686),
    fontFamily: _defaultFontFamily,
  );

  // ========== Body Text Styles ==========

  /// النص الأساسي الكبير
  static const TextStyle bodyLarge = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w500,
    color: Colors.black87,
    fontFamily: _defaultFontFamily,
  );

  /// النص الأساسي المتوسط
  static const TextStyle bodyMedium = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    color: Colors.black87,
    fontFamily: _defaultFontFamily,
  );

  /// النص الأساسي الصغير
  static const TextStyle bodySmall = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w400,
    color: Colors.black54,
    fontFamily: _defaultFontFamily,
  );

  // ========== Button Styles ==========

  /// نص الأزرار الكبيرة
  static const TextStyle buttonLarge = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w600,
    color: Colors.white,
    fontFamily: _defaultFontFamily,
  );

  /// نص الأزرار المتوسطة
  static const TextStyle buttonMedium = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w600,
    color: Colors.white,
    fontFamily: _defaultFontFamily,
  );

  // ========== Search Bar Styles ==========

  /// نص البحث
  static const TextStyle searchText = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w400,
    color: Colors.black87,
    fontFamily: _defaultFontFamily,
  );

  /// نص placeholder في البحث
  static const TextStyle searchHint = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w400,
    color: Colors.black38,
    fontFamily: _defaultFontFamily,
  );

  // ========== Badge / Label Styles ==========

  /// نص الشارات (مثل: خصم، جديد)
  static const TextStyle badge = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w700,
    color: Colors.white,
    fontFamily: _defaultFontFamily,
  );

  /// نص التسميات
  static const TextStyle label = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w600,
    color: Colors.black87,
    fontFamily: _defaultFontFamily,
  );
}
