import 'package:flutter/material.dart';
import 'package:json_project/views/pages/cars_reviews.dart';
import 'package:json_project/views/pages/homePage.dart';

class RouteManager {
  static const String homePage = '/';
  static const String screen2 = '/screen2';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case homePage:
        return MaterialPageRoute(
          builder: (context) => const HomePage(),
        );

      case screen2:
        return MaterialPageRoute(
          builder: (context) => const CarsReviews(),
        );

      default:
        throw const FormatException('No pages exist');
    }
  }
}
