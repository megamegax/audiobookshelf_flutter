// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(loginService)
const loginServiceProvider = LoginServiceProvider._();

final class LoginServiceProvider
    extends
        $FunctionalProvider<
          AsyncValue<LoginService>,
          LoginService,
          FutureOr<LoginService>
        >
    with $FutureModifier<LoginService>, $FutureProvider<LoginService> {
  const LoginServiceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'loginServiceProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$loginServiceHash();

  @$internal
  @override
  $FutureProviderElement<LoginService> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<LoginService> create(Ref ref) {
    return loginService(ref);
  }
}

String _$loginServiceHash() => r'8fc228a80b6a05df2d34b7dfe2f7a553532bcedc';

@ProviderFor(LoginStateNotifier)
const loginStateProvider = LoginStateNotifierProvider._();

final class LoginStateNotifierProvider
    extends $NotifierProvider<LoginStateNotifier, LoginState> {
  const LoginStateNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'loginStateProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$loginStateNotifierHash();

  @$internal
  @override
  LoginStateNotifier create() => LoginStateNotifier();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(LoginState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<LoginState>(value),
    );
  }
}

String _$loginStateNotifierHash() =>
    r'489758144373eb88d5b32bb1fe9b0b67c364f358';

abstract class _$LoginStateNotifier extends $Notifier<LoginState> {
  LoginState build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<LoginState, LoginState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<LoginState, LoginState>,
              LoginState,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}

@ProviderFor(ServerSettingsNotifier)
const serverSettingsProvider = ServerSettingsNotifierProvider._();

final class ServerSettingsNotifierProvider
    extends $NotifierProvider<ServerSettingsNotifier, ServerSettings?> {
  const ServerSettingsNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'serverSettingsProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$serverSettingsNotifierHash();

  @$internal
  @override
  ServerSettingsNotifier create() => ServerSettingsNotifier();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ServerSettings? value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ServerSettings?>(value),
    );
  }
}

String _$serverSettingsNotifierHash() =>
    r'5f17160e020e95bc3e562adc478b917bc5cd9511';

abstract class _$ServerSettingsNotifier extends $Notifier<ServerSettings?> {
  ServerSettings? build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<ServerSettings?, ServerSettings?>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<ServerSettings?, ServerSettings?>,
              ServerSettings?,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}

@ProviderFor(UserModelNotifier)
const userModelProvider = UserModelNotifierProvider._();

final class UserModelNotifierProvider
    extends $NotifierProvider<UserModelNotifier, UserModel?> {
  const UserModelNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'userModelProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$userModelNotifierHash();

  @$internal
  @override
  UserModelNotifier create() => UserModelNotifier();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(UserModel? value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<UserModel?>(value),
    );
  }
}

String _$userModelNotifierHash() => r'd5a4adf92ba2ba053acc515d8ef46e76c6f2c5bb';

abstract class _$UserModelNotifier extends $Notifier<UserModel?> {
  UserModel? build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<UserModel?, UserModel?>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<UserModel?, UserModel?>,
              UserModel?,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
