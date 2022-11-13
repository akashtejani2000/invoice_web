import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class AppPref {
  static const _isLogin = "is_login";
  static const _isAuthEnable = "is_auth_enable";
  static const _userToken = "user_token";
  static const _refreshToken = "refresh_token";
  static const _isFirstTime = "is_first_time";
  static const _user = "user";

  AppPref._();

  static late final SharedPreferences _preference;

  static Future<void> init() async {
    _preference = await SharedPreferences.getInstance();
  }

  static Future<bool> clear() {
    return _preference.clear();
  }

  static bool get isLogin => _preference.getBool(_isLogin) ?? false;

  static set isLogin(bool value) => _preference.setBool(_isLogin, value);

  static bool get isAuthEnable => _preference.getBool(_isAuthEnable) ?? false;

  static set isAuthEnable(bool value) => _preference.setBool(_isAuthEnable, value);

  static String get userToken => _preference.getString(_userToken) ?? "";

  static set userToken(String value) => _preference.setString(_userToken, value);

  static String get refreshToken => _preference.getString(_refreshToken) ?? "";

  static set refreshToken(String value) => _preference.setString(_refreshToken, value);

  static bool get isFirstTime => _preference.getBool(_isFirstTime) ?? true;

  static set isFirstTime(bool value) => _preference.setBool(_isFirstTime, value);

  /*static User? get user => _preference.containsKey(_user) ? User.fromJson(_preference.getString(_user)) : null;

  static set user(User? user) => _preference.setString(_user, jsonEncode(user?.toJson() ?? {}));*/
}
