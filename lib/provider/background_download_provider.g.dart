// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'background_download_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Provider for background download state

@ProviderFor(BackgroundDownloadStateNotifier)
const backgroundDownloadStateProvider =
    BackgroundDownloadStateNotifierProvider._();

/// Provider for background download state
final class BackgroundDownloadStateNotifierProvider
    extends
        $NotifierProvider<
          BackgroundDownloadStateNotifier,
          BackgroundDownloadState
        > {
  /// Provider for background download state
  const BackgroundDownloadStateNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'backgroundDownloadStateProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$backgroundDownloadStateNotifierHash();

  @$internal
  @override
  BackgroundDownloadStateNotifier create() => BackgroundDownloadStateNotifier();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(BackgroundDownloadState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<BackgroundDownloadState>(value),
    );
  }
}

String _$backgroundDownloadStateNotifierHash() =>
    r'894b5337d70de8c2662a12660bb91109de627158';

/// Provider for background download state

abstract class _$BackgroundDownloadStateNotifier
    extends $Notifier<BackgroundDownloadState> {
  BackgroundDownloadState build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref =
        this.ref as $Ref<BackgroundDownloadState, BackgroundDownloadState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<BackgroundDownloadState, BackgroundDownloadState>,
              BackgroundDownloadState,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
