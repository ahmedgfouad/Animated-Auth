# 🔐 Animated Auth 

A Flutter UI application that showcases a complete authentication flow with onboarding screens and an animated bottom navigation dashboard.  
The project is designed with a strong focus on clean architecture, animations, and state management using `flutter_bloc`.

---

## 🎬 Demo

### 📱 Mobile Version:
[🔗 Click here to watch the mobile demo video](https://drive.google.com/file/d/13DI712MnUke_Vi4YQ3Cl3WejQNo3Xp_x/view?usp=sharing)

### 💻 Web Version:
[🔗 Click here to watch the web demo video](https://drive.google.com/file/d/1ELcgE2lDgm6aJY8J_EjAw-emTOa1FW_i/view?usp=sharing)

---

## 🧩 Features

- Introductory Splash Screen
- Onboarding flow with 3 beautiful animated pages
- Login screen with clean UI
- Animated dashboard with bottom navigation
- State management using `flutter_bloc`
- Smooth navigation using `go_router`
- Built-in Flutter animations using `AnimatedContainer`, `AnimatedOpacity`, `TweenAnimationBuilder`  
  (includes both implicit and explicit animations — no external libraries like `flutter_animate` used)
- Full dark mode support
- Scalable and clean layered code structure

---

## 🏗️ Project Architecture

The project follows a **Layered Architecture** that clearly separates responsibilities:

### 1. UI Layer
- Contains all screens (Splash, Onboarding, Login, Home)
- Navigation is managed via `GoRouter`
- UI built using `StatelessWidget` and `StatefulWidget`

### 2. State Management Layer
- State handled with `flutter_bloc`
- Each feature has its own dedicated `Cubit` such as:
  - `OnboardingCubit`
  - `AuthCubit`
  - `HomeCubit`

### 3. Core Layer
- Contains app-wide constants, color schemes, and themes under `core/`

### 4. Shared Layer
- Contains reusable UI components (buttons, input fields, etc.)

---

<p align="center">
  <img src="https://github.com/ahmedgfouad/Animated-Auth/blob/main/5.gif?raw=true" width="250" alt="Auth Demo" style="margin-right: 20px;" />
  <img src="https://github.com/ahmedgfouad/Animated-Auth/blob/main/1.gif?raw=true" width="250" alt="Auth Demo" style="margin-right: 20px;" />
  <img src="https://github.com/ahmedgfouad/Animated-Auth/blob/main/2.gif?raw=true" width="250" alt="Auth Demo" />
</p>

<p align="center">
  <img src="https://github.com/ahmedgfouad/Animated-Auth/blob/main/4.gif?raw=true" width="300" alt="Auth Demo" style="margin-right: 20px;" />
  <img src="https://github.com/ahmedgfouad/Animated-Auth/blob/main/3.gif?raw=true" width="300" alt="Auth Demo" />
</p>

---

## 📁 Folder Structure

```bash
/lib
├── core/
│   ├── router/           # App navigation and routes
│   ├── themes/           # Light/Dark themes and color schemes
│   ├── constant/         # App-wide constants
│   └── widgets/          # Shared reusable widgets
├── feature/
│   ├── splash/           # Splash screen logic and UI
│   ├── onboarding/       # Onboarding flow
│   ├── auth/             # Login functionality
│   ├── home/             # Home screen & dashboard
├── main.dart             # App entry point
