part of 'app.dart';

class AppProvider extends BaseProvider {
  AppProvider(BuildContext context) : super(context) {
    _themeMode = ThemeMode.system;
    _brightness = _systemBrightness;
    WidgetsBinding.instance.window.onPlatformBrightnessChanged = () {
      _brightness = _systemBrightness;
      notifyListeners();
    };
  }

  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
  final RouteObserver routeObserver = RouteObserver();
  Locale _locale = const Locale.fromSubtags(languageCode: 'en');

  Locale get locale => _locale;

  set locale(Locale value) {
    _locale = value;
    notifyListeners();
  }

  late ThemeMode _themeMode;

  late Brightness _brightness;

  ThemeMode get themeMode => _themeMode;

  Brightness get brightness => _brightness;

  Brightness get _systemBrightness => WidgetsBinding.instance.window.platformBrightness;

  set themeMode(ThemeMode value) {
    if (value == _themeMode) return;
    _themeMode = value;
    switch (_themeMode) {
      case ThemeMode.system:
        _brightness = _systemBrightness;
        WidgetsBinding.instance.window.onPlatformBrightnessChanged = () {
          _brightness = _systemBrightness;
          notifyListeners();
        };
        break;
      case ThemeMode.light:
        _brightness = Brightness.light;
        WidgetsBinding.instance.window.onPlatformBrightnessChanged = null;
        break;
      case ThemeMode.dark:
        _brightness = Brightness.dark;
        WidgetsBinding.instance.window.onPlatformBrightnessChanged = null;
        break;
    }
    notifyListeners();
  }
}
