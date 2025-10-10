// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'advanced_search_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Advanced search state notifier

@ProviderFor(AdvancedSearchNotifier)
const advancedSearchProvider = AdvancedSearchNotifierProvider._();

/// Advanced search state notifier
final class AdvancedSearchNotifierProvider
    extends $NotifierProvider<AdvancedSearchNotifier, AdvancedSearchState> {
  /// Advanced search state notifier
  const AdvancedSearchNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'advancedSearchProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$advancedSearchNotifierHash();

  @$internal
  @override
  AdvancedSearchNotifier create() => AdvancedSearchNotifier();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(AdvancedSearchState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<AdvancedSearchState>(value),
    );
  }
}

String _$advancedSearchNotifierHash() =>
    r'5dd0243dfe6af0d2d3b389928a80b7d59e5a4d69';

/// Advanced search state notifier

abstract class _$AdvancedSearchNotifier extends $Notifier<AdvancedSearchState> {
  AdvancedSearchState build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<AdvancedSearchState, AdvancedSearchState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AdvancedSearchState, AdvancedSearchState>,
              AdvancedSearchState,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
