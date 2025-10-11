// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'player_service.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(playerService)
const playerServiceProvider = PlayerServiceProvider._();

final class PlayerServiceProvider
    extends $FunctionalProvider<PlayerService, PlayerService, PlayerService>
    with $Provider<PlayerService> {
  const PlayerServiceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'playerServiceProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$playerServiceHash();

  @$internal
  @override
  $ProviderElement<PlayerService> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  PlayerService create(Ref ref) {
    return playerService(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(PlayerService value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<PlayerService>(value),
    );
  }
}

String _$playerServiceHash() => r'1bbb5ec644b6c69a1c6e5b3bec11146e1563a617';
