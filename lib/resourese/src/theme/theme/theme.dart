
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:invoice_web/resourese/resources.dart';
import 'package:invoice_web/resourese/src/colors/colors.dart';
import 'package:invoice_web/resourese/src/theme/theme/text_theme.dart';

abstract class AppTheme {
  static ColorScheme lightColorScheme = const ColorScheme(
    brightness: Brightness.light,
    primary: Color(0xFF363435),
    onPrimary: Color(0xFFFCFCFC),
    primaryContainer: Color(0xFFEBEBEB),
    onPrimaryContainer: Color(0xFF121212),
    secondary: Color(0xFFE5D9AF),
    onSecondary: Color(0xFF292D32),
    secondaryContainer: Color(0xFFE5D9AF),
    onSecondaryContainer: Color(0xFF363435),
    tertiary: Color(0xFFFB7181),
    onTertiary: Color(0xFF121212),
    error: Color(0xFFFF5367),
    onError: Color(0xFFFFFFFF),
    background: Color(0xFFFFFFFF),
    onBackground: Color(0xFF05132E),
    surface: Color(0xFFFFFFFF),
    onSurface: Color(0xFF121212),
    surfaceVariant: Color(0xFFEBF0FF),
    onSurfaceVariant: Color(0xFF9098B1),
    outline: Color(0xFFEBF0FF),
  );

  static ColorScheme darkColorScheme = const ColorScheme(
    brightness: Brightness.dark,
    primary: Color(0xFFE5D9AF),
    onPrimary: Color(0xFF292D32),
    primaryContainer: Color(0xFFE5D9AF),
    onPrimaryContainer: Color(0xFF363435),
    secondary: Color(0xFFE5D9AF),
    onSecondary: Color(0xFF292D32),
    onSecondaryContainer: Color(0xFFFCFCFC),
    tertiary: Color(0xFFFB7181),
    onTertiary: Color(0xFFFCFCFC),
    error: Color(0xFFFF5367),
    onError: Color(0xFFFFFFFF),
    background: Color(0xFF121212),
    onBackground: Color(0xFFE5D9AF),
    surface: Color(0xFF1E1E1E),
    onSurface: Color(0xFFE5D9AF),
    surfaceVariant: Color(0xFF282829),
    onSurfaceVariant: Color(0xFFFCFCFC),
    outline: Color(0xFFE5D9AF),
  );

  static ThemeData getTheme(ColorScheme colorScheme) {
    return ThemeData(
      primaryColor: colorScheme.primary,
      primaryColorDark: colorScheme.primary,
      primaryColorLight: colorScheme.primary,
      colorScheme: colorScheme,
      useMaterial3: true,
      fontFamily: kFontFamily,
      scaffoldBackgroundColor: colorScheme.background,
      pageTransitionsTheme: const PageTransitionsTheme(builders: <TargetPlatform, PageTransitionsBuilder>{
        TargetPlatform.android: ZoomPageTransitionsBuilder(),
        TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
      }),
      inputDecorationTheme: _getInputDecorationTheme(colorScheme),
      typography: AppTextTheme.getTypography(lightColorScheme: lightColorScheme, darkColorScheme: darkColorScheme),
      bottomAppBarTheme: getBottomAppBarTheme(colorScheme),
      popupMenuTheme: _getPopupMenuButtonTheme(colorScheme),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          minimumSize: const Size.fromHeight(48),
          primary: AppColor.colorSecondaryDark,
          textStyle: const TextStyle(
            fontWeight: FontWeight.w700,
            fontFamily: kFontFamily,
            fontSize: 14,
            letterSpacing: 0
          ),
          side: const BorderSide(color: AppColor.colorSecondaryDark),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        ),
      ),
      elevatedButtonTheme: _getElevatedButtonTheme(colorScheme),
      dividerTheme: dividerTheme(colorScheme),
      appBarTheme: getAppBarTheme(colorScheme),
      chipTheme: getChipTheme(colorScheme),
      tabBarTheme: getTabBarTheme(colorScheme),
      iconTheme: getIconTheme(colorScheme),
      // textButtonTheme: TextButtonThemeData(style: textButtonStyle),
      cardTheme: getCardTheme(colorScheme),
      dialogTheme: getDialogTheme(colorScheme),
      radioTheme: getRadioTheme(colorScheme),
      checkboxTheme: getCheckboxTheme(colorScheme),
      // dividerColor: AppColor.beige,
      listTileTheme: getListTileTheme(colorScheme),
      bottomSheetTheme: _getBottomSheetTheme(colorScheme),
    );
  }

  static BottomSheetThemeData _getBottomSheetTheme(ColorScheme colorScheme) {
    return BottomSheetThemeData(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(12)),
      ),
      backgroundColor: colorScheme.background,
      elevation: 4,
      clipBehavior: Clip.hardEdge,
      modalElevation: 8,
      modalBackgroundColor: colorScheme.background,
    );
  }

  static PopupMenuThemeData _getPopupMenuButtonTheme(ColorScheme colorScheme){
    return PopupMenuThemeData(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      elevation: 8,
      color: colorScheme.surface
    );
  }

  static InputDecorationTheme _getInputDecorationTheme(ColorScheme colorScheme) {
    final primaryBorder = BorderSide(color: colorScheme.primary);
    final errorBorder = BorderSide(color: colorScheme.error);
    final inactiveBorder = BorderSide(color: colorScheme.surfaceVariant);
    final border =
        OutlineInputBorder(borderRadius: const BorderRadius.all(Radius.circular(12)), borderSide: inactiveBorder);
    return InputDecorationTheme(
      hintStyle: TextStyle(
          color: colorScheme.onSurfaceVariant, fontSize: 14, fontFamily: kFontFamily, fontWeight: FontWeight.w400),
      fillColor: colorScheme.surface,
      filled: true,
      contentPadding: const EdgeInsets.fromLTRB(16, 14, 16, 14),
      errorStyle: const TextStyle(fontSize: 12, fontFamily: kFontFamily, fontWeight: FontWeight.w500),
      border: border,
      disabledBorder: border,
      enabledBorder: border,
      errorBorder: border.copyWith(borderSide: errorBorder),
      focusedBorder: border.copyWith(borderSide: primaryBorder),
      focusedErrorBorder: border.copyWith(borderSide: errorBorder),
    );
  }

  // Light Theme
  static ThemeData get lightTheme {
    return getTheme(lightColorScheme);
  }

  static AppBarTheme getAppBarTheme(ColorScheme colorScheme) {
    var inverseBrightness = colorScheme.brightness == Brightness.light ? Brightness.dark : Brightness.light;
    return AppBarTheme(
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarBrightness: colorScheme.brightness,
        statusBarIconBrightness: inverseBrightness,
      ),
      centerTitle: false,
      backgroundColor: colorScheme.background,
      foregroundColor: colorScheme.onBackground,
      elevation: 0,
      titleSpacing: 0,
      titleTextStyle: TextStyle(
        fontSize: 16,
        fontFamily: kFontFamily,
        fontWeight: FontWeight.w700,
        color: colorScheme.onBackground,
      ),
      shadowColor: Colors.transparent,
    );
  }

  static ElevatedButtonThemeData _getElevatedButtonTheme(ColorScheme colorScheme) {
    return ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
        textStyle: const TextStyle(fontSize: 14, fontWeight: FontWeight.w700, fontFamily: kFontFamily,letterSpacing: 0),
        shadowColor: colorScheme.primary.withOpacity(0.15),
        elevation: 10,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        minimumSize: const Size.fromHeight(40),
      ).copyWith(
        backgroundColor: AppButtonBackgroundColor(colorScheme.primary),
        foregroundColor: AppButtonBackgroundColor(colorScheme.onPrimary),
      ),
    );
  }

  static ButtonStyle secondaryButtonStyle(ColorScheme colorScheme) {
    return ElevatedButton.styleFrom(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
      textStyle: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600, fontFamily: kFontFamily),
      shadowColor: AppColor.transparent,
      elevation: 0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
    ).copyWith(
      backgroundColor: AppButtonBackgroundColor(colorScheme.primaryContainer),
      foregroundColor: MaterialStateProperty.all(colorScheme.onPrimaryContainer),
    );
  }

  static ButtonStyle getErrorButtonStyle(ColorScheme colorScheme) {
    return ElevatedButton.styleFrom(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
      textStyle: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600, fontFamily: kFontFamily),
      shadowColor: AppColor.transparent,
      elevation: 0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
    ).copyWith(
      backgroundColor: AppButtonBackgroundColor(colorScheme.errorContainer),
      foregroundColor: MaterialStateProperty.all(colorScheme.onErrorContainer),
    );
  }

  static ButtonStyle getTertiaryButtonStyle(ColorScheme colorScheme) {
    return ElevatedButton.styleFrom(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
      textStyle: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600, fontFamily: kFontFamily),
      shadowColor: AppColor.transparent,
      elevation: 0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
    ).copyWith(
      backgroundColor: AppButtonBackgroundColor(Colors.transparent),
      foregroundColor: MaterialStateProperty.all(colorScheme.primary),
    );
  }

  static ButtonStyle getTextButtonStyle(ColorScheme colorScheme) {
    return TextButton.styleFrom(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      textStyle: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600, fontFamily: kFontFamily),
      shadowColor: AppColor.transparent,
      elevation: 0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
    );
  }

  static IconThemeData getIconTheme(ColorScheme colorScheme) {
    return IconThemeData(color: colorScheme.primary);
  }

  static ChipThemeData getChipTheme(ColorScheme colorScheme) {
    return ChipThemeData(
      elevation: 0,
      pressElevation: 4,
      selectedColor: colorScheme.primary,
      backgroundColor: Colors.transparent,
      disabledColor: AppColor.transparent,
      secondarySelectedColor: colorScheme.primary,
      labelStyle: TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.w700,
        fontFamily: kFontFamily,
        color: colorScheme.onTertiary,
      ),
      secondaryLabelStyle: TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.w700,
        fontFamily: kFontFamily,
        color: colorScheme.onPrimary,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
        side: BorderSide(color: colorScheme.surfaceVariant, width: 1.0),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
    );
  }

  static TabBarTheme getTabBarTheme(ColorScheme colorScheme) {
    return TabBarTheme(
      labelStyle: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600, fontFamily: kFontFamily),
      unselectedLabelStyle: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600, fontFamily: kFontFamily),
      labelColor: colorScheme.onPrimary,
      unselectedLabelColor: colorScheme.onBackground,
      indicator: BoxDecoration(
        color: colorScheme.primary,
        borderRadius: const BorderRadius.all(Radius.circular(12)),
        boxShadow: [BoxShadow(color: AppColor.colorSecondaryDark, offset: Offset(0, 1))],
      ),
      labelPadding: const EdgeInsets.symmetric(horizontal: 16),
    );
  }

  static DialogTheme getDialogTheme(ColorScheme colorScheme) {
    return DialogTheme(
      backgroundColor: colorScheme.background,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(16)),
      ),
      titleTextStyle: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w700,
        color: colorScheme.onBackground,
        fontFamily: kFontFamily,
      ),
      contentTextStyle: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w500,
        color: colorScheme.onSurfaceVariant,
        fontFamily: kFontFamily,
      ),
    );
  }

  static CardTheme getCardTheme(ColorScheme colorScheme) {
    return CardTheme(
      color: colorScheme.background,
      elevation: 4,
      shadowColor: AppColor.colorSecondaryDark.withAlpha(50),
      clipBehavior: Clip.hardEdge,
      margin: EdgeInsets.zero,
      shape: RoundedRectangleBorder(
        side: BorderSide(color: AppColor.colorSecondaryDark),
        borderRadius: BorderRadius.all(Radius.circular(14)),
      ),
    );
  }

  static DividerThemeData dividerTheme(ColorScheme colorScheme) {
    return DividerThemeData(color: colorScheme.outline, thickness: 1, space: 1);
  }

  static RadioThemeData getRadioTheme(ColorScheme colorScheme) {
    return RadioThemeData(
      fillColor: MaterialStateProperty.resolveWith((states) {
        if (states.contains(MaterialState.selected)) {
          return colorScheme.primary;
        }
        return colorScheme.onSurfaceVariant;
      }),
    );
  }

  static CheckboxThemeData getCheckboxTheme(ColorScheme colorScheme) {
    return CheckboxThemeData(
      fillColor: MaterialStateProperty.resolveWith((states) {
        if (states.contains(MaterialState.selected)) {
          return colorScheme.primary;
        }
        return colorScheme.onSurfaceVariant;
      }),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
    );
  }

  static BottomAppBarTheme getBottomAppBarTheme(ColorScheme colorScheme) =>
      const BottomAppBarTheme(color: AppColor.transparent, elevation: 0);

  // Dark Theme
  static ThemeData get darkTheme {
    return getTheme(darkColorScheme);
  }

  static ListTileThemeData getListTileTheme(ColorScheme colorScheme) => ListTileThemeData(
      selectedColor: colorScheme.primary, selectedTileColor: colorScheme.primary, textColor: colorScheme.onBackground);
}

class AppButtonBackgroundColor extends MaterialStateProperty<Color> {
  final Color primary;

  AppButtonBackgroundColor(this.primary);

  @override
  Color resolve(Set<MaterialState> states) {
    if (states.contains(MaterialState.disabled)) {
      return AppColor.colorSecondaryDark;
    }
    return primary;
  }
}
