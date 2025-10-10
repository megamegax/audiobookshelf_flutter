// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mini_player_state.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

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
    r'3eb6e4a43198743a5697d78db5e1a09b510657cb';
