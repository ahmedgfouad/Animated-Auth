import 'package:animated_auth/core/theme/colors.dart';
import 'package:flutter/material.dart';

class CustomHomeCardWidget extends StatefulWidget {
  const CustomHomeCardWidget({
    super.key,
    required this.title,
    required this.subtitle,
    required this.image,
  });

  final String title, subtitle, image;

  @override
  State<CustomHomeCardWidget> createState() => _CustomHomeCardWidgetState();
}

class _CustomHomeCardWidgetState extends State<CustomHomeCardWidget>
    with TickerProviderStateMixin {
  late AnimationController _fadeController;
  late AnimationController _slideController;
  late Animation<double> _fadeAnimation;
  late Animation<Offset> _slideAnimation;

  @override
  void initState() {
    super.initState();

    _fadeController = AnimationController(
      duration: const Duration(milliseconds: 800),
      vsync: this,
    );
    _fadeAnimation = CurvedAnimation(
      parent: _fadeController,
      curve: Curves.easeIn,
    );
    _fadeController.forward();

    _slideController = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    )..repeat(reverse: true);

    _slideAnimation =
        Tween<Offset>(
          begin: const Offset(0, -0.01),
          end: const Offset(0, 0.01),
        ).animate(
          CurvedAnimation(parent: _slideController, curve: Curves.easeInOut),
        );
  }

  @override
  void dispose() {
    _fadeController.dispose();
    _slideController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: _fadeAnimation,
      child: SlideTransition(
        position: _slideAnimation,
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height / 5,
          padding: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 10.0),
          decoration: BoxDecoration(
            color: context.appColors.white,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Row(
                children: [
                  CircleAvatar(
                    radius: 25,
                    backgroundColor: const Color.fromARGB(255, 136, 215, 139),
                    child: Image.asset(widget.image, height: 20),
                  ),
                  const Spacer(),
                  Text(
                    widget.title,
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: context.appColors.grey,
                    ),
                  ),
                ],
              ),
              Text(
                widget.subtitle,
                style: const TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
