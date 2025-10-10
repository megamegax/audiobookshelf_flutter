// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'download_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(DownloadStateNotifier)
const downloadStateProvider = DownloadStateNotifierProvider._();

final class DownloadStateNotifierProvider
    extends
        $NotifierProvider<
          DownloadStateNotifier,
          Map<String, DownloadProgress>
        > {
  const DownloadStateNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'downloadStateProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$downloadStateNotifierHash();

  @$internal
  @override
  DownloadStateNotifier create() => DownloadStateNotifier();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(Map<String, DownloadProgress> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<Map<String, DownloadProgress>>(
        value,
      ),
    );
  }
}

String _$downloadStateNotifierHash() =>
    r'b5811eb7adfdcd7962c4fb659e9f3b7a0814ea05';

abstract class _$DownloadStateNotifier
    extends $Notifier<Map<String, DownloadProgress>> {
  Map<String, DownloadProgress> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref =
        this.ref
            as $Ref<
              Map<String, DownloadProgress>,
              Map<String, DownloadProgress>
            >;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<
                Map<String, DownloadProgress>,
                Map<String, DownloadProgress>
              >,
              Map<String, DownloadProgress>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}

@ProviderFor(downloadedItems)
const downloadedItemsProvider = DownloadedItemsProvider._();

final class DownloadedItemsProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<DownloadedItem>>,
          List<DownloadedItem>,
          FutureOr<List<DownloadedItem>>
        >
    with
        $FutureModifier<List<DownloadedItem>>,
        $FutureProvider<List<DownloadedItem>> {
  const DownloadedItemsProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'downloadedItemsProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$downloadedItemsHash();

  @$internal
  @override
  $FutureProviderElement<List<DownloadedItem>> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<List<DownloadedItem>> create(Ref ref) {
    return downloadedItems(ref);
  }
}

String _$downloadedItemsHash() => r'1e08fd2362698b64e6c3b4b41a540fe299416e61';
