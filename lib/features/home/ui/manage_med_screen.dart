import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medicare/features/home/ui/widgets/home_top_bar.dart';

class ManageMedScreen extends StatelessWidget {
  const ManageMedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 18.w),
          child: Column(
            children: [
              HomeTopBar(),
            ],
          ),
        ),
      ),
    );
  }
}
