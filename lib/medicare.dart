import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medicare/core/localization/locale_cubit.dart';
import 'package:medicare/core/routing/app_router.dart';
import 'package:medicare/core/routing/routes.dart';
import 'package:medicare/generated/l10n.dart';

class MediCare extends StatelessWidget {
  const MediCare({super.key, required this.appRouter});
  final AppRouter appRouter;
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(430, 932),
      minTextAdapt: true,
      child: BlocProvider(
        create: (context) => LocaleCubit(),
        child: BlocBuilder<LocaleCubit, Locale>(
          builder: (context, locale) {
            return MaterialApp(
              localizationsDelegates: [
                S.delegate,
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate,
              ],
              supportedLocales: S.delegate.supportedLocales,
              locale: locale,
              debugShowCheckedModeBanner: false,
              title: 'MediCare-دوائي',
              theme: ThemeData(
                primarySwatch: Colors.blue,
                scaffoldBackgroundColor: Colors.white,
                fontFamily:
                    context.read<LocaleCubit>().isArabic ? 'Cairo' : 'Poppins',
              ),
              onGenerateRoute: appRouter.onGenerateRoute,
              initialRoute: Routes.welcomeScreen,
            );
          },
        ),
      ),
    );
  }
}
