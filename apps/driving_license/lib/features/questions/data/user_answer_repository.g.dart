// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_answer_repository.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$userAnswerRepositoryHash() =>
    r'b1c7fd9aaeecb0227fbef5fe2b78924f136e9d75';

/// See also [userAnswerRepository].
@ProviderFor(userAnswerRepository)
final userAnswerRepositoryProvider = Provider<UserAnswerRepository>.internal(
  userAnswerRepository,
  name: r'userAnswerRepositoryProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$userAnswerRepositoryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef UserAnswerRepositoryRef = ProviderRef<UserAnswerRepository>;
String _$userSelectedAnswerIndexHash() =>
    r'8745bfb7da0c11e803fab7d0e71dcc771bc107be';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

/// See also [userSelectedAnswerIndex].
@ProviderFor(userSelectedAnswerIndex)
const userSelectedAnswerIndexProvider = UserSelectedAnswerIndexFamily();

/// See also [userSelectedAnswerIndex].
class UserSelectedAnswerIndexFamily extends Family<AsyncValue<int?>> {
  /// See also [userSelectedAnswerIndex].
  const UserSelectedAnswerIndexFamily();

  /// See also [userSelectedAnswerIndex].
  UserSelectedAnswerIndexProvider call(
    int questionDbIndex,
  ) {
    return UserSelectedAnswerIndexProvider(
      questionDbIndex,
    );
  }

  @override
  UserSelectedAnswerIndexProvider getProviderOverride(
    covariant UserSelectedAnswerIndexProvider provider,
  ) {
    return call(
      provider.questionDbIndex,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'userSelectedAnswerIndexProvider';
}

/// See also [userSelectedAnswerIndex].
class UserSelectedAnswerIndexProvider extends AutoDisposeStreamProvider<int?> {
  /// See also [userSelectedAnswerIndex].
  UserSelectedAnswerIndexProvider(
    int questionDbIndex,
  ) : this._internal(
          (ref) => userSelectedAnswerIndex(
            ref as UserSelectedAnswerIndexRef,
            questionDbIndex,
          ),
          from: userSelectedAnswerIndexProvider,
          name: r'userSelectedAnswerIndexProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$userSelectedAnswerIndexHash,
          dependencies: UserSelectedAnswerIndexFamily._dependencies,
          allTransitiveDependencies:
              UserSelectedAnswerIndexFamily._allTransitiveDependencies,
          questionDbIndex: questionDbIndex,
        );

  UserSelectedAnswerIndexProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.questionDbIndex,
  }) : super.internal();

  final int questionDbIndex;

  @override
  Override overrideWith(
    Stream<int?> Function(UserSelectedAnswerIndexRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: UserSelectedAnswerIndexProvider._internal(
        (ref) => create(ref as UserSelectedAnswerIndexRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        questionDbIndex: questionDbIndex,
      ),
    );
  }

  @override
  AutoDisposeStreamProviderElement<int?> createElement() {
    return _UserSelectedAnswerIndexProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is UserSelectedAnswerIndexProvider &&
        other.questionDbIndex == questionDbIndex;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, questionDbIndex.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin UserSelectedAnswerIndexRef on AutoDisposeStreamProviderRef<int?> {
  /// The parameter `questionDbIndex` of this provider.
  int get questionDbIndex;
}

class _UserSelectedAnswerIndexProviderElement
    extends AutoDisposeStreamProviderElement<int?>
    with UserSelectedAnswerIndexRef {
  _UserSelectedAnswerIndexProviderElement(super.provider);

  @override
  int get questionDbIndex =>
      (origin as UserSelectedAnswerIndexProvider).questionDbIndex;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
