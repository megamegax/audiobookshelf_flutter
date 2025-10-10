// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_services_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Provider for the main app services

@ProviderFor(appServices)
const appServicesProvider = AppServicesProvider._();

/// Provider for the main app services

final class AppServicesProvider
    extends $FunctionalProvider<AppServices, AppServices, AppServices>
    with $Provider<AppServices> {
  /// Provider for the main app services
  const AppServicesProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'appServicesProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$appServicesHash();

  @$internal
  @override
  $ProviderElement<AppServices> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  AppServices create(Ref ref) {
    return appServices(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(AppServices value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<AppServices>(value),
    );
  }
}

String _$appServicesHash() => r'f7e659bb47b5964358d82de20c57939384d0c0ca';

/// Provider for cover image operations

@ProviderFor(coverImageOperations)
const coverImageOperationsProvider = CoverImageOperationsProvider._();

/// Provider for cover image operations

final class CoverImageOperationsProvider
    extends
        $FunctionalProvider<
          CoverImageOperations,
          CoverImageOperations,
          CoverImageOperations
        >
    with $Provider<CoverImageOperations> {
  /// Provider for cover image operations
  const CoverImageOperationsProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'coverImageOperationsProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$coverImageOperationsHash();

  @$internal
  @override
  $ProviderElement<CoverImageOperations> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  CoverImageOperations create(Ref ref) {
    return coverImageOperations(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(CoverImageOperations value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<CoverImageOperations>(value),
    );
  }
}

String _$coverImageOperationsHash() =>
    r'cac0a3b3bf2a2fafa45430898e23f00f32ced9df';

/// Provider for loading operations

@ProviderFor(loadingOperations)
const loadingOperationsProvider = LoadingOperationsProvider._();

/// Provider for loading operations

final class LoadingOperationsProvider
    extends
        $FunctionalProvider<
          LoadingOperations,
          LoadingOperations,
          LoadingOperations
        >
    with $Provider<LoadingOperations> {
  /// Provider for loading operations
  const LoadingOperationsProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'loadingOperationsProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$loadingOperationsHash();

  @$internal
  @override
  $ProviderElement<LoadingOperations> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  LoadingOperations create(Ref ref) {
    return loadingOperations(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(LoadingOperations value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<LoadingOperations>(value),
    );
  }
}

String _$loadingOperationsHash() => r'a7425f8f694bdfc0b5388084c8c56af655737229';

/// Provider for sync operations

@ProviderFor(syncOperations)
const syncOperationsProvider = SyncOperationsProvider._();

/// Provider for sync operations

final class SyncOperationsProvider
    extends $FunctionalProvider<SyncOperations, SyncOperations, SyncOperations>
    with $Provider<SyncOperations> {
  /// Provider for sync operations
  const SyncOperationsProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'syncOperationsProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$syncOperationsHash();

  @$internal
  @override
  $ProviderElement<SyncOperations> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  SyncOperations create(Ref ref) {
    return syncOperations(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(SyncOperations value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<SyncOperations>(value),
    );
  }
}

String _$syncOperationsHash() => r'042b8eef6c7507e696387c0c486d788b215cd58c';
