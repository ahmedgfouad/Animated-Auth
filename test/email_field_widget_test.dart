import 'package:animated_auth/feature/login/presentation/views/widgets/email_filed_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:animated_auth/core/theme/colors.dart';

void main() {
  testWidgets('EmailFieldWidget displays hint and responds to focus', (tester) async {
    final controller = TextEditingController();

    final customAppColors = const AppColors(
      move: Colors.purple,
      orange: Colors.orange,
      white: Colors.white,
      offWhite: Color(0xFFF7F7F7),
      grey: Colors.grey,
      green: Colors.green,
    );

    await tester.pumpWidget(
      MaterialApp(
        theme: ThemeData(
          extensions: <ThemeExtension<dynamic>>[
            customAppColors,
          ],
        ),
        home: Scaffold(
          body: MediaQuery(
            data: const MediaQueryData(),
            child: EmailFieldWidget(
              hintText: 'Enter your email',
              controller: controller,
            ),
          ),
        ),
      ),
    );

    // تحقق من ظهور النص
    expect(find.text('Enter your email'), findsOneWidget);

    // اكتب نص داخل الفيلد
    await tester.enterText(find.byType(TextField), 'test@example.com');
    await tester.pumpAndSettle();

    expect(controller.text, equals('test@example.com'));
  });
}
