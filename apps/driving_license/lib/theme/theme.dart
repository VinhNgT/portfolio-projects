import 'package:flutter/material.dart';

class MaterialTheme {
  // final TextTheme textTheme;

  // const MaterialTheme(this.textTheme);
  const MaterialTheme();

  static MaterialScheme lightScheme() {
    return const MaterialScheme(
      brightness: Brightness.light,
      primary: Color(0xff495d92),
      surfaceTint: Color(0xff495d92),
      onPrimary: Color(0xffffffff),
      primaryContainer: Color(0xffdae2ff),
      onPrimaryContainer: Color(0xff001847),
      secondary: Color(0xff2f628c),
      onSecondary: Color(0xffffffff),
      secondaryContainer: Color(0xffcee5ff),
      onSecondaryContainer: Color(0xff001d33),
      tertiary: Color(0xff37693d),
      onTertiary: Color(0xffffffff),
      tertiaryContainer: Color(0xffb8f1b9),
      onTertiaryContainer: Color(0xff002108),
      error: Color(0xff904a42),
      onError: Color(0xffffffff),
      errorContainer: Color(0xffffdad5),
      onErrorContainer: Color(0xff3b0906),
      background: Color(0xfffaf8ff),
      onBackground: Color(0xff1a1b21),
      surface: Color(0xfffaf8ff),
      onSurface: Color(0xff1a1b21),
      surfaceVariant: Color(0xffe1e2ec),
      onSurfaceVariant: Color(0xff45464f),
      outline: Color(0xff757780),
      outlineVariant: Color(0xffc5c6d0),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xff2f3036),
      inverseOnSurface: Color(0xfff1f0f7),
      inversePrimary: Color(0xffb2c5ff),
      primaryFixed: Color(0xffdae2ff),
      onPrimaryFixed: Color(0xff001847),
      primaryFixedDim: Color(0xffb2c5ff),
      onPrimaryFixedVariant: Color(0xff304578),
      secondaryFixed: Color(0xffcee5ff),
      onSecondaryFixed: Color(0xff001d33),
      secondaryFixedDim: Color(0xff9bcbfb),
      onSecondaryFixedVariant: Color(0xff0e4a73),
      tertiaryFixed: Color(0xffb8f1b9),
      onTertiaryFixed: Color(0xff002108),
      tertiaryFixedDim: Color(0xff9dd49e),
      onTertiaryFixedVariant: Color(0xff1e5128),
      surfaceDim: Color(0xffdad9e0),
      surfaceBright: Color(0xfffaf8ff),
      surfaceContainerLowest: Color(0xffffffff),
      surfaceContainerLow: Color(0xfff4f3fa),
      surfaceContainer: Color(0xffeeedf4),
      surfaceContainerHigh: Color(0xffe8e7ef),
      surfaceContainerHighest: Color(0xffe2e2e9),
    );
  }

  ThemeData light() {
    return theme(lightScheme().toColorScheme());
  }

  static MaterialScheme lightMediumContrastScheme() {
    return const MaterialScheme(
      brightness: Brightness.light,
      primary: Color(0xff2c4174),
      surfaceTint: Color(0xff495d92),
      onPrimary: Color(0xffffffff),
      primaryContainer: Color(0xff5f73aa),
      onPrimaryContainer: Color(0xffffffff),
      secondary: Color(0xff05466f),
      onSecondary: Color(0xffffffff),
      secondaryContainer: Color(0xff4879a4),
      onSecondaryContainer: Color(0xffffffff),
      tertiary: Color(0xff194c24),
      onTertiary: Color(0xffffffff),
      tertiaryContainer: Color(0xff4d8052),
      onTertiaryContainer: Color(0xffffffff),
      error: Color(0xff6e3028),
      onError: Color(0xffffffff),
      errorContainer: Color(0xffaa6056),
      onErrorContainer: Color(0xffffffff),
      background: Color(0xfffaf8ff),
      onBackground: Color(0xff1a1b21),
      surface: Color(0xfffaf8ff),
      onSurface: Color(0xff1a1b21),
      surfaceVariant: Color(0xffe1e2ec),
      onSurfaceVariant: Color(0xff41424b),
      outline: Color(0xff5d5f67),
      outlineVariant: Color(0xff797a83),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xff2f3036),
      inverseOnSurface: Color(0xfff1f0f7),
      inversePrimary: Color(0xffb2c5ff),
      primaryFixed: Color(0xff5f73aa),
      onPrimaryFixed: Color(0xffffffff),
      primaryFixedDim: Color(0xff465a8f),
      onPrimaryFixedVariant: Color(0xffffffff),
      secondaryFixed: Color(0xff4879a4),
      onSecondaryFixed: Color(0xffffffff),
      secondaryFixedDim: Color(0xff2c6089),
      onSecondaryFixedVariant: Color(0xffffffff),
      tertiaryFixed: Color(0xff4d8052),
      onTertiaryFixed: Color(0xffffffff),
      tertiaryFixedDim: Color(0xff34673b),
      onTertiaryFixedVariant: Color(0xffffffff),
      surfaceDim: Color(0xffdad9e0),
      surfaceBright: Color(0xfffaf8ff),
      surfaceContainerLowest: Color(0xffffffff),
      surfaceContainerLow: Color(0xfff4f3fa),
      surfaceContainer: Color(0xffeeedf4),
      surfaceContainerHigh: Color(0xffe8e7ef),
      surfaceContainerHighest: Color(0xffe2e2e9),
    );
  }

  ThemeData lightMediumContrast() {
    return theme(lightMediumContrastScheme().toColorScheme());
  }

  static MaterialScheme lightHighContrastScheme() {
    return const MaterialScheme(
      brightness: Brightness.light,
      primary: Color(0xff041f51),
      surfaceTint: Color(0xff495d92),
      onPrimary: Color(0xffffffff),
      primaryContainer: Color(0xff2c4174),
      onPrimaryContainer: Color(0xffffffff),
      secondary: Color(0xff00243d),
      onSecondary: Color(0xffffffff),
      secondaryContainer: Color(0xff05466f),
      onSecondaryContainer: Color(0xffffffff),
      tertiary: Color(0xff00290b),
      onTertiary: Color(0xffffffff),
      tertiaryContainer: Color(0xff194c24),
      onTertiaryContainer: Color(0xffffffff),
      error: Color(0xff44100b),
      onError: Color(0xffffffff),
      errorContainer: Color(0xff6e3028),
      onErrorContainer: Color(0xffffffff),
      background: Color(0xfffaf8ff),
      onBackground: Color(0xff1a1b21),
      surface: Color(0xfffaf8ff),
      onSurface: Color(0xff000000),
      surfaceVariant: Color(0xffe1e2ec),
      onSurfaceVariant: Color(0xff22242b),
      outline: Color(0xff41424b),
      outlineVariant: Color(0xff41424b),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xff2f3036),
      inverseOnSurface: Color(0xffffffff),
      inversePrimary: Color(0xffe7ebff),
      primaryFixed: Color(0xff2c4174),
      onPrimaryFixed: Color(0xffffffff),
      primaryFixedDim: Color(0xff132a5c),
      onPrimaryFixedVariant: Color(0xffffffff),
      secondaryFixed: Color(0xff05466f),
      onSecondaryFixed: Color(0xffffffff),
      secondaryFixedDim: Color(0xff002f4d),
      onSecondaryFixedVariant: Color(0xffffffff),
      tertiaryFixed: Color(0xff194c24),
      onTertiaryFixed: Color(0xffffffff),
      tertiaryFixedDim: Color(0xff003511),
      onTertiaryFixedVariant: Color(0xffffffff),
      surfaceDim: Color(0xffdad9e0),
      surfaceBright: Color(0xfffaf8ff),
      surfaceContainerLowest: Color(0xffffffff),
      surfaceContainerLow: Color(0xfff4f3fa),
      surfaceContainer: Color(0xffeeedf4),
      surfaceContainerHigh: Color(0xffe8e7ef),
      surfaceContainerHighest: Color(0xffe2e2e9),
    );
  }

  ThemeData lightHighContrast() {
    return theme(lightHighContrastScheme().toColorScheme());
  }

  static MaterialScheme darkScheme() {
    return const MaterialScheme(
      brightness: Brightness.dark,
      primary: Color(0xffb2c5ff),
      surfaceTint: Color(0xffb2c5ff),
      onPrimary: Color(0xff172e60),
      primaryContainer: Color(0xff304578),
      onPrimaryContainer: Color(0xffdae2ff),
      secondary: Color(0xff9bcbfb),
      onSecondary: Color(0xff003353),
      secondaryContainer: Color(0xff0e4a73),
      onSecondaryContainer: Color(0xffcee5ff),
      tertiary: Color(0xff9dd49e),
      onTertiary: Color(0xff013913),
      tertiaryContainer: Color(0xff1e5128),
      onTertiaryContainer: Color(0xffb8f1b9),
      error: Color(0xffffb4aa),
      onError: Color(0xff561e18),
      errorContainer: Color(0xff73342c),
      onErrorContainer: Color(0xffffdad5),
      background: Color(0xff121318),
      onBackground: Color(0xffe2e2e9),
      surface: Color(0xff121318),
      onSurface: Color(0xffe2e2e9),
      surfaceVariant: Color(0xff45464f),
      onSurfaceVariant: Color(0xffc5c6d0),
      outline: Color(0xff8f909a),
      outlineVariant: Color(0xff45464f),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xffe2e2e9),
      inverseOnSurface: Color(0xff2f3036),
      inversePrimary: Color(0xff495d92),
      primaryFixed: Color(0xffdae2ff),
      onPrimaryFixed: Color(0xff001847),
      primaryFixedDim: Color(0xffb2c5ff),
      onPrimaryFixedVariant: Color(0xff304578),
      secondaryFixed: Color(0xffcee5ff),
      onSecondaryFixed: Color(0xff001d33),
      secondaryFixedDim: Color(0xff9bcbfb),
      onSecondaryFixedVariant: Color(0xff0e4a73),
      tertiaryFixed: Color(0xffb8f1b9),
      onTertiaryFixed: Color(0xff002108),
      tertiaryFixedDim: Color(0xff9dd49e),
      onTertiaryFixedVariant: Color(0xff1e5128),
      surfaceDim: Color(0xff121318),
      surfaceBright: Color(0xff38393f),
      surfaceContainerLowest: Color(0xff0d0e13),
      surfaceContainerLow: Color(0xff1a1b21),
      surfaceContainer: Color(0xff1e1f25),
      surfaceContainerHigh: Color(0xff282a2f),
      surfaceContainerHighest: Color(0xff33343a),
    );
  }

  ThemeData dark() {
    return theme(darkScheme().toColorScheme());
  }

  static MaterialScheme darkMediumContrastScheme() {
    return const MaterialScheme(
      brightness: Brightness.dark,
      primary: Color(0xffb8caff),
      surfaceTint: Color(0xffb2c5ff),
      onPrimary: Color(0xff00133d),
      primaryContainer: Color(0xff7b8fc8),
      onPrimaryContainer: Color(0xff000000),
      secondary: Color(0xff9fcfff),
      onSecondary: Color(0xff00182a),
      secondaryContainer: Color(0xff6595c2),
      onSecondaryContainer: Color(0xff000000),
      tertiary: Color(0xffa1d8a2),
      onTertiary: Color(0xff001b06),
      tertiaryContainer: Color(0xff689d6c),
      onTertiaryContainer: Color(0xff000000),
      error: Color(0xffffbab0),
      onError: Color(0xff330403),
      errorContainer: Color(0xffcc7b70),
      onErrorContainer: Color(0xff000000),
      background: Color(0xff121318),
      onBackground: Color(0xffe2e2e9),
      surface: Color(0xff121318),
      onSurface: Color(0xfffcfaff),
      surfaceVariant: Color(0xff45464f),
      onSurfaceVariant: Color(0xffc9cad4),
      outline: Color(0xffa1a2ac),
      outlineVariant: Color(0xff81838c),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xffe2e2e9),
      inverseOnSurface: Color(0xff292a2f),
      inversePrimary: Color(0xff31467a),
      primaryFixed: Color(0xffdae2ff),
      onPrimaryFixed: Color(0xff000f32),
      primaryFixedDim: Color(0xffb2c5ff),
      onPrimaryFixedVariant: Color(0xff1e3466),
      secondaryFixed: Color(0xffcee5ff),
      onSecondaryFixed: Color(0xff001222),
      secondaryFixedDim: Color(0xff9bcbfb),
      onSecondaryFixedVariant: Color(0xff00395c),
      tertiaryFixed: Color(0xffb8f1b9),
      onTertiaryFixed: Color(0xff001504),
      tertiaryFixedDim: Color(0xff9dd49e),
      onTertiaryFixedVariant: Color(0xff093f18),
      surfaceDim: Color(0xff121318),
      surfaceBright: Color(0xff38393f),
      surfaceContainerLowest: Color(0xff0d0e13),
      surfaceContainerLow: Color(0xff1a1b21),
      surfaceContainer: Color(0xff1e1f25),
      surfaceContainerHigh: Color(0xff282a2f),
      surfaceContainerHighest: Color(0xff33343a),
    );
  }

  ThemeData darkMediumContrast() {
    return theme(darkMediumContrastScheme().toColorScheme());
  }

  static MaterialScheme darkHighContrastScheme() {
    return const MaterialScheme(
      brightness: Brightness.dark,
      primary: Color(0xfffcfaff),
      surfaceTint: Color(0xffb2c5ff),
      onPrimary: Color(0xff000000),
      primaryContainer: Color(0xffb8caff),
      onPrimaryContainer: Color(0xff000000),
      secondary: Color(0xfffafaff),
      onSecondary: Color(0xff000000),
      secondaryContainer: Color(0xff9fcfff),
      onSecondaryContainer: Color(0xff000000),
      tertiary: Color(0xfff0ffec),
      onTertiary: Color(0xff000000),
      tertiaryContainer: Color(0xffa1d8a2),
      onTertiaryContainer: Color(0xff000000),
      error: Color(0xfffff9f8),
      onError: Color(0xff000000),
      errorContainer: Color(0xffffbab0),
      onErrorContainer: Color(0xff000000),
      background: Color(0xff121318),
      onBackground: Color(0xffe2e2e9),
      surface: Color(0xff121318),
      onSurface: Color(0xffffffff),
      surfaceVariant: Color(0xff45464f),
      onSurfaceVariant: Color(0xfffcfaff),
      outline: Color(0xffc9cad4),
      outlineVariant: Color(0xffc9cad4),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xffe2e2e9),
      inverseOnSurface: Color(0xff000000),
      inversePrimary: Color(0xff0f275a),
      primaryFixed: Color(0xffe0e6ff),
      onPrimaryFixed: Color(0xff000000),
      primaryFixedDim: Color(0xffb8caff),
      onPrimaryFixedVariant: Color(0xff00133d),
      secondaryFixed: Color(0xffd6e9ff),
      onSecondaryFixed: Color(0xff000000),
      secondaryFixedDim: Color(0xff9fcfff),
      onSecondaryFixedVariant: Color(0xff00182a),
      tertiaryFixed: Color(0xffbcf5bd),
      onTertiaryFixed: Color(0xff000000),
      tertiaryFixedDim: Color(0xffa1d8a2),
      onTertiaryFixedVariant: Color(0xff001b06),
      surfaceDim: Color(0xff121318),
      surfaceBright: Color(0xff38393f),
      surfaceContainerLowest: Color(0xff0d0e13),
      surfaceContainerLow: Color(0xff1a1b21),
      surfaceContainer: Color(0xff1e1f25),
      surfaceContainerHigh: Color(0xff282a2f),
      surfaceContainerHighest: Color(0xff33343a),
    );
  }

  ThemeData darkHighContrast() {
    return theme(darkHighContrastScheme().toColorScheme());
  }

  // ThemeData theme(ColorScheme colorScheme) => ThemeData(
  //       useMaterial3: true,
  //       brightness: colorScheme.brightness,
  //       colorScheme: colorScheme,
  //       textTheme: textTheme.apply(
  //         bodyColor: colorScheme.onSurface,
  //         displayColor: colorScheme.onSurface,
  //       ),
  //       scaffoldBackgroundColor: colorScheme.background,
  //       canvasColor: colorScheme.surface,
  //     );

  ThemeData theme(ColorScheme colorScheme) {
    final m3Theme = ThemeData(useMaterial3: true);

    return m3Theme.copyWith(
      brightness: colorScheme.brightness,
      colorScheme: colorScheme,
      textTheme: m3Theme.textTheme.apply(
        bodyColor: colorScheme.onSurface,
        displayColor: colorScheme.onSurface,
      ),
      scaffoldBackgroundColor: colorScheme.background,
      canvasColor: colorScheme.surface,
    );
  }

  List<ExtendedColor> get extendedColors => [];
}

class MaterialScheme {
  const MaterialScheme({
    required this.brightness,
    required this.primary,
    required this.surfaceTint,
    required this.onPrimary,
    required this.primaryContainer,
    required this.onPrimaryContainer,
    required this.secondary,
    required this.onSecondary,
    required this.secondaryContainer,
    required this.onSecondaryContainer,
    required this.tertiary,
    required this.onTertiary,
    required this.tertiaryContainer,
    required this.onTertiaryContainer,
    required this.error,
    required this.onError,
    required this.errorContainer,
    required this.onErrorContainer,
    required this.background,
    required this.onBackground,
    required this.surface,
    required this.onSurface,
    required this.surfaceVariant,
    required this.onSurfaceVariant,
    required this.outline,
    required this.outlineVariant,
    required this.shadow,
    required this.scrim,
    required this.inverseSurface,
    required this.inverseOnSurface,
    required this.inversePrimary,
    required this.primaryFixed,
    required this.onPrimaryFixed,
    required this.primaryFixedDim,
    required this.onPrimaryFixedVariant,
    required this.secondaryFixed,
    required this.onSecondaryFixed,
    required this.secondaryFixedDim,
    required this.onSecondaryFixedVariant,
    required this.tertiaryFixed,
    required this.onTertiaryFixed,
    required this.tertiaryFixedDim,
    required this.onTertiaryFixedVariant,
    required this.surfaceDim,
    required this.surfaceBright,
    required this.surfaceContainerLowest,
    required this.surfaceContainerLow,
    required this.surfaceContainer,
    required this.surfaceContainerHigh,
    required this.surfaceContainerHighest,
  });

  final Brightness brightness;
  final Color primary;
  final Color surfaceTint;
  final Color onPrimary;
  final Color primaryContainer;
  final Color onPrimaryContainer;
  final Color secondary;
  final Color onSecondary;
  final Color secondaryContainer;
  final Color onSecondaryContainer;
  final Color tertiary;
  final Color onTertiary;
  final Color tertiaryContainer;
  final Color onTertiaryContainer;
  final Color error;
  final Color onError;
  final Color errorContainer;
  final Color onErrorContainer;
  final Color background;
  final Color onBackground;
  final Color surface;
  final Color onSurface;
  final Color surfaceVariant;
  final Color onSurfaceVariant;
  final Color outline;
  final Color outlineVariant;
  final Color shadow;
  final Color scrim;
  final Color inverseSurface;
  final Color inverseOnSurface;
  final Color inversePrimary;
  final Color primaryFixed;
  final Color onPrimaryFixed;
  final Color primaryFixedDim;
  final Color onPrimaryFixedVariant;
  final Color secondaryFixed;
  final Color onSecondaryFixed;
  final Color secondaryFixedDim;
  final Color onSecondaryFixedVariant;
  final Color tertiaryFixed;
  final Color onTertiaryFixed;
  final Color tertiaryFixedDim;
  final Color onTertiaryFixedVariant;
  final Color surfaceDim;
  final Color surfaceBright;
  final Color surfaceContainerLowest;
  final Color surfaceContainerLow;
  final Color surfaceContainer;
  final Color surfaceContainerHigh;
  final Color surfaceContainerHighest;
}

extension MaterialSchemeUtils on MaterialScheme {
  ColorScheme toColorScheme() {
    return ColorScheme(
      brightness: brightness,
      primary: primary,
      onPrimary: onPrimary,
      primaryContainer: primaryContainer,
      onPrimaryContainer: onPrimaryContainer,
      secondary: secondary,
      onSecondary: onSecondary,
      secondaryContainer: secondaryContainer,
      onSecondaryContainer: onSecondaryContainer,
      tertiary: tertiary,
      onTertiary: onTertiary,
      tertiaryContainer: tertiaryContainer,
      onTertiaryContainer: onTertiaryContainer,
      error: error,
      onError: onError,
      errorContainer: errorContainer,
      onErrorContainer: onErrorContainer,
      background: background,
      onBackground: onBackground,
      surface: surface,
      onSurface: onSurface,
      surfaceVariant: surfaceVariant,
      onSurfaceVariant: onSurfaceVariant,
      outline: outline,
      outlineVariant: outlineVariant,
      shadow: shadow,
      scrim: scrim,
      inverseSurface: inverseSurface,
      onInverseSurface: inverseOnSurface,
      inversePrimary: inversePrimary,
    );
  }
}

class ExtendedColor {
  final Color seed, value;
  final ColorFamily light;
  final ColorFamily lightHighContrast;
  final ColorFamily lightMediumContrast;
  final ColorFamily dark;
  final ColorFamily darkHighContrast;
  final ColorFamily darkMediumContrast;

  const ExtendedColor({
    required this.seed,
    required this.value,
    required this.light,
    required this.lightHighContrast,
    required this.lightMediumContrast,
    required this.dark,
    required this.darkHighContrast,
    required this.darkMediumContrast,
  });
}

class ColorFamily {
  const ColorFamily({
    required this.color,
    required this.onColor,
    required this.colorContainer,
    required this.onColorContainer,
  });

  final Color color;
  final Color onColor;
  final Color colorContainer;
  final Color onColorContainer;
}
