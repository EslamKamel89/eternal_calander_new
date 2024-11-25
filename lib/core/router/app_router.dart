import 'package:eternal_calander_new/core/router/app_routes_names.dart';
import 'package:eternal_calander_new/core/router/middleware.dart';
import 'package:eternal_calander_new/core/widgets/splash_screen.dart';
import 'package:eternal_calander_new/features/date_conversion/presentation/views/date_conversion_view.dart';
import 'package:flutter/material.dart';

class AppRouter {
  AppMiddleWare appMiddleWare;
  AppRouter({required this.appMiddleWare});
  Route? onGenerateRoute(RouteSettings routeSettings) {
    final args = routeSettings.arguments;
    String? routeName = appMiddleWare.middlleware(routeSettings.name);
    switch (routeName) {
      case AppRoutesNames.splashScreen:
        return MaterialPageRoute(
          builder: (context) => const SplashScreen(),
          settings: routeSettings,
        );
      case AppRoutesNames.dateConversionView:
        return MaterialPageRoute(
          builder: (context) => const DateConversionView(),
          settings: routeSettings,
        );

      default:
        return null;
    }
  }
}
