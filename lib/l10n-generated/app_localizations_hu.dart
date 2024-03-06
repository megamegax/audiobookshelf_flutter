import 'app_localizations.dart';

/// The translations for Hungarian (`hu`).
class AppLocalizationsHu extends AppLocalizations {
  AppLocalizationsHu([String locale = 'hu']) : super(locale);

  @override
  String get buttonSave => 'Mentés';

  @override
  String get buttonLogin => 'Bejelentkezés';

  @override
  String get labelLoginScreen => 'Bejelentkezés az Audiobookshelfbe';

  @override
  String get labelUsername => 'Felhasználónév';

  @override
  String get labelPassword => 'Jelszó';

  @override
  String get labelSetServerAddress => 'Szerver Cím Beállítása';

  @override
  String get labelServerAddress => 'Szerver Cím';

  @override
  String get labelServerAddressDescription => 'Adja meg az Audiobookshelf szerver címét';
}
