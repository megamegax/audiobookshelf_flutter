// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'player_overlay_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(PlayerOverlayNotifier)
const playerOverlayProvider = PlayerOverlayNotifierFamily._();

final class PlayerOverlayNotifierProvider
    extends $NotifierProvider<PlayerOverlayNotifier, PlayerOverlayState> {
  const PlayerOverlayNotifierProvider._({
    required PlayerOverlayNotifierFamily super.from,
    required ({
      AudioPlayer audioPlayer,
      PlayerService playerService,
      MediaItem mediaItem,
    })
    super.argument,
  }) : super(
         retry: null,
         name: r'playerOverlayProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$playerOverlayNotifierHash();

  @override
  String toString() {
    return r'playerOverlayProvider'
        ''
        '$argument';
  }

  @$internal
  @override
  PlayerOverlayNotifier create() => PlayerOverlayNotifier();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(PlayerOverlayState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<PlayerOverlayState>(value),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is PlayerOverlayNotifierProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$playerOverlayNotifierHash() =>
    r'27971161701786f25d545a29df999d33f679ce53';

final class PlayerOverlayNotifierFamily extends $Family
    with
        $ClassFamilyOverride<
          PlayerOverlayNotifier,
          PlayerOverlayState,
          PlayerOverlayState,
          PlayerOverlayState,
          ({
            AudioPlayer audioPlayer,
            PlayerService playerService,
            MediaItem mediaItem,
          })
        > {
  const PlayerOverlayNotifierFamily._()
    : super(
        retry: null,
        name: r'playerOverlayProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  PlayerOverlayNotifierProvider call({
    required AudioPlayer audioPlayer,
    required PlayerService playerService,
    required MediaItem mediaItem,
  }) => PlayerOverlayNotifierProvider._(
    argument: (
      audioPlayer: audioPlayer,
      playerService: playerService,
      mediaItem: mediaItem,
    ),
    from: this,
  );

  @override
  String toString() => r'playerOverlayProvider';
}

abstract class _$PlayerOverlayNotifier extends $Notifier<PlayerOverlayState> {
  late final _$args =
      ref.$arg
          as ({
            AudioPlayer audioPlayer,
            PlayerService playerService,
            MediaItem mediaItem,
          });
  AudioPlayer get audioPlayer => _$args.audioPlayer;
  PlayerService get playerService => _$args.playerService;
  MediaItem get mediaItem => _$args.mediaItem;

  PlayerOverlayState build({
    required AudioPlayer audioPlayer,
    required PlayerService playerService,
    required MediaItem mediaItem,
  });
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build(
      audioPlayer: _$args.audioPlayer,
      playerService: _$args.playerService,
      mediaItem: _$args.mediaItem,
    );
    final ref = this.ref as $Ref<PlayerOverlayState, PlayerOverlayState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<PlayerOverlayState, PlayerOverlayState>,
              PlayerOverlayState,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
