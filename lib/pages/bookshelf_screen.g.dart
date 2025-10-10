// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bookshelf_screen.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(BookshelfSearch)
const bookshelfSearchProvider = BookshelfSearchProvider._();

final class BookshelfSearchProvider
    extends $NotifierProvider<BookshelfSearch, String> {
  const BookshelfSearchProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'bookshelfSearchProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$bookshelfSearchHash();

  @$internal
  @override
  BookshelfSearch create() => BookshelfSearch();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(String value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<String>(value),
    );
  }
}

String _$bookshelfSearchHash() => r'd8ecc94d2346d019536c922bde97cd5fc38c1378';

abstract class _$BookshelfSearch extends $Notifier<String> {
  String build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<String, String>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<String, String>,
              String,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
