// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'library_selector_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Provider for the currently selected library

@ProviderFor(SelectedLibraryNotifier)
const selectedLibraryProvider = SelectedLibraryNotifierProvider._();

/// Provider for the currently selected library
final class SelectedLibraryNotifierProvider
    extends $NotifierProvider<SelectedLibraryNotifier, Library?> {
  /// Provider for the currently selected library
  const SelectedLibraryNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'selectedLibraryProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$selectedLibraryNotifierHash();

  @$internal
  @override
  SelectedLibraryNotifier create() => SelectedLibraryNotifier();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(Library? value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<Library?>(value),
    );
  }
}

String _$selectedLibraryNotifierHash() =>
    r'24caca7afe479b734264119df541ef87c3e3b7ce';

/// Provider for the currently selected library

abstract class _$SelectedLibraryNotifier extends $Notifier<Library?> {
  Library? build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<Library?, Library?>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<Library?, Library?>,
              Library?,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}

/// Provider for all available libraries

@ProviderFor(availableLibraries)
const availableLibrariesProvider = AvailableLibrariesProvider._();

/// Provider for all available libraries

final class AvailableLibrariesProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<Library>>,
          List<Library>,
          FutureOr<List<Library>>
        >
    with $FutureModifier<List<Library>>, $FutureProvider<List<Library>> {
  /// Provider for all available libraries
  const AvailableLibrariesProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'availableLibrariesProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$availableLibrariesHash();

  @$internal
  @override
  $FutureProviderElement<List<Library>> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<List<Library>> create(Ref ref) {
    return availableLibraries(ref);
  }
}

String _$availableLibrariesHash() =>
    r'802e0822f11e501935a1d2502562aab6601bb416';

/// Provider for library selector notifier

@ProviderFor(librarySelector)
const librarySelectorProvider = LibrarySelectorProvider._();

/// Provider for library selector notifier

final class LibrarySelectorProvider
    extends
        $FunctionalProvider<
          SelectedLibraryNotifier,
          SelectedLibraryNotifier,
          SelectedLibraryNotifier
        >
    with $Provider<SelectedLibraryNotifier> {
  /// Provider for library selector notifier
  const LibrarySelectorProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'librarySelectorProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$librarySelectorHash();

  @$internal
  @override
  $ProviderElement<SelectedLibraryNotifier> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  SelectedLibraryNotifier create(Ref ref) {
    return librarySelector(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(SelectedLibraryNotifier value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<SelectedLibraryNotifier>(value),
    );
  }
}

String _$librarySelectorHash() => r'6822c2ebb75afc6249e228fe8afc177250103181';
