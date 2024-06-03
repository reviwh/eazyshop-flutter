import 'package:eazyshop/presentation/pages/home_page.dart';
import 'package:eazyshop/presentation/pages/search_page.dart';
import 'package:eazyshop/presentation/pages/splash_page.dart';
import 'package:eazyshop/presentation/pages/verification_page.dart';
import 'package:eazyshop/presentation/widgets/error_view.dart';
import 'package:flutter/material.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => const SplashPage());
      case '/verification':
        return MaterialPageRoute(builder: (_) => const VerificationPage());
      case '/home':
        return MaterialPageRoute(builder: (_) => const HomePage());
      case '/order':
        return MaterialPageRoute(
            builder: (_) => const HomePage(currentIndex: 1));
      case '/favorite':
        return MaterialPageRoute(
            builder: (_) => const HomePage(currentIndex: 2));
      case '/profile':
        return MaterialPageRoute(
            builder: (_) => const HomePage(currentIndex: 3));
      case '/search':
        return MaterialPageRoute(builder: (_) => const SearchPage());
      case '/search/product':
        return (args is String)
            ? MaterialPageRoute(builder: (_) => const SearchPage())
            : _errorRoute();
      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return const Scaffold(
        body: ErrorView(message: 'Page not found'),
      );
    });
  }
}
