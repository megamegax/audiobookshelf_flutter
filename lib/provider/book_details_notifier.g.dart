// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'book_details_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(bookDetailsData)
const bookDetailsDataProvider = BookDetailsDataFamily._();

final class BookDetailsDataProvider
    extends
        $FunctionalProvider<
          AsyncValue<DetailedLibraryItem>,
          DetailedLibraryItem,
          FutureOr<DetailedLibraryItem>
        >
    with
        $FutureModifier<DetailedLibraryItem>,
        $FutureProvider<DetailedLibraryItem> {
  const BookDetailsDataProvider._({
    required BookDetailsDataFamily super.from,
    required String super.argument,
  }) : super(
         retry: null,
         name: r'bookDetailsDataProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$bookDetailsDataHash();

  @override
  String toString() {
    return r'bookDetailsDataProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $FutureProviderElement<DetailedLibraryItem> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<DetailedLibraryItem> create(Ref ref) {
    final argument = this.argument as String;
    return bookDetailsData(ref, argument);
  }

  @override
  bool operator ==(Object other) {
    return other is BookDetailsDataProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$bookDetailsDataHash() => r'84743939629ba6a32e89ef5b4ddb5f2e2ca2e327';

final class BookDetailsDataFamily extends $Family
    with $FunctionalFamilyOverride<FutureOr<DetailedLibraryItem>, String> {
  const BookDetailsDataFamily._()
    : super(
        retry: null,
        name: r'bookDetailsDataProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  BookDetailsDataProvider call(String itemId) =>
      BookDetailsDataProvider._(argument: itemId, from: this);

  @override
  String toString() => r'bookDetailsDataProvider';
}

@ProviderFor(bookDetailsBasic)
const bookDetailsBasicProvider = BookDetailsBasicFamily._();

final class BookDetailsBasicProvider
    extends
        $FunctionalProvider<
          AsyncValue<LibraryItemEntity?>,
          LibraryItemEntity?,
          FutureOr<LibraryItemEntity?>
        >
    with
        $FutureModifier<LibraryItemEntity?>,
        $FutureProvider<LibraryItemEntity?> {
  const BookDetailsBasicProvider._({
    required BookDetailsBasicFamily super.from,
    required String super.argument,
  }) : super(
         retry: null,
         name: r'bookDetailsBasicProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$bookDetailsBasicHash();

  @override
  String toString() {
    return r'bookDetailsBasicProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $FutureProviderElement<LibraryItemEntity?> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<LibraryItemEntity?> create(Ref ref) {
    final argument = this.argument as String;
    return bookDetailsBasic(ref, argument);
  }

  @override
  bool operator ==(Object other) {
    return other is BookDetailsBasicProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$bookDetailsBasicHash() => r'a11ee9e0a1d81f75d885b276c72e5f016ba4569c';

final class BookDetailsBasicFamily extends $Family
    with $FunctionalFamilyOverride<FutureOr<LibraryItemEntity?>, String> {
  const BookDetailsBasicFamily._()
    : super(
        retry: null,
        name: r'bookDetailsBasicProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  BookDetailsBasicProvider call(String itemId) =>
      BookDetailsBasicProvider._(argument: itemId, from: this);

  @override
  String toString() => r'bookDetailsBasicProvider';
}

@ProviderFor(bookDetailsCover)
const bookDetailsCoverProvider = BookDetailsCoverFamily._();

final class BookDetailsCoverProvider
    extends
        $FunctionalProvider<
          AsyncValue<Uint8List?>,
          Uint8List?,
          FutureOr<Uint8List?>
        >
    with $FutureModifier<Uint8List?>, $FutureProvider<Uint8List?> {
  const BookDetailsCoverProvider._({
    required BookDetailsCoverFamily super.from,
    required String super.argument,
  }) : super(
         retry: null,
         name: r'bookDetailsCoverProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$bookDetailsCoverHash();

  @override
  String toString() {
    return r'bookDetailsCoverProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $FutureProviderElement<Uint8List?> $createElement($ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<Uint8List?> create(Ref ref) {
    final argument = this.argument as String;
    return bookDetailsCover(ref, argument);
  }

  @override
  bool operator ==(Object other) {
    return other is BookDetailsCoverProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$bookDetailsCoverHash() => r'fbe304e67884e4528300d1020ed6b4a8b9071ea3';

final class BookDetailsCoverFamily extends $Family
    with $FunctionalFamilyOverride<FutureOr<Uint8List?>, String> {
  const BookDetailsCoverFamily._()
    : super(
        retry: null,
        name: r'bookDetailsCoverProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  BookDetailsCoverProvider call(String itemId) =>
      BookDetailsCoverProvider._(argument: itemId, from: this);

  @override
  String toString() => r'bookDetailsCoverProvider';
}

@ProviderFor(BookDetailsUINotifier)
const bookDetailsUIProvider = BookDetailsUINotifierFamily._();

final class BookDetailsUINotifierProvider
    extends $NotifierProvider<BookDetailsUINotifier, BookDetailsUI> {
  const BookDetailsUINotifierProvider._({
    required BookDetailsUINotifierFamily super.from,
    required String super.argument,
  }) : super(
         retry: null,
         name: r'bookDetailsUIProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$bookDetailsUINotifierHash();

  @override
  String toString() {
    return r'bookDetailsUIProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  BookDetailsUINotifier create() => BookDetailsUINotifier();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(BookDetailsUI value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<BookDetailsUI>(value),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is BookDetailsUINotifierProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$bookDetailsUINotifierHash() =>
    r'14310ddfc5c73a2def8d21bcf9ac4958dddc1ae9';

final class BookDetailsUINotifierFamily extends $Family
    with
        $ClassFamilyOverride<
          BookDetailsUINotifier,
          BookDetailsUI,
          BookDetailsUI,
          BookDetailsUI,
          String
        > {
  const BookDetailsUINotifierFamily._()
    : super(
        retry: null,
        name: r'bookDetailsUIProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  BookDetailsUINotifierProvider call(String itemId) =>
      BookDetailsUINotifierProvider._(argument: itemId, from: this);

  @override
  String toString() => r'bookDetailsUIProvider';
}

abstract class _$BookDetailsUINotifier extends $Notifier<BookDetailsUI> {
  late final _$args = ref.$arg as String;
  String get itemId => _$args;

  BookDetailsUI build(String itemId);
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build(_$args);
    final ref = this.ref as $Ref<BookDetailsUI, BookDetailsUI>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<BookDetailsUI, BookDetailsUI>,
              BookDetailsUI,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
