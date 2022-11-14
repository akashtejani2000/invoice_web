import 'package:flutter/material.dart';
import 'package:invoice_web/resourese/src/colors/colors.dart';

class SplashScreen extends StatefulWidget {
  static const String routeName = "/";

  static Widget builder(BuildContext context) {
    return const SplashScreen();
  }

  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(backgroundColor: AppColor.yellow);
  }

}
