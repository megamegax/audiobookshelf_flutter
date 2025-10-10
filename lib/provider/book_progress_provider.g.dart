// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'book_progress_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(BookProgressNotifier)
const bookProgressProvider = BookProgressNotifierProvider._();

final class BookProgressNotifierProvider
    extends $NotifierProvider<BookProgressNotifier, BookProgressState?> {
  const BookProgressNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'bookProgressProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$bookProgressNotifierHash();

  @$internal
  @override
  BookProgressNotifier create() => BookProgressNotifier();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(BookProgressState? value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<BookProgressState?>(value),
    );
  }
}

String _$bookProgressNotifierHash() =>
    r'7f25ab36bd20939b5410db71b6017bf90c881fb4';

abstract class _$BookProgressNotifier extends $Notifier<BookProgressState?> {
  BookProgressState? build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<BookProgressState?, BookProgressState?>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<BookProgressState?, BookProgressState?>,
              BookProgressState?,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
