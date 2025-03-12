import 'package:flutter/material.dart';
import 'package:medicare/core/helpers/spacing.dart';
import 'package:medicare/features/welcome/ui/widgets/auth_buttons.dart';
import 'package:medicare/features/welcome/ui/widgets/localiztions_buttons.dart';
import 'package:medicare/features/welcome/ui/widgets/medicare_logo_and_texts.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            LocalizationToogleButtons(),
            verticalSpace(50),
            MediCareLogoAndTexts(),
            verticalSpace(58),
            AuthButtons(),
            verticalSpace(58),
          ],
        ),
      ),
    );
  }
}
