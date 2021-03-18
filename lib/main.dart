import 'package:flutter/material.dart';
import 'package:flutter_card_selector_demo/home_page.dart';
import 'package:flutter_card_selector_demo/splash_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context)
        .textTheme
        .apply(displayColor: Colors.white70, bodyColor: Colors.white70);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(brightness: Brightness.dark, textTheme: theme),
      home: Splash(),
    );
  }
}

