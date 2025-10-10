// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sleep_timer_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(sleepTimerService)
const sleepTimerServiceProvider = SleepTimerServiceProvider._();

final class SleepTimerServiceProvider
    extends
        $FunctionalProvider<
          SleepTimerService,
          SleepTimerService,
          SleepTimerService
        >
    with $Provider<SleepTimerService> {
  const SleepTimerServiceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'sleepTimerServiceProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$sleepTimerServiceHash();

  @$internal
  @override
  $ProviderElement<SleepTimerService> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  SleepTimerService create(Ref ref) {
    return sleepTimerService(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(SleepTimerService value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<SleepTimerService>(value),
    );
  }
}

String _$sleepTimerServiceHash() => r'cbc0258f52b6fe294ec21b90f4605e6be8a603e6';

@ProviderFor(SleepTimerNotifier)
const sleepTimerProvider = SleepTimerNotifierProvider._();

final class SleepTimerNotifierProvider
    extends $NotifierProvider<SleepTimerNotifier, SleepTimerState> {
  const SleepTimerNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'sleepTimerProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$sleepTimerNotifierHash();

  @$internal
  @override
  SleepTimerNotifier create() => SleepTimerNotifier();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(SleepTimerState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<SleepTimerState>(value),
    );
  }
}

String _$sleepTimerNotifierHash() =>
    r'36478a52ba8a79a24eda58b3f0d146e2bb09dc02';

abstract class _$SleepTimerNotifier extends $Notifier<SleepTimerState> {
  SleepTimerState build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<SleepTimerState, SleepTimerState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<SleepTimerState, SleepTimerState>,
              SleepTimerState,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
