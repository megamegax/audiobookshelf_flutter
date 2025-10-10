// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cover_image_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Provider for cover image state management

@ProviderFor(CoverImageNotifier)
const coverImageProvider = CoverImageNotifierProvider._();

/// Provider for cover image state management
final class CoverImageNotifierProvider
    extends $NotifierProvider<CoverImageNotifier, CoverImageState> {
  /// Provider for cover image state management
  const CoverImageNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'coverImageProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$coverImageNotifierHash();

  @$internal
  @override
  CoverImageNotifier create() => CoverImageNotifier();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(CoverImageState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<CoverImageState>(value),
    );
  }
}

String _$coverImageNotifierHash() =>
    r'067c43bd77231a489142e346297a3fe75d469b20';

/// Provider for cover image state management

abstract class _$CoverImageNotifier extends $Notifier<CoverImageState> {
  CoverImageState build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<CoverImageState, CoverImageState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<CoverImageState, CoverImageState>,
              CoverImageState,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
