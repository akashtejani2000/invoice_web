import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:invoice_web/app/app.dart';
import 'package:provider/provider.dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);


  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => AppProvider(context)),
      ],
      child: const InvoiceApp(),
    ),
  );
}
