// import 'package:fb_clone/features/auth/presentation/screens/create_account_screen.dart';
import 'package:fb_clone/config/routes/routes.dart';
import 'package:fb_clone/config/themes/app_theme.dart';
import 'package:fb_clone/core/screens/homescreen.dart';
import 'package:fb_clone/core/screens/loader.dart';
import 'package:fb_clone/features/auth/presentation/screens/login_screen.dart';
import 'package:fb_clone/features/auth/presentation/screens/verify_email_screen.dart';
import 'package:fb_clone/firebase_options.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.appTheme(),
      home: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Loader();
          }

          if (snapshot.hasData) {
            final user = snapshot.data;
            if (user!.emailVerified) {
              return const HomeScreen();
            } else {
              return const VerifyEmailScreen();
            }
          }
          return const LoginScreen();
        },
      ),
      onGenerateRoute: Routes.onGenerateRoute,
    );
  }
}
