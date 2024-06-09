import 'package:fb_clone/core/screens/error_screen.dart';
import 'package:fb_clone/core/screens/homescreen.dart';
import 'package:fb_clone/features/auth/presentation/screens/create_account_screen.dart';
import 'package:flutter/cupertino.dart';

class Routes {
  static Route onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case CreateAccountScreen.routeName:
        return _cupertinoRoute(const CreateAccountScreen());

      case HomeScreen.routeName:
        return _cupertinoRoute(const HomeScreen());
      default:
        return _cupertinoRoute(
          ErrorScreen(
            error: 'Wrong Route provided ${settings.name}',
          ),
        );
    }
  }

  static Route _cupertinoRoute(Widget view) => CupertinoPageRoute(
        builder: (_) => view,
      );

  Routes._();
}