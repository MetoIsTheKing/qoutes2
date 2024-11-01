import 'package:flutter/material.dart';
import 'package:random_qoutes/features/random_qoutes/presentation/screeens/favourite_qoute_screen.dart';
import 'package:random_qoutes/features/random_qoutes/presentation/screeens/qoute_home.dart';

class Routes {
  static const String qouteHome = '/';
  static const String favouriteQoute = '/favorite';
}

// final appRoutes = {
//   Routes.qouteHome: (context) => const QouteHomeScreen(),
//   Routes.favouriteQoute: (context) => const FavouriteQouteScreen(),
// };

class AppRoutes {
  static Route? onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case Routes.qouteHome:
        return MaterialPageRoute(
          builder: (context) => const QouteHomeScreen(),
        );
      case Routes.favouriteQoute:
        return MaterialPageRoute(
          builder: (context) => const FavouriteQouteScreen(),
        );
      default:
        return undefinedRoute();
    }
  }

  static Route<dynamic> undefinedRoute() {
    return MaterialPageRoute(
      builder: (context) => const Scaffold(
        body: Center(
          child: Text('Undefined Route'),
        ),
      ),
    );
  }
}
