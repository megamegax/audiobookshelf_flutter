import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get buttonSave => 'Save';

  @override
  String get buttonLogin => 'Login';

  @override
  String get labelLoginScreen => 'Login to Audiobookshelf';

  @override
  String get labelUsername => 'Username';

  @override
  String get labelPassword => 'Password';

  @override
  String get labelSetServerAddress => 'Set Server Address';

  @override
  String get labelServerAddress => 'Server Address';

  @override
  String get labelServerAddressDescription => 'Enter the server address of Audiobookshelf';

  @override
  String get headerContinueListening => 'Continue listening';

  @override
  String get headerContinueSeries => 'Continue series';

  @override
  String get headerRecentSeries => 'Recent series';

  @override
  String get headerDiscover => 'Discover';

  @override
  String get headerListenAgain => 'Listen again';
}
