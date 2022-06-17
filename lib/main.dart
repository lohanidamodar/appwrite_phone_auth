import 'package:appwrite_phone_auth/login.dart';
import 'package:appwrite_phone_auth/profile.dart';
import 'package:appwrite_phone_auth/providers/app_state.dart';
import 'package:appwrite_phone_auth/res/colors.dart';
import 'package:appwrite_phone_auth/verify_phone.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authState = ref.watch(AuthState.provider);
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
      home: authState.isLoggedIn ? const ProfilePage() : const LoginPage(),
      onGenerateRoute: (RouteSettings settings) {
        return MaterialPageRoute(builder: (context) {
          switch (settings.name) {
            case '/':
              return authState.isLoggedIn ? const ProfilePage() : const LoginPage();
            case '/verify':
              return VerificationScreen((settings.arguments! as String));
            default:
              return const LoginPage();
          }
        });
      },
    );
  }
}
