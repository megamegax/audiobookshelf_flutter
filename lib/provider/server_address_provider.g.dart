// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'server_address_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(ServerAddressNotifier)
const serverAddressProvider = ServerAddressNotifierProvider._();

final class ServerAddressNotifierProvider
    extends $NotifierProvider<ServerAddressNotifier, String> {
  const ServerAddressNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'serverAddressProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$serverAddressNotifierHash();

  @$internal
  @override
  ServerAddressNotifier create() => ServerAddressNotifier();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(String value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<String>(value),
    );
  }
}

String _$serverAddressNotifierHash() =>
    r'4060756a0d9ff454e9e4a8d1c5fe33af6d41b6b9';

abstract class _$ServerAddressNotifier extends $Notifier<String> {
  String build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<String, String>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<String, String>,
              String,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
