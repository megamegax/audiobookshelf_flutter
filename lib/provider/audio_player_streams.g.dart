// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'audio_player_streams.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(audioPlayingStream)
const audioPlayingStreamProvider = AudioPlayingStreamProvider._();

final class AudioPlayingStreamProvider
    extends $FunctionalProvider<AsyncValue<bool>, bool, Stream<bool>>
    with $FutureModifier<bool>, $StreamProvider<bool> {
  const AudioPlayingStreamProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'audioPlayingStreamProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$audioPlayingStreamHash();

  @$internal
  @override
  $StreamProviderElement<bool> $createElement($ProviderPointer pointer) =>
      $StreamProviderElement(pointer);

  @override
  Stream<bool> create(Ref ref) {
    return audioPlayingStream(ref);
  }
}

String _$audioPlayingStreamHash() =>
    r'd7eafd08cc87a585294a8c513a08f6f7ebdf1f82';

@ProviderFor(audioPositionStream)
const audioPositionStreamProvider = AudioPositionStreamProvider._();

final class AudioPositionStreamProvider
    extends
        $FunctionalProvider<AsyncValue<Duration>, Duration, Stream<Duration>>
    with $FutureModifier<Duration>, $StreamProvider<Duration> {
  const AudioPositionStreamProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'audioPositionStreamProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$audioPositionStreamHash();

  @$internal
  @override
  $StreamProviderElement<Duration> $createElement($ProviderPointer pointer) =>
      $StreamProviderElement(pointer);

  @override
  Stream<Duration> create(Ref ref) {
    return audioPositionStream(ref);
  }
}

String _$audioPositionStreamHash() =>
    r'd7bb5afe7e54b5fc06a1aefb8fa0584622d76423';

@ProviderFor(audioDurationStream)
const audioDurationStreamProvider = AudioDurationStreamProvider._();

final class AudioDurationStreamProvider
    extends
        $FunctionalProvider<AsyncValue<Duration?>, Duration?, Stream<Duration?>>
    with $FutureModifier<Duration?>, $StreamProvider<Duration?> {
  const AudioDurationStreamProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'audioDurationStreamProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$audioDurationStreamHash();

  @$internal
  @override
  $StreamProviderElement<Duration?> $createElement($ProviderPointer pointer) =>
      $StreamProviderElement(pointer);

  @override
  Stream<Duration?> create(Ref ref) {
    return audioDurationStream(ref);
  }
}

String _$audioDurationStreamHash() =>
    r'a213375d836986ea1e4c6870a7505a9d25537637';

@ProviderFor(audioPlayerStateStream)
const audioPlayerStateStreamProvider = AudioPlayerStateStreamProvider._();

final class AudioPlayerStateStreamProvider
    extends
        $FunctionalProvider<
          AsyncValue<PlayerState>,
          PlayerState,
          Stream<PlayerState>
        >
    with $FutureModifier<PlayerState>, $StreamProvider<PlayerState> {
  const AudioPlayerStateStreamProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'audioPlayerStateStreamProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$audioPlayerStateStreamHash();

  @$internal
  @override
  $StreamProviderElement<PlayerState> $createElement(
    $ProviderPointer pointer,
  ) => $StreamProviderElement(pointer);

  @override
  Stream<PlayerState> create(Ref ref) {
    return audioPlayerStateStream(ref);
  }
}

String _$audioPlayerStateStreamHash() =>
    r'7fde27b1c0ffcf25031b4e68c6dae8bb97951e89';
