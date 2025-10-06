# Audiobookshelf Flutter - Fejlesztési Útmutató

## Általános Elvek

### Clean Code Irányelvek
- **Osztály méret**: Egy osztály maximum 200-300 sor lehet
- **Felelősségi kör**: Minden osztály egyetlen felelősségi kört kezeljen (Single Responsibility Principle)
- **Design Pattern-ek**: Használj Factory, Strategy, és egyéb design pattern-eket a kód tisztaságáért
- **Névadás**: Beszédes, egyértelmű neveket használj
- **Kommentelés**: Csak a komplex logikát kommenteld, a kód magától érthető legyen

### Platform Kompatibilitás
- **Android**: Teljes támogatás minden funkcióhoz
- **iOS**: Teljes támogatás minden funkcióhoz  
- **macOS**: Teljes támogatás minden funkcióhoz
- **Platform specifikus kód**: Használj `Platform.isAndroid`, `Platform.isIOS`, `Platform.isMacOS` ellenőrzéseket

### Dependency Management

#### Current Compatible Versions (as of latest update)
- **Riverpod**: 2.6.1 (Riverpod 3.0 has breaking changes with StateProvider)
- **Freezed**: 2.5.7 (Freezed 3.0 has breaking changes with DiagnosticableTreeMixin)
- **Isar Community**: 3.1.0+1 (for Android compatibility)
- **Android Gradle Plugin**: 8.2.1+ (for Java 21 compatibility)
- **Gradle**: 8.7+ (for Java 21 compatibility)
- **Kotlin**: 2.1.0 (latest stable)

#### Migration Notes
- **Riverpod 3.0**: StateProvider was removed, use StateNotifierProvider instead
- **Freezed 3.0**: Classes no longer automatically implement DiagnosticableTreeMixin
- **Isar Community**: Use isar_community instead of isar for better Android compatibility

### Architektúra

#### Service Layer
- **Repository Pattern**: Adatok eléréséhez
- **Service Pattern**: Üzleti logikához
- **Provider Pattern**: State management-hez (Riverpod)

#### Widget Structure
- **StatelessWidget**: Egyszerű UI komponensek, de preferált **ConsumerWidget**-et használni helyette.
- **ConsumerWidget**: Riverpod state-et használó komponensek
- **StatefulWidget**: Csak akkor, ha szükséges a belső state, de preferált **ConsumerStatefulWidget**-et használni helyette

#### File Organization
```
lib/
├── core/           # Alapvető funkciók, konstansok
├── data/           # Adatmodell, repository-k
├── domain/         # Üzleti logika, service-k
├── presentation/   # UI komponensek, oldalak
├── shared/         # Megosztott widget-ek, utility-k
└── main.dart
```

### Design Pattern-ek

#### Factory Pattern
- Service-ek létrehozásához
- Widget-ek létrehozásához
- API kliens konfigurálásához

#### Strategy Pattern
- Különböző platformok kezeléséhez
- Különböző audio formátumok kezeléséhez
- Különböző letöltési stratégiákhoz

#### Observer Pattern
- State változások kezeléséhez
- Download progress követéséhez
- Audio player event-ek kezeléséhez

### Error Handling
- **Try-catch**: Minden async műveletnél
- **User-friendly hibaüzenetek**: Ne mutass technikai hibákat a felhasználónak
- **Logging**: Használj `debugPrint` vagy `print` hibák naplózásához
- **Graceful degradation**: Az app működjön részleges hibák esetén is

### Performance
- **Lazy loading**: Csak szükség esetén töltsd be az adatokat
- **Caching**: Cache-elj gyakran használt adatokat
- **Memory management**: Figyelj a memory leak-ekre
- **Async operations**: Használj async/await a hosszú műveletekhez

### Testing
- **Unit tests**: Service-ek és utility függvények tesztelése
- **Widget tests**: UI komponensek tesztelése
- **Integration tests**: Teljes funkciók tesztelése

### Code Style
- **Dart conventions**: Kövesd a Dart style guide-t
- **Flutter conventions**: Kövesd a Flutter best practice-eket
- **Consistent naming**: Konzisztens névadási konvenciók
- **Proper imports**: Rendezett import-ok

### Security
- **Token kezelés**: Biztonságos token tárolás
- **API kommunikáció**: HTTPS használata
- **User data**: Felhasználói adatok védelme
- **File permissions**: Megfelelő fájl engedélyek

### Accessibility
- **Semantic labels**: Használj semantic label-eket
- **Screen reader support**: Támogasd a screen reader-eket
- **High contrast**: Támogasd a magas kontrasztú témákat
- **Font scaling**: Támogasd a betűméret skálázást

## Implementációs Szabályok

### Új Feature Fejlesztés
1. **Tervezés**: Először tervezd meg az architektúrát
2. **Interface definiálás**: Definiáld az interface-eket
3. **Implementáció**: Implementáld a funkciót
4. **Tesztelés**: Teszteld a funkciót
5. **Dokumentáció**: Dokumentáld a változásokat

### Code Review Checklist
- [ ] Osztály méret < 300 sor
- [ ] Egyetlen felelősségi kör
- [ ] Proper error handling
- [ ] Platform kompatibilitás
- [ ] Performance optimalizálás
- [ ] Clean code elvek
- [ ] Tesztek írása

### Git Workflow
- **Feature branch**: Minden új funkció külön branch-en
- **Meaningful commits**: Értelmes commit üzenetek
- **Small commits**: Kis, logikus commit-ok
- **Pull request**: Minden változás PR-en keresztül

## Platform Specifikus Megjegyzések

### Android
- **Permissions**: Storage, network permissions
- **Background tasks**: WorkManager használata
- **File system**: External storage kezelés

### iOS
- **Permissions**: Storage, network permissions
- **Background tasks**: Background App Refresh
- **File system**: Documents directory használata

### macOS
- **Permissions**: File system permissions
- **Background tasks**: NSBackgroundActivityScheduler
- **File system**: Application Support directory

## Hibaelhárítás

### Gyakori Problémák
1. **Memory leaks**: Stream subscription-ok lezárása
2. **Platform differences**: Platform specifikus kód kezelése
3. **Async operations**: Proper async/await használat
4. **State management**: Riverpod provider-ek helyes használata

### Debugging
- **Flutter Inspector**: Widget tree vizualizálás
- **Dart DevTools**: Performance profiling
- **Logging**: Részletes logging a hibakereséshez
- **Breakpoints**: Strategic breakpoint elhelyezés
