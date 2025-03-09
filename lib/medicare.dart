import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medicare/core/routing/app_router.dart';
import 'package:medicare/core/routing/routes.dart';

class MediCare extends StatelessWidget {
  const MediCare({super.key, required this.appRouter});
  final AppRouter appRouter;
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(430, 932),
      minTextAdapt: true,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'MediCare-دوائي',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          scaffoldBackgroundColor: Colors.white,
        ),
        onGenerateRoute: appRouter.onGenerateRoute,
        initialRoute: Routes.welcomeScreen,
      ),
    );
  }
}
