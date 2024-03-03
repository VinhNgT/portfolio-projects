// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'question_repository.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$questionRepositoryHash() =>
    r'4cf904250f4a7ceb0702d1943964a16f4ce0dee2';

/// See also [questionRepository].
@ProviderFor(questionRepository)
final questionRepositoryProvider =
    AutoDisposeProvider<QuestionRepository>.internal(
  questionRepository,
  name: r'questionRepositoryProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$questionRepositoryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef QuestionRepositoryRef = AutoDisposeProviderRef<QuestionRepository>;
String _$questionFutureHash() => r'cd12b41c1979b1ddc1f0c70c0a35e873fa1c71bf';

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

/// See also [questionFuture].
@ProviderFor(questionFuture)
const questionFutureProvider = QuestionFutureFamily();

/// See also [questionFuture].
class QuestionFutureFamily extends Family<AsyncValue<Question>> {
  /// See also [questionFuture].
  const QuestionFutureFamily();

  /// See also [questionFuture].
  QuestionFutureProvider call(
    int index,
  ) {
    return QuestionFutureProvider(
      index,
    );
  }

  @override
  QuestionFutureProvider getProviderOverride(
    covariant QuestionFutureProvider provider,
  ) {
    return call(
      provider.index,
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
  String? get name => r'questionFutureProvider';
}

/// See also [questionFuture].
class QuestionFutureProvider extends AutoDisposeFutureProvider<Question> {
  /// See also [questionFuture].
  QuestionFutureProvider(
    int index,
  ) : this._internal(
          (ref) => questionFuture(
            ref as QuestionFutureRef,
            index,
          ),
          from: questionFutureProvider,
          name: r'questionFutureProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$questionFutureHash,
          dependencies: QuestionFutureFamily._dependencies,
          allTransitiveDependencies:
              QuestionFutureFamily._allTransitiveDependencies,
          index: index,
        );

  QuestionFutureProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.index,
  }) : super.internal();

  final int index;

  @override
  Override overrideWith(
    FutureOr<Question> Function(QuestionFutureRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: QuestionFutureProvider._internal(
        (ref) => create(ref as QuestionFutureRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        index: index,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<Question> createElement() {
    return _QuestionFutureProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is QuestionFutureProvider && other.index == index;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, index.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin QuestionFutureRef on AutoDisposeFutureProviderRef<Question> {
  /// The parameter `index` of this provider.
  int get index;
}

class _QuestionFutureProviderElement
    extends AutoDisposeFutureProviderElement<Question> with QuestionFutureRef {
  _QuestionFutureProviderElement(super.provider);

  @override
  int get index => (origin as QuestionFutureProvider).index;
}

String _$questionCountFutureHash() =>
    r'ee54f753c0789e6d4f07c716daec6e416862b05b';

/// See also [questionCountFuture].
@ProviderFor(questionCountFuture)
final questionCountFutureProvider = AutoDisposeFutureProvider<int>.internal(
  questionCountFuture,
  name: r'questionCountFutureProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$questionCountFutureHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef QuestionCountFutureRef = AutoDisposeFutureProviderRef<int>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
