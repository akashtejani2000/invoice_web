import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:invoice_web/base/base_provider.dart';
import 'package:invoice_web/generated/l10n.dart';
import 'package:invoice_web/ui/splash_screen/splash_screen.dart';
import 'package:provider/provider.dart';
part 'app_provider.dart';

class SwapsiesApp extends StatefulWidget {
  const SwapsiesApp({Key? key}) : super(key: key);

  @override
  State<SwapsiesApp> createState() => _SwapsiesAppState();
}

class _SwapsiesAppState extends State<SwapsiesApp> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void deactivate() {
    super.deactivate();
  }

  @override
  void activate() {
    super.activate();
  }

  void onDeepLinkCallback(Uri uri) {
    debugPrint("onDeepLinkCallback -> uri : $uri");
    debugPrint("onDeepLinkCallback -> queryParameters : ${uri.queryParameters}");
    /*if (uri.queryParameters.containsKey(keyShareUserId)) {
      shareUserId = int.parse(uri.queryParameters[keyShareUserId]!.replaceAll(":", ""));
    }

    if (uri.queryParameters.containsKey(keyShareRestaurantId)) {
      shareRestaurantId = int.parse(uri.queryParameters[keyShareRestaurantId]!.replaceAll(":", ""));
      shareMenuId = int.parse(uri.queryParameters[shareMenuId]!.replaceAll(":", ""));
    }*/
  }

  @override
  Widget build(BuildContext context) {
    final appProvider = Provider.of<AppProvider>(context, listen: true);
    var inverseBrightness = appProvider.brightness == Brightness.light ? Brightness.dark : Brightness.light;
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
        statusBarBrightness: appProvider.brightness,
        statusBarIconBrightness: inverseBrightness,
        systemNavigationBarIconBrightness: inverseBrightness,
        systemNavigationBarColor: Colors.transparent,
        statusBarColor: Colors.transparent,
        systemNavigationBarDividerColor: Colors.transparent,
        systemNavigationBarContrastEnforced: false,
        systemStatusBarContrastEnforced: false,
      ),
      child: MaterialApp(
        navigatorKey: appProvider.navigatorKey,
        onGenerateTitle: (context) => S.current.appName,
        debugShowCheckedModeBanner: false,
        navigatorObservers: [appProvider.routeObserver],
        themeMode: appProvider.themeMode,
        // themeMode:  ThemeMode.dark,
        initialRoute: SplashScreen.routeName,
        routes: routes,
        locale: appProvider.locale,
        supportedLocales: S.delegate.supportedLocales,
        localizationsDelegates: const [
          S.delegate,
        ],
      ),
    );
  }

  Map<String, WidgetBuilder> get routes => <String, WidgetBuilder>{
        SplashScreen.routeName: SplashScreen.builder,
      };
}
