import 'package:flutter/material.dart';
import 'package:medicare/features/welcome/ui/widgets/localiztions_buttons.dart';
import 'package:medicare/generated/l10n.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            LocalizationToogleButtons(),
            Text(
              S.of(context).Welcome,
            ),
          ],
        ),
      ),
    );
  }
}
