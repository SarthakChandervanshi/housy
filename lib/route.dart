import 'package:flutter/material.dart';

import 'main.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments as dynamic;
    switch (settings.name) {
      case '/home': return MaterialPageRoute(builder: (context) => Home());
      default:
        return _errorRoute(settings.name);
    }
  }

  static Route<dynamic> _errorRoute(String? name) {

    return MaterialPageRoute(builder: (context) =>   Scaffold(
      body: Center(
        child: Text('ROUTE\n\n$name\n\nNOT FOUND'),
      ),
    ),
    );
    //
    // return  Scaffold(
    //   body: Center(
    //     child: Text('ROUTE\n\n$name\n\nNOT FOUND'),
    //   ),
    // );
  }
}