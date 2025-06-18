import 'package:animated_auth/feature/home/views/manager/home_cubit/home_cubit%20.dart';
import 'package:animated_auth/feature/home/widget/home_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => HomeCubit(),
        child: const HomeViewBody(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
            context: context,
            isScrollControlled: true,
            backgroundColor: Colors.transparent, // شفافية للخلفية
            builder: (context) => const _AnimatedBottomSheetContent(),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}

class _AnimatedBottomSheetContent extends StatefulWidget {
  const _AnimatedBottomSheetContent();

  @override
  State<_AnimatedBottomSheetContent> createState() =>
      _AnimatedBottomSheetContentState();
}

class _AnimatedBottomSheetContentState
    extends State<_AnimatedBottomSheetContent>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;
  // late Animation<Offset> _slideAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    )..forward();

    _scaleAnimation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeOutBack,
    );

    // _slideAnimation = Tween<Offset>(
    //   begin: const Offset(0, 0.3),
    //   end: Offset.zero,
    // ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ScaleTransition(
      scale: _scaleAnimation,
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: const [
            Text("Hello from Bottom Sheet!", style: TextStyle(fontSize: 20)),
            SizedBox(height: 20),
            Text("You can add your custom content here."),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
