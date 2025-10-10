// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'selected_book_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(SelectedBookNotifier)
const selectedBookProvider = SelectedBookNotifierProvider._();

final class SelectedBookNotifierProvider
    extends $NotifierProvider<SelectedBookNotifier, SelectedBookState> {
  const SelectedBookNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'selectedBookProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$selectedBookNotifierHash();

  @$internal
  @override
  SelectedBookNotifier create() => SelectedBookNotifier();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(SelectedBookState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<SelectedBookState>(value),
    );
  }
}

String _$selectedBookNotifierHash() =>
    r'f7ebdf687b96c2cd15bb79f21e1bf13fdd1f308d';

abstract class _$SelectedBookNotifier extends $Notifier<SelectedBookState> {
  SelectedBookState build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<SelectedBookState, SelectedBookState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<SelectedBookState, SelectedBookState>,
              SelectedBookState,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
