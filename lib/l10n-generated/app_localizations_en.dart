import 'app_localizations.dart';

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
}
