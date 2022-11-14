import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'home_provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  static Widget(BuildContext context){
    return ChangeNotifierProvider(
      create: (BuildContext context) => HomeProvider(),
      builder: (context, child) => const HomePage(),
    );
  }

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

