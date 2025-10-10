// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'author_image_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(AuthorImageNotifier)
const authorImageProvider = AuthorImageNotifierFamily._();

final class AuthorImageNotifierProvider
    extends $NotifierProvider<AuthorImageNotifier, AuthorImageState> {
  const AuthorImageNotifierProvider._({
    required AuthorImageNotifierFamily super.from,
    required String super.argument,
  }) : super(
         retry: null,
         name: r'authorImageProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$authorImageNotifierHash();

  @override
  String toString() {
    return r'authorImageProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  AuthorImageNotifier create() => AuthorImageNotifier();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(AuthorImageState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<AuthorImageState>(value),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is AuthorImageNotifierProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$authorImageNotifierHash() =>
    r'70a4478f26145550162b29857667743861631e74';

final class AuthorImageNotifierFamily extends $Family
    with
        $ClassFamilyOverride<
          AuthorImageNotifier,
          AuthorImageState,
          AuthorImageState,
          AuthorImageState,
          String
        > {
  const AuthorImageNotifierFamily._()
    : super(
        retry: null,
        name: r'authorImageProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  AuthorImageNotifierProvider call(String authorId) =>
      AuthorImageNotifierProvider._(argument: authorId, from: this);

  @override
  String toString() => r'authorImageProvider';
}

abstract class _$AuthorImageNotifier extends $Notifier<AuthorImageState> {
  late final _$args = ref.$arg as String;
  String get authorId => _$args;

  AuthorImageState build(String authorId);
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build(_$args);
    final ref = this.ref as $Ref<AuthorImageState, AuthorImageState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AuthorImageState, AuthorImageState>,
              AuthorImageState,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}

@ProviderFor(authorImageBytes)
const authorImageBytesProvider = AuthorImageBytesFamily._();

final class AuthorImageBytesProvider
    extends $FunctionalProvider<Uint8List?, Uint8List?, Uint8List?>
    with $Provider<Uint8List?> {
  const AuthorImageBytesProvider._({
    required AuthorImageBytesFamily super.from,
    required String super.argument,
  }) : super(
         retry: null,
         name: r'authorImageBytesProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$authorImageBytesHash();

  @override
  String toString() {
    return r'authorImageBytesProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $ProviderElement<Uint8List?> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  Uint8List? create(Ref ref) {
    final argument = this.argument as String;
    return authorImageBytes(ref, argument);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(Uint8List? value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<Uint8List?>(value),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is AuthorImageBytesProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$authorImageBytesHash() => r'5f87f587dc759dc5fa95a2fdccc3f2a261c0abaf';

final class AuthorImageBytesFamily extends $Family
    with $FunctionalFamilyOverride<Uint8List?, String> {
  const AuthorImageBytesFamily._()
    : super(
        retry: null,
        name: r'authorImageBytesProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  AuthorImageBytesProvider call(String authorId) =>
      AuthorImageBytesProvider._(argument: authorId, from: this);

  @override
  String toString() => r'authorImageBytesProvider';
}

@ProviderFor(isAuthorImageLoading)
const isAuthorImageLoadingProvider = IsAuthorImageLoadingFamily._();

final class IsAuthorImageLoadingProvider
    extends $FunctionalProvider<bool, bool, bool>
    with $Provider<bool> {
  const IsAuthorImageLoadingProvider._({
    required IsAuthorImageLoadingFamily super.from,
    required String super.argument,
  }) : super(
         retry: null,
         name: r'isAuthorImageLoadingProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$isAuthorImageLoadingHash();

  @override
  String toString() {
    return r'isAuthorImageLoadingProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $ProviderElement<bool> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  bool create(Ref ref) {
    final argument = this.argument as String;
    return isAuthorImageLoading(ref, argument);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(bool value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<bool>(value),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is IsAuthorImageLoadingProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$isAuthorImageLoadingHash() =>
    r'aac15fc7e07401b75f9e77e6f01619654c2e8aa4';

final class IsAuthorImageLoadingFamily extends $Family
    with $FunctionalFamilyOverride<bool, String> {
  const IsAuthorImageLoadingFamily._()
    : super(
        retry: null,
        name: r'isAuthorImageLoadingProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  IsAuthorImageLoadingProvider call(String authorId) =>
      IsAuthorImageLoadingProvider._(argument: authorId, from: this);

  @override
  String toString() => r'isAuthorImageLoadingProvider';
}

@ProviderFor(authorImageError)
const authorImageErrorProvider = AuthorImageErrorFamily._();

final class AuthorImageErrorProvider
    extends $FunctionalProvider<String?, String?, String?>
    with $Provider<String?> {
  const AuthorImageErrorProvider._({
    required AuthorImageErrorFamily super.from,
    required String super.argument,
  }) : super(
         retry: null,
         name: r'authorImageErrorProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$authorImageErrorHash();

  @override
  String toString() {
    return r'authorImageErrorProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $ProviderElement<String?> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  String? create(Ref ref) {
    final argument = this.argument as String;
    return authorImageError(ref, argument);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(String? value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<String?>(value),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is AuthorImageErrorProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$authorImageErrorHash() => r'bfead46e300b7e38ef38d29f0e4b9275d65252c5';

final class AuthorImageErrorFamily extends $Family
    with $FunctionalFamilyOverride<String?, String> {
  const AuthorImageErrorFamily._()
    : super(
        retry: null,
        name: r'authorImageErrorProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  AuthorImageErrorProvider call(String authorId) =>
      AuthorImageErrorProvider._(argument: authorId, from: this);

  @override
  String toString() => r'authorImageErrorProvider';
}
