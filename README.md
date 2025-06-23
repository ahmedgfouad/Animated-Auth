# 🔐 Animated Auth App (Flutter)

تطبيق واجهات Flutter لعرض تجربة تسجيل دخول مع شاشات تمهيدية (Onboarding) وتاب رئيسي متحرك (Animated Dashboard).  
تم تصميم المشروع مع التركيز على تنظيم الكود، الرسوم المتحركة، وإدارة الحالة باستخدام `flutter_bloc`.

---

## 🎬 العرض التوضيحي

[[📽️ اضغط هنا لمشاهدة الفيديو]([https://drive.google.com/file/d/13DI712MnUke_Vi4YQ3Cl3WejQNo3Xp_x/view?usp=sharing](https://drive.google.com/file/d/13DI712MnUke_Vi4YQ3Cl3WejQNo3Xp_x/view?usp=sharing))
](https://drive.google.com/file/d/13DI712MnUke_Vi4YQ3Cl3WejQNo3Xp_x/view?usp=sharing)
---

## 🧩 مميزات التطبيق

- Splash Screen افتتاحية
- Onboarding بـ 3 صفحات مع انتقالات جذابة
- صفحة تسجيل دخول وتسجيل حساب جديدة
- لوحة تحكم (Dashboard) تحتوي على تبويبات متحركة
- إدارة الحالة باستخدام `flutter_bloc`
- تنقل مرن باستخدام `go_router`
- Animations باستخدام أدوات Flutter الأصلية مثل AnimatedContainer, AnimatedOpacity, TweenAnimationBuilder (implicit و explicit)
دون استخدام مكتبات خارجية مثل flutter_animate.
- دعم الوضع الليلي (Dark Mode)
- تنظيم الكود في Layers واضحة وسهلة التوسع

---

## 🏗️ بنية المشروع (Architecture)

يعتمد المشروع على بنية Layered Architecture تُقسم المسؤوليات بشكل واضح:

### 1. UI Layer
- تحتوي على الشاشات (Splash, Onboarding, Login, Home)
- التنقل يتم من خلال `GoRouter`
- واجهات مصممة باستخدام `StatelessWidget` و`StatefulWidget` 

### 2. State Management Layer
- يتم استخدام `flutter_bloc` للتحكم في الحالة
- كل Feature تحتوي على Cubit خاص بها لإدارة التفاعل مثل:
  - `OnboardingCubit`
  - `AuthCubit`
  - `HomeCubit`

### 3. Core Layer
- تنظيم الثوابت والألوان والـ Themes في `core/utils`

### 4. Shared Layer
- مكونات مشتركة (Widgets مثل الأزرار، مربعات الإدخال، إلخ)

---

## 📁 هيكل المجلدات

```bash
/lib
├── core/
│   ├── router/           
│   ├── themes/        
│   ├── constant/        
│   └── widgets/  
├── feature/
│   ├── splash/
│   ├── onboarding/
│   ├── auth/           
│   ├── home/                
├── main.dart
