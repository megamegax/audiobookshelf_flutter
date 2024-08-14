import 'app_localizations.dart';

// ignore_for_file: type=lint

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

  @override
  String get headerContinueListening => 'Hallgatás folytatása';

  @override
  String get headerContinueSeries => 'Sorozat folytatása';

  @override
  String get headerRecentSeries => 'Nemrég hozzáadott sorozatok';

  @override
  String get headerDiscover => 'Felfedezés';

  @override
  String get headerListenAgain => 'Újra hallgatás';
}
