import 'package:flutter/material.dart';
import 'package:invoice_web/theme/theme.dart';
import 'package:invoice_web/ui/main_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: lightThemeData,
      darkTheme: darkThemeData,
      home: const MainView(),
    );
  }
}
