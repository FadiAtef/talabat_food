# 📥 تعليمات تحميل وتثبيت الخطوط العربية

## الخطوات المطلوبة:

### 1️⃣ إنشاء مجلد fonts في المشروع
```
📁 untitled/
  └── 📁 fonts/        ← أنشئ هذا المجلد في الجذر
```

### 2️⃣ تحميل خط Cairo

#### الطريقة الأولى - من Google Fonts (موصى بها):
1. اذهب إلى: https://fonts.google.com/specimen/Cairo
2. اضغط على "Download family"
3. فك ضغط الملف المحمل
4. انسخ الملفات التالية إلى مجلد `fonts/`:
   - `Cairo-Regular.ttf` (400)
   - `Cairo-Medium.ttf` (500)
   - `Cairo-SemiBold.ttf` (600)
   - `Cairo-Bold.ttf` (700)
   - `Cairo-ExtraBold.ttf` (800)

#### الطريقة الثانية - استخدام package من pub.dev:
أضف في `pubspec.yaml`:
```yaml
dependencies:
  google_fonts: ^6.1.0
```

ثم في `text_styles.dart` استخدم:
```dart
import 'package:google_fonts/google_fonts.dart';

static final TextStyle sectionTitle = GoogleFonts.cairo(
  fontSize: 26,
  fontWeight: FontWeight.w800,
  color: Colors.black,
);
```

### 3️⃣ تحميل خط Tajawal (اختياري)

1. اذهب إلى: https://fonts.google.com/specimen/Tajawal
2. اضغط على "Download family"
3. فك ضغط الملف المحمل
4. انسخ الملفات التالية إلى مجلد `fonts/`:
   - `Tajawal-Regular.ttf` (400)
   - `Tajawal-Medium.ttf` (500)
   - `Tajawal-Bold.ttf` (700)
   - `Tajawal-ExtraBold.ttf` (800)

### 4️⃣ التأكد من البنية النهائية

يجب أن يكون المشروع بهذا الشكل:
```
📁 untitled/
  ├── 📁 fonts/
  │   ├── Cairo-Regular.ttf
  │   ├── Cairo-Medium.ttf
  │   ├── Cairo-SemiBold.ttf
  │   ├── Cairo-Bold.ttf
  │   ├── Cairo-ExtraBold.ttf
  │   ├── Tajawal-Regular.ttf
  │   ├── Tajawal-Medium.ttf
  │   ├── Tajawal-Bold.ttf
  │   └── Tajawal-ExtraBold.ttf
  ├── 📁 lib/
  ├── 📁 assets/
  └── pubspec.yaml
```

### 5️⃣ تشغيل الأوامر

بعد وضع الخطوط، شغّل:
```bash
flutter clean
flutter pub get
```

ثم أعد تشغيل التطبيق:
```bash
flutter run
```

---

## ✅ التحقق من التثبيت

بعد تشغيل التطبيق، يجب أن ترى:
- ✨ جميع النصوص العربية بخط Cairo الجميل
- 📏 الأحجام المحدثة (أكبر وأوضح)
- 🎨 المظهر الاحترافي

---

## 🔄 البديل السريع - استخدام Google Fonts Package

إذا كنت تريد طريقة أسرع بدون تحميل الخطوط يدوياً:

### 1. أضف الـ package:
في `pubspec.yaml`:
```yaml
dependencies:
  flutter:
    sdk: flutter
  google_fonts: ^6.1.0  # أضف هذا السطر
```

### 2. حدّث text_styles.dart:
```dart
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTextStyles {
  // ========== App Bar Styles ==========
  
  static final TextStyle appBarLocationTitle = GoogleFonts.cairo(
    fontSize: 18,
    color: Colors.black87,
    fontWeight: FontWeight.w700,
  );

  static final TextStyle appBarLocationSubtitle = GoogleFonts.cairo(
    fontSize: 16,
    color: Colors.black87,
    fontWeight: FontWeight.w500,
  );

  // ... وهكذا لباقي الأنماط
}
```

### 3. شغّل:
```bash
flutter pub get
flutter run
```

---

## 🎯 الخلاصة

اختر إحدى الطريقتين:

| الطريقة | المميزات | العيوب |
|---------|----------|--------|
| **تحميل الخطوط يدوياً** | - حجم أصغر للتطبيق<br>- لا يحتاج اتصال<br>- أسرع في التحميل | - يحتاج تحميل يدوي<br>- إضافة ملفات للمشروع |
| **Google Fonts Package** | - سهل وسريع<br>- تحديثات تلقائية<br>- خطوط كثيرة متاحة | - يحتاج اتصال أول مرة<br>- حجم أكبر قليلاً |

**توصيتي**: استخدم **Google Fonts Package** للسرعة والسهولة! 🚀
