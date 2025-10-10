// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'loading_progress_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// State notifier for managing loading progress

@ProviderFor(LoadingProgressNotifier)
const loadingProgressProvider = LoadingProgressNotifierProvider._();

/// State notifier for managing loading progress
final class LoadingProgressNotifierProvider
    extends $NotifierProvider<LoadingProgressNotifier, LoadingProgressState> {
  /// State notifier for managing loading progress
  const LoadingProgressNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'loadingProgressProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$loadingProgressNotifierHash();

  @$internal
  @override
  LoadingProgressNotifier create() => LoadingProgressNotifier();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(LoadingProgressState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<LoadingProgressState>(value),
    );
  }
}

String _$loadingProgressNotifierHash() =>
    r'334dbeef07ce8159e88d5ab601ec4d16a97ff82b';

/// State notifier for managing loading progress

abstract class _$LoadingProgressNotifier
    extends $Notifier<LoadingProgressState> {
  LoadingProgressState build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<LoadingProgressState, LoadingProgressState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<LoadingProgressState, LoadingProgressState>,
              LoadingProgressState,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
