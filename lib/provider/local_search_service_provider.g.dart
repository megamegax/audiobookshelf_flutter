// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'local_search_service_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(localSearchService)
const localSearchServiceProvider = LocalSearchServiceProvider._();

final class LocalSearchServiceProvider
    extends
        $FunctionalProvider<
          LocalSearchService,
          LocalSearchService,
          LocalSearchService
        >
    with $Provider<LocalSearchService> {
  const LocalSearchServiceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'localSearchServiceProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$localSearchServiceHash();

  @$internal
  @override
  $ProviderElement<LocalSearchService> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  LocalSearchService create(Ref ref) {
    return localSearchService(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(LocalSearchService value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<LocalSearchService>(value),
    );
  }
}

String _$localSearchServiceHash() =>
    r'f4020d288f68e8a8a5757da2a32e14cd93bb60d0';
