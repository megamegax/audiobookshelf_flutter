import 'package:audiobookshelf_flutter/l10n-generated/app_localizations.dart';
import 'package:audiobookshelf_flutter/pages/splash_screen.dart';
import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() async {
  runApp(const ProviderScope(child: MyApp()));
}

// Light and dark ColorSchemes made by FlexColorScheme v7.0.5.
// These ColorScheme objects require Flutter 3.7 or later.
const ColorScheme flexSchemeLight = ColorScheme(
  brightness: Brightness.light,
  primary: Color.fromRGBO(0, 72, 129, 1),
  onPrimary: Color(0xffffffff),
  primaryContainer: Color(0xffd0e4ff),
  onPrimaryContainer: Color(0xff111314),
  secondary: Color(0xffac3306),
  onSecondary: Color(0xffffffff),
  secondaryContainer: Color(0xffffdbcf),
  onSecondaryContainer: Color(0xff141211),
  tertiary: Color(0xff006875),
  onTertiary: Color(0xffffffff),
  tertiaryContainer: Color(0xff95f0ff),
  onTertiaryContainer: Color(0xff0d1414),
  error: Color(0xffba1a1a),
  onError: Color(0xffffffff),
  errorContainer: Color(0xffffdad6),
  onErrorContainer: Color(0xff410002),
  background: Color(0xfff8f9fb),
  onBackground: Color(0xff090909),
  surface: Color(0xfff8f9fb),
  onSurface: Color(0xff090909),
  surfaceVariant: Color(0xffe0e4e8),
  onSurfaceVariant: Color(0xff111112),
  outline: Color(0xff7c7c7c),
  outlineVariant: Color(0xffc8c8c8),
  shadow: Color(0xff000000),
  scrim: Color(0xff000000),
  inverseSurface: Color(0xff101214),
  onInverseSurface: Color(0xfff5f5f5),
  inversePrimary: Color(0xff92c5ee),
  surfaceTint: Color(0xff004881),
);

const ColorScheme flexSchemeDark = ColorScheme(
  brightness: Brightness.dark,
  primary: Color.fromARGB(255, 244, 150, 56),
  onPrimary: Color(0xff141414),
  primaryContainer: Color(0xff19598d),
  onPrimaryContainer: Color(0xffe3edf5),
  secondary: Color(0xffffded3),
  onSecondary: Color(0xff141414),
  secondaryContainer: Color(0xffb4471e),
  onSecondaryContainer: Color(0xfffceae4),
  tertiary: Color(0xff9ff1ff),
  onTertiary: Color(0xff101414),
  tertiaryContainer: Color(0xff197682),
  onTertiaryContainer: Color(0xffe3f2f4),
  error: Color(0xffffb4ab),
  onError: Color(0xff690005),
  errorContainer: Color(0xff93000a),
  onErrorContainer: Color(0xffffb4ab),
  background: Color(0xff1a1b1d),
  onBackground: Color(0xffededed),
  surface: Color(0xff1a1b1d),
  onSurface: Color(0xffededed),
  surfaceVariant: Color(0xff424446),
  onSurfaceVariant: Color(0xffe1e1e1),
  outline: Color(0xff7a7a7a),
  outlineVariant: Color(0xff2e2e2e),
  shadow: Color(0xff000000),
  scrim: Color(0xff000000),
  inverseSurface: Color(0xfffcfdff),
  onInverseSurface: Color(0xff131314),
  inversePrimary: Color(0xff697177),
  surfaceTint: Color(0xffd4e6ff),
);
final navigatorKeyProvider = Provider((_) => GlobalKey<NavigatorState>());

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp(
      navigatorKey: ref.watch(navigatorKeyProvider),
      home: const SplashScreen(),
      theme: FlexThemeData.light(colorScheme: flexSchemeLight),
      darkTheme: FlexThemeData.dark(colorScheme: flexSchemeDark),
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
    );
  }
}
