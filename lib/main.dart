import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'providers/all_providers.dart';
import 'screens/home_page.dart';
import 'utils/app_colors.dart';
import 'utils/nav_key.dart';
import 'utils/app_router.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: allProviders,
      child: ScreenUtilInit(
        designSize: const Size(375, 812),
        builder: (context, child) {
          return MaterialApp(
            title: 'MiniMart',
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
              colorScheme: ColorScheme.fromSeed(seedColor: AppColors.primary),
              scaffoldBackgroundColor: AppColors.background,
              fontFamily: 'IBMPlexSans',
              fontFamilyFallback: const ['Roboto', 'sans-serif'],
              textTheme: const TextTheme(
                bodyLarge: TextStyle(fontFamily: 'IBMPlexSans'),
                bodyMedium: TextStyle(fontFamily: 'IBMPlexSans'),
                bodySmall: TextStyle(fontFamily: 'IBMPlexSans'),
              ),
              useMaterial3: true,
            ),
            navigatorKey: NavKey.appNavKey,
            onGenerateRoute: AppRouter.onGenerateRoute,
            home: const HomePage(),
          );
        },
      ),
    );
  }
}