# 🔐 Animated Auth App (Flutter)

تطبيق واجهات Flutter لعرض تجربة تسجيل دخول مع شاشات تمهيدية (Onboarding) وتاب رئيسي متحرك (Animated Dashboard).  
تم تصميم المشروع مع التركيز على تنظيم الكود، الرسوم المتحركة، وإدارة الحالة باستخدام `flutter_bloc`.

---

## 🎬 العرض التوضيحي

### 📱 نسخة الموبايل:
[🔗 اضغط هنا لمشاهدة فيديو الموبايل](https://drive.google.com/file/d/13DI712MnUke_Vi4YQ3Cl3WejQNo3Xp_x/view?usp=sharing)

### 💻 نسخة الويب:
[🔗 اضغط هنا لمشاهدة فيديو الويب](https://drive.google.com/file/d/1ELcgE2lDgm6aJY8J_EjAw-emTOa1FW_i/view?usp=sharing)

---

## 🧩 مميزات التطبيق

- Splash Screen افتتاحية
- Onboarding بـ 3 صفحات مع انتقالات جذابة
- صفحة تسجيل دخول 
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
- تنظيم الثوابت والألوان والـ Themes في `core/`

### 4. Shared Layer
- مكونات مشتركة (Widgets مثل الأزرار، مربعات الإدخال، إلخ)

---
<p align="center">
  <img src="https://github.com/ahmedgfouad/Animated-Auth/blob/main/5.gif?raw=true" width="250" alt="Auth Demo" style="margin-right: 20px;" />
  <img src="https://github.com/ahmedgfouad/Animated-Auth/blob/main/1.gif?raw=true" width="250" alt="Auth Demo" style="margin-right: 20px;" />
  <img src="https://github.com/ahmedgfouad/Animated-Auth/blob/main/2.gif?raw=true" width="250" alt="Auth Demo" />
</p>

<p align="center">
  <img src="https://github.com/ahmedgfouad/Animated-Auth/blob/main/4.gif?raw=true" width="400" alt="Auth Demo" style="margin-right: 20px;" />
  <img src="https://github.com/ahmedgfouad/Animated-Auth/blob/main/3.gif?raw=true" width="400" alt="Auth Demo" />
</p>




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
