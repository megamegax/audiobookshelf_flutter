// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'credential_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(UsernameNotifier)
const usernameProvider = UsernameNotifierProvider._();

final class UsernameNotifierProvider
    extends $NotifierProvider<UsernameNotifier, String> {
  const UsernameNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'usernameProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$usernameNotifierHash();

  @$internal
  @override
  UsernameNotifier create() => UsernameNotifier();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(String value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<String>(value),
    );
  }
}

String _$usernameNotifierHash() => r'4f9469e9f1ba65c0f2765645e827176ea0b4cff3';

abstract class _$UsernameNotifier extends $Notifier<String> {
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

@ProviderFor(PasswordNotifier)
const passwordProvider = PasswordNotifierProvider._();

final class PasswordNotifierProvider
    extends $NotifierProvider<PasswordNotifier, String> {
  const PasswordNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'passwordProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$passwordNotifierHash();

  @$internal
  @override
  PasswordNotifier create() => PasswordNotifier();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(String value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<String>(value),
    );
  }
}

String _$passwordNotifierHash() => r'a29260017705fda67848873a693899be035d6569';

abstract class _$PasswordNotifier extends $Notifier<String> {
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

@ProviderFor(usernameLoader)
const usernameLoaderProvider = UsernameLoaderProvider._();

final class UsernameLoaderProvider
    extends $FunctionalProvider<AsyncValue<String>, String, FutureOr<String>>
    with $FutureModifier<String>, $FutureProvider<String> {
  const UsernameLoaderProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'usernameLoaderProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$usernameLoaderHash();

  @$internal
  @override
  $FutureProviderElement<String> $createElement($ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<String> create(Ref ref) {
    return usernameLoader(ref);
  }
}

String _$usernameLoaderHash() => r'8e7b1f3b63cf7ed4816e09fbbf3f979080de1287';

@ProviderFor(passwordLoader)
const passwordLoaderProvider = PasswordLoaderProvider._();

final class PasswordLoaderProvider
    extends $FunctionalProvider<AsyncValue<String>, String, FutureOr<String>>
    with $FutureModifier<String>, $FutureProvider<String> {
  const PasswordLoaderProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'passwordLoaderProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$passwordLoaderHash();

  @$internal
  @override
  $FutureProviderElement<String> $createElement($ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<String> create(Ref ref) {
    return passwordLoader(ref);
  }
}

String _$passwordLoaderHash() => r'2ad53cc58f298ce0535d14a185858fb83f60122f';
