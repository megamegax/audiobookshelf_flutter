// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'optimized_background_loading_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// State notifier for managing optimized background loading

@ProviderFor(OptimizedBackgroundLoadingNotifier)
const optimizedBackgroundLoadingProvider =
    OptimizedBackgroundLoadingNotifierProvider._();

/// State notifier for managing optimized background loading
final class OptimizedBackgroundLoadingNotifierProvider
    extends
        $NotifierProvider<
          OptimizedBackgroundLoadingNotifier,
          OptimizedBackgroundLoadingState
        > {
  /// State notifier for managing optimized background loading
  const OptimizedBackgroundLoadingNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'optimizedBackgroundLoadingProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() =>
      _$optimizedBackgroundLoadingNotifierHash();

  @$internal
  @override
  OptimizedBackgroundLoadingNotifier create() =>
      OptimizedBackgroundLoadingNotifier();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(OptimizedBackgroundLoadingState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<OptimizedBackgroundLoadingState>(
        value,
      ),
    );
  }
}

String _$optimizedBackgroundLoadingNotifierHash() =>
    r'69d4e65675b561ca1879f6eeb4bd158cc16ee482';

/// State notifier for managing optimized background loading

abstract class _$OptimizedBackgroundLoadingNotifier
    extends $Notifier<OptimizedBackgroundLoadingState> {
  OptimizedBackgroundLoadingState build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref =
        this.ref
            as $Ref<
              OptimizedBackgroundLoadingState,
              OptimizedBackgroundLoadingState
            >;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<
                OptimizedBackgroundLoadingState,
                OptimizedBackgroundLoadingState
              >,
              OptimizedBackgroundLoadingState,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
