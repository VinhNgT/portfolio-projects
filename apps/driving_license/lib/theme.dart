// ignore_for_file: use_full_hex_values_for_flutter_colors, prefer_single_quotes

import "package:flutter/material.dart";

class MaterialTheme {
  final TextTheme textTheme;

  const MaterialTheme(this.textTheme);

  static MaterialScheme lightScheme() {
    return const MaterialScheme(
      brightness: Brightness.light,
      primary: Color(4282998162),
      surfaceTint: Color(4282998162),
      onPrimary: Color(4294967295),
      primaryContainer: Color(4292535039),
      onPrimaryContainer: Color(4278196295),
      secondary: Color(4281295500),
      onSecondary: Color(4294967295),
      secondaryContainer: Color(4291749375),
      onSecondaryContainer: Color(4278197555),
      tertiary: Color(4281821501),
      onTertiary: Color(4294967295),
      tertiaryContainer: Color(4290310585),
      onTertiaryContainer: Color(4278198536),
      error: Color(4287646274),
      onError: Color(4294967295),
      errorContainer: Color(4294957781),
      onErrorContainer: Color(4282059014),
      background: Color(4294637823),
      onBackground: Color(4279900961),
      surface: Color(4294637823),
      onSurface: Color(4279900961),
      surfaceVariant: Color(4292993772),
      onSurfaceVariant: Color(4282730063),
      outline: Color(4285888384),
      outlineVariant: Color(4291151568),
      shadow: Color(4278190080),
      scrim: Color(4278190080),
      inverseSurface: Color(4281282614),
      inverseOnSurface: Color(4294045943),
      inversePrimary: Color(4289906175),
      primaryFixed: Color(4292535039),
      onPrimaryFixed: Color(4278196295),
      primaryFixedDim: Color(4289906175),
      onPrimaryFixedVariant: Color(4281353592),
      secondaryFixed: Color(4291749375),
      onSecondaryFixed: Color(4278197555),
      secondaryFixedDim: Color(4288400379),
      onSecondaryFixedVariant: Color(4279126643),
      tertiaryFixed: Color(4290310585),
      onTertiaryFixed: Color(4278198536),
      tertiaryFixedDim: Color(4288533662),
      onTertiaryFixedVariant: Color(4280176936),
      surfaceDim: Color(4292532704),
      surfaceBright: Color(4294637823),
      surfaceContainerLowest: Color(4294967295),
      surfaceContainerLow: Color(4294243322),
      surfaceContainer: Color(4293848564),
      surfaceContainerHigh: Color(4293453807),
      surfaceContainerHighest: Color(4293059305),
    );
  }

  ThemeData light() {
    return theme(lightScheme().toColorScheme());
  }

  static MaterialScheme lightMediumContrastScheme() {
    return const MaterialScheme(
      brightness: Brightness.light,
      primary: Color(4281090420),
      surfaceTint: Color(4282998162),
      onPrimary: Color(4294967295),
      primaryContainer: Color(4284445610),
      onPrimaryContainer: Color(4294967295),
      secondary: Color(4278535791),
      onSecondary: Color(4294967295),
      secondaryContainer: Color(4282939812),
      onSecondaryContainer: Color(4294967295),
      tertiary: Color(4279847972),
      onTertiary: Color(4294967295),
      tertiaryContainer: Color(4283269202),
      onTertiaryContainer: Color(4294967295),
      error: Color(4285411368),
      onError: Color(4294967295),
      errorContainer: Color(4289355862),
      onErrorContainer: Color(4294967295),
      background: Color(4294637823),
      onBackground: Color(4279900961),
      surface: Color(4294637823),
      onSurface: Color(4279900961),
      surfaceVariant: Color(4292993772),
      onSurfaceVariant: Color(4282466891),
      outline: Color(4284309351),
      outlineVariant: Color(4286151299),
      shadow: Color(4278190080),
      scrim: Color(4278190080),
      inverseSurface: Color(4281282614),
      inverseOnSurface: Color(4294045943),
      inversePrimary: Color(4289906175),
      primaryFixed: Color(4284445610),
      onPrimaryFixed: Color(4294967295),
      primaryFixedDim: Color(4282800783),
      onPrimaryFixedVariant: Color(4294967295),
      secondaryFixed: Color(4282939812),
      onSecondaryFixed: Color(4294967295),
      secondaryFixedDim: Color(4281098377),
      onSecondaryFixedVariant: Color(4294967295),
      tertiaryFixed: Color(4283269202),
      onTertiaryFixed: Color(4294967295),
      tertiaryFixedDim: Color(4281624379),
      onTertiaryFixedVariant: Color(4294967295),
      surfaceDim: Color(4292532704),
      surfaceBright: Color(4294637823),
      surfaceContainerLowest: Color(4294967295),
      surfaceContainerLow: Color(4294243322),
      surfaceContainer: Color(4293848564),
      surfaceContainerHigh: Color(4293453807),
      surfaceContainerHighest: Color(4293059305),
    );
  }

  ThemeData lightMediumContrast() {
    return theme(lightMediumContrastScheme().toColorScheme());
  }

  static MaterialScheme lightHighContrastScheme() {
    return const MaterialScheme(
      brightness: Brightness.light,
      primary: Color(4278460241),
      surfaceTint: Color(4282998162),
      onPrimary: Color(4294967295),
      primaryContainer: Color(4281090420),
      onPrimaryContainer: Color(4294967295),
      secondary: Color(4278199357),
      onSecondary: Color(4294967295),
      secondaryContainer: Color(4278535791),
      onSecondaryContainer: Color(4294967295),
      tertiary: Color(4278200587),
      onTertiary: Color(4294967295),
      tertiaryContainer: Color(4279847972),
      onTertiaryContainer: Color(4294967295),
      error: Color(4282650635),
      onError: Color(4294967295),
      errorContainer: Color(4285411368),
      onErrorContainer: Color(4294967295),
      background: Color(4294637823),
      onBackground: Color(4279900961),
      surface: Color(4294637823),
      onSurface: Color(4278190080),
      surfaceVariant: Color(4292993772),
      onSurfaceVariant: Color(4280427563),
      outline: Color(4282466891),
      outlineVariant: Color(4282466891),
      shadow: Color(4278190080),
      scrim: Color(4278190080),
      inverseSurface: Color(4281282614),
      inverseOnSurface: Color(4294967295),
      inversePrimary: Color(4293389311),
      primaryFixed: Color(4281090420),
      onPrimaryFixed: Color(4294967295),
      primaryFixedDim: Color(4279446108),
      onPrimaryFixedVariant: Color(4294967295),
      secondaryFixed: Color(4278535791),
      onSecondaryFixed: Color(4294967295),
      secondaryFixedDim: Color(4278202189),
      onSecondaryFixedVariant: Color(4294967295),
      tertiaryFixed: Color(4279847972),
      onTertiaryFixed: Color(4294967295),
      tertiaryFixedDim: Color(4278203665),
      onTertiaryFixedVariant: Color(4294967295),
      surfaceDim: Color(4292532704),
      surfaceBright: Color(4294637823),
      surfaceContainerLowest: Color(4294967295),
      surfaceContainerLow: Color(4294243322),
      surfaceContainer: Color(4293848564),
      surfaceContainerHigh: Color(4293453807),
      surfaceContainerHighest: Color(4293059305),
    );
  }

  ThemeData lightHighContrast() {
    return theme(lightHighContrastScheme().toColorScheme());
  }

  static MaterialScheme darkScheme() {
    return const MaterialScheme(
      brightness: Brightness.dark,
      primary: Color(4289906175),
      surfaceTint: Color(4289906175),
      onPrimary: Color(4279709280),
      primaryContainer: Color(4281353592),
      onPrimaryContainer: Color(4292535039),
      secondary: Color(4288400379),
      onSecondary: Color(4278203219),
      secondaryContainer: Color(4279126643),
      onSecondaryContainer: Color(4291749375),
      tertiary: Color(4288533662),
      onTertiary: Color(4278270227),
      tertiaryContainer: Color(4280176936),
      onTertiaryContainer: Color(4290310585),
      error: Color(4294948010),
      onError: Color(4283833880),
      errorContainer: Color(4285740076),
      onErrorContainer: Color(4294957781),
      background: Color(4279374616),
      onBackground: Color(4293059305),
      surface: Color(4279374616),
      onSurface: Color(4293059305),
      surfaceVariant: Color(4282730063),
      onSurfaceVariant: Color(4291151568),
      outline: Color(4287598746),
      outlineVariant: Color(4282730063),
      shadow: Color(4278190080),
      scrim: Color(4278190080),
      inverseSurface: Color(4293059305),
      inverseOnSurface: Color(4281282614),
      inversePrimary: Color(4282998162),
      primaryFixed: Color(4292535039),
      onPrimaryFixed: Color(4278196295),
      primaryFixedDim: Color(4289906175),
      onPrimaryFixedVariant: Color(4281353592),
      secondaryFixed: Color(4291749375),
      onSecondaryFixed: Color(4278197555),
      secondaryFixedDim: Color(4288400379),
      onSecondaryFixedVariant: Color(4279126643),
      tertiaryFixed: Color(4290310585),
      onTertiaryFixed: Color(4278198536),
      tertiaryFixedDim: Color(4288533662),
      onTertiaryFixedVariant: Color(4280176936),
      surfaceDim: Color(4279374616),
      surfaceBright: Color(4281874751),
      surfaceContainerLowest: Color(4279045651),
      surfaceContainerLow: Color(4279900961),
      surfaceContainer: Color(4280164133),
      surfaceContainerHigh: Color(4280822319),
      surfaceContainerHighest: Color(4281545786),
    );
  }

  ThemeData dark() {
    return theme(darkScheme().toColorScheme());
  }

  static MaterialScheme darkMediumContrastScheme() {
    return const MaterialScheme(
      brightness: Brightness.dark,
      primary: Color(4290300671),
      surfaceTint: Color(4289906175),
      onPrimary: Color(4278195005),
      primaryContainer: Color(4286287816),
      onPrimaryContainer: Color(4278190080),
      secondary: Color(4288663551),
      onSecondary: Color(4278196266),
      secondaryContainer: Color(4284847554),
      onSecondaryContainer: Color(4278190080),
      tertiary: Color(4288796834),
      onTertiary: Color(4278196998),
      tertiaryContainer: Color(4285046124),
      onTertiaryContainer: Color(4278190080),
      error: Color(4294949552),
      onError: Color(4281533443),
      errorContainer: Color(4291591024),
      onErrorContainer: Color(4278190080),
      background: Color(4279374616),
      onBackground: Color(4293059305),
      surface: Color(4279374616),
      onSurface: Color(4294769407),
      surfaceVariant: Color(4282730063),
      onSurfaceVariant: Color(4291414740),
      outline: Color(4288783020),
      outlineVariant: Color(4286677900),
      shadow: Color(4278190080),
      scrim: Color(4278190080),
      inverseSurface: Color(4293059305),
      inverseOnSurface: Color(4280887855),
      inversePrimary: Color(4281419386),
      primaryFixed: Color(4292535039),
      onPrimaryFixed: Color(4278193970),
      primaryFixedDim: Color(4289906175),
      onPrimaryFixedVariant: Color(4280169574),
      secondaryFixed: Color(4291749375),
      onSecondaryFixed: Color(4278194722),
      secondaryFixedDim: Color(4288400379),
      onSecondaryFixedVariant: Color(4278204764),
      tertiaryFixed: Color(4290310585),
      onTertiaryFixed: Color(4278195460),
      tertiaryFixedDim: Color(4288533662),
      onTertiaryFixedVariant: Color(4278796056),
      surfaceDim: Color(4279374616),
      surfaceBright: Color(4281874751),
      surfaceContainerLowest: Color(4279045651),
      surfaceContainerLow: Color(4279900961),
      surfaceContainer: Color(4280164133),
      surfaceContainerHigh: Color(4280822319),
      surfaceContainerHighest: Color(4281545786),
    );
  }

  ThemeData darkMediumContrast() {
    return theme(darkMediumContrastScheme().toColorScheme());
  }

  static MaterialScheme darkHighContrastScheme() {
    return const MaterialScheme(
      brightness: Brightness.dark,
      primary: Color(4294769407),
      surfaceTint: Color(4289906175),
      onPrimary: Color(4278190080),
      primaryContainer: Color(4290300671),
      onPrimaryContainer: Color(4278190080),
      secondary: Color(4294638335),
      onSecondary: Color(4278190080),
      secondaryContainer: Color(4288663551),
      onSecondaryContainer: Color(4278190080),
      tertiary: Color(4293984236),
      onTertiary: Color(4278190080),
      tertiaryContainer: Color(4288796834),
      onTertiaryContainer: Color(4278190080),
      error: Color(4294965752),
      onError: Color(4278190080),
      errorContainer: Color(4294949552),
      onErrorContainer: Color(4278190080),
      background: Color(4279374616),
      onBackground: Color(4293059305),
      surface: Color(4279374616),
      onSurface: Color(4294967295),
      surfaceVariant: Color(4282730063),
      onSurfaceVariant: Color(4294769407),
      outline: Color(4291414740),
      outlineVariant: Color(4291414740),
      shadow: Color(4278190080),
      scrim: Color(4278190080),
      inverseSurface: Color(4293059305),
      inverseOnSurface: Color(4278190080),
      inversePrimary: Color(4279183194),
      primaryFixed: Color(4292929279),
      onPrimaryFixed: Color(4278190080),
      primaryFixedDim: Color(4290300671),
      onPrimaryFixedVariant: Color(4278195005),
      secondaryFixed: Color(4292274687),
      onSecondaryFixed: Color(4278190080),
      secondaryFixedDim: Color(4288663551),
      onSecondaryFixedVariant: Color(4278196266),
      tertiaryFixed: Color(4290573757),
      onTertiaryFixed: Color(4278190080),
      tertiaryFixedDim: Color(4288796834),
      onTertiaryFixedVariant: Color(4278196998),
      surfaceDim: Color(4279374616),
      surfaceBright: Color(4281874751),
      surfaceContainerLowest: Color(4279045651),
      surfaceContainerLow: Color(4279900961),
      surfaceContainer: Color(4280164133),
      surfaceContainerHigh: Color(4280822319),
      surfaceContainerHighest: Color(4281545786),
    );
  }

  ThemeData darkHighContrast() {
    return theme(darkHighContrastScheme().toColorScheme());
  }

  ThemeData theme(ColorScheme colorScheme) => ThemeData(
        useMaterial3: true,
        brightness: colorScheme.brightness,
        colorScheme: colorScheme,
        textTheme: textTheme.apply(
          bodyColor: colorScheme.onSurface,
          displayColor: colorScheme.onSurface,
        ),
        scaffoldBackgroundColor: colorScheme.background,
        canvasColor: colorScheme.surface,
      );

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
