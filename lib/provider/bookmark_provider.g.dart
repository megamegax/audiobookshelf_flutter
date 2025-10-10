// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bookmark_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(bookmarkService)
const bookmarkServiceProvider = BookmarkServiceProvider._();

final class BookmarkServiceProvider
    extends
        $FunctionalProvider<BookmarkService, BookmarkService, BookmarkService>
    with $Provider<BookmarkService> {
  const BookmarkServiceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'bookmarkServiceProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$bookmarkServiceHash();

  @$internal
  @override
  $ProviderElement<BookmarkService> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  BookmarkService create(Ref ref) {
    return bookmarkService(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(BookmarkService value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<BookmarkService>(value),
    );
  }
}

String _$bookmarkServiceHash() => r'527eb62d45cd25edcd19a1614b0b70355e3f9523';

@ProviderFor(bookmarks)
const bookmarksProvider = BookmarksFamily._();

final class BookmarksProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<Bookmark>>,
          List<Bookmark>,
          FutureOr<List<Bookmark>>
        >
    with $FutureModifier<List<Bookmark>>, $FutureProvider<List<Bookmark>> {
  const BookmarksProvider._({
    required BookmarksFamily super.from,
    required String super.argument,
  }) : super(
         retry: null,
         name: r'bookmarksProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$bookmarksHash();

  @override
  String toString() {
    return r'bookmarksProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $FutureProviderElement<List<Bookmark>> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<List<Bookmark>> create(Ref ref) {
    final argument = this.argument as String;
    return bookmarks(ref, argument);
  }

  @override
  bool operator ==(Object other) {
    return other is BookmarksProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$bookmarksHash() => r'dbca4d123219430e1203a72c4af5e6e795970402';

final class BookmarksFamily extends $Family
    with $FunctionalFamilyOverride<FutureOr<List<Bookmark>>, String> {
  const BookmarksFamily._()
    : super(
        retry: null,
        name: r'bookmarksProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  BookmarksProvider call(String libraryItemId) =>
      BookmarksProvider._(argument: libraryItemId, from: this);

  @override
  String toString() => r'bookmarksProvider';
}

@ProviderFor(BookmarkNotifier)
const bookmarkProvider = BookmarkNotifierFamily._();

final class BookmarkNotifierProvider
    extends $AsyncNotifierProvider<BookmarkNotifier, List<Bookmark>> {
  const BookmarkNotifierProvider._({
    required BookmarkNotifierFamily super.from,
    required String super.argument,
  }) : super(
         retry: null,
         name: r'bookmarkProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$bookmarkNotifierHash();

  @override
  String toString() {
    return r'bookmarkProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  BookmarkNotifier create() => BookmarkNotifier();

  @override
  bool operator ==(Object other) {
    return other is BookmarkNotifierProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$bookmarkNotifierHash() => r'7e7f4353ea785e5161e94ebe054825ada0aa8fbb';

final class BookmarkNotifierFamily extends $Family
    with
        $ClassFamilyOverride<
          BookmarkNotifier,
          AsyncValue<List<Bookmark>>,
          List<Bookmark>,
          FutureOr<List<Bookmark>>,
          String
        > {
  const BookmarkNotifierFamily._()
    : super(
        retry: null,
        name: r'bookmarkProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  BookmarkNotifierProvider call(String libraryItemId) =>
      BookmarkNotifierProvider._(argument: libraryItemId, from: this);

  @override
  String toString() => r'bookmarkProvider';
}

abstract class _$BookmarkNotifier extends $AsyncNotifier<List<Bookmark>> {
  late final _$args = ref.$arg as String;
  String get libraryItemId => _$args;

  FutureOr<List<Bookmark>> build(String libraryItemId);
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build(_$args);
    final ref = this.ref as $Ref<AsyncValue<List<Bookmark>>, List<Bookmark>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<List<Bookmark>>, List<Bookmark>>,
              AsyncValue<List<Bookmark>>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
