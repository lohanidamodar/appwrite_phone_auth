import 'package:appwrite_phone_auth/login.dart';
import 'package:appwrite_phone_auth/res/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: AppColors.primaryColor),
        scaffoldBackgroundColor: AppColors.backgroundColor,
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            minimumSize: const Size(0, 60),
          ),
        ),
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.transparent,
          elevation: 0,
          iconTheme: const IconThemeData(
            color: AppColors.secondaryColor,
          ),
          actionsIconTheme: const IconThemeData(
            color: AppColors.secondaryColor,
          ),
          foregroundColor: const Color.fromRGBO(55, 59, 77, 1),
          titleTextStyle: GoogleFonts.poppins(
            fontWeight: FontWeight.w600,
            fontSize: 16.0,
            color: AppColors.titleTextColor,
          ),
        ),
        cardTheme: const CardTheme(
          elevation: 0.5,
        ),
        textTheme: GoogleFonts.poppinsTextTheme(
          ThemeData.light().textTheme.copyWith(
                displayMedium:
                    ThemeData.light().textTheme.displayMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                          color: AppColors.titleTextColor,
                        ),
              ),
        ),
      ),
      home: const LoginPage(),
    );
  }
}
