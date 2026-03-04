/// ملف مركزي لجميع مسارات الصور والـ Assets في التطبيق
/// يسهل إدارة وتعديل المسارات من مكان واحد
class AppAssets {
  // منع إنشاء instance من هذا الكلاس
  AppAssets._();

  // المسار الأساسي للصور
  static const String _imagesPath = 'asstes/images';

  // ========== Icons ==========

  /// أيقونة الموقع
  static const String locationIcon = '$_imagesPath/Vector.png';

  //ايقون bottom navigation Bar
  static const String homeIcon = '$_imagesPath/home.svg';
  static const String personIcon = '$_imagesPath/frame.svg';
  static const String shoppingIcon = '$_imagesPath/shopping-cart.svg';
  static const String heartIcon = '$_imagesPath/heart.svg';
  static const String cartIcon = '$_imagesPath/bag-happy.svg';

  /// أيقونة الإعدادات/الفلتر
  static const String settingsIcon = '$_imagesPath/setting-5.png';
 /// أيقونة/الاشعارات
  static const String notificationIcon = '$_imagesPath/notification.svg';

  /// أيقونة البرجر/الطعام
  static const String burgerIcon = '$_imagesPath/burger.png';

  static const String motoIcon = '$_imagesPath/truck-fast.png';

  /// أيقونة Vector 1
  static const String vectorIcon1 = '$_imagesPath/Vector (1).png';

  // ========== Banners ==========

  /// بانر رئيسي 2
  static const String banner2 = '$_imagesPath/bannar2.png';

  /// صورة cuate
  static const String cuate = '$_imagesPath/cuate.png';

  // ========== Restaurant Images ==========

  /// صورة مطعم Belicious
  static const String beliciousRestaurant = '$_imagesPath/belicious.png';

  // ========== Product Images ==========

  /// صورة بيتزا
  static const String pizza = '$_imagesPath/pitzza.png';

  /// منتج البرجر 1
  static const String burger1 =
      '$_imagesPath/78178740_Fresh beef burger isolated -1 copy 1.png';

  /// منتج البرجر 2
  static const String burger2 =
      '$_imagesPath/78178740_Fresh beef burger isolated -1 copy 1 (1).png';

  /// منتج البرجر 3
  static const String burger3 =
      '$_imagesPath/78178740_Fresh beef burger isolated -1 copy 1 (2).png';

  /// منتج البرجر 4
  static const String burger4 =
      '$_imagesPath/78178740_Fresh beef burger isolated -1 copy 1 (3).png';

  // ========== Best Products ==========

  /// أفضل منتج 1
  static const String best1 = '$_imagesPath/best1.png';

  /// أفضل منتج 2
  static const String best2 = '$_imagesPath/best2.png';

  /// أفضل منتج 3
  static const String best3 = '$_imagesPath/best3.png';

  /// أفضل منتج 4
  static const String best4 = '$_imagesPath/best4.png';

  // ========== Other Images ==========

  /// دائرة/Ellipse
  static const String ellipse375 = '$_imagesPath/Ellipse 375.png';

  /// مجموعة 2456
  static const String group2456 = '$_imagesPath/Group 2456.png';

  /// مستطيل 17407
  static const String rectangle17407 = '$_imagesPath/Rectangle 17407.png';

  // ========== Helper Methods ==========

  /// قائمة صور أفضل المنتجات
  static List<String> get bestProducts => [best1, best2, best3, best4];

  /// قائمة صور البرجر
  static List<String> get burgers => [burger1, burger2, burger3, burger4];
}
