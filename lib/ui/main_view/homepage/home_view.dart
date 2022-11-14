import 'package:flutter/material.dart';
import 'package:invoice_web/base/base_provider.dart';
import 'package:provider/provider.dart';

part 'home_provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  static widget(BuildContext context){
    return ChangeNotifierProvider(
      create: (BuildContext context) => HomeProvider(context),
      builder: (context, child) => const HomePage(),
    );
  }

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

      ),
    );
  }
}

