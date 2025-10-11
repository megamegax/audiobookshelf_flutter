// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mini_player_state.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(audioSourceExists)
const audioSourceExistsProvider = AudioSourceExistsProvider._();

final class AudioSourceExistsProvider
    extends $FunctionalProvider<bool, bool, bool>
    with $Provider<bool> {
  const AudioSourceExistsProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'audioSourceExistsProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$audioSourceExistsHash();

  @$internal
  @override
  $ProviderElement<bool> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  bool create(Ref ref) {
    return audioSourceExists(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(bool value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<bool>(value),
    );
  }
}

String _$audioSourceExistsHash() => r'02d0fb9136b9177647086aa4d65b8d520fe2ac02';

@ProviderFor(miniPlayerVisibility)
const miniPlayerVisibilityProvider = MiniPlayerVisibilityProvider._();

final class MiniPlayerVisibilityProvider
    extends $FunctionalProvider<bool, bool, bool>
    with $Provider<bool> {
  const MiniPlayerVisibilityProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'miniPlayerVisibilityProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$miniPlayerVisibilityHash();

  @$internal
  @override
  $ProviderElement<bool> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  bool create(Ref ref) {
    return miniPlayerVisibility(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(bool value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<bool>(value),
    );
  }
}

String _$miniPlayerVisibilityHash() =>
    r'f90433ad121c28b6255d88b31ff64dda7b0443c7';
