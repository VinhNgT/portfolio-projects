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
String _$questionFutureHash() => r'30c864cd7154e95de20992ed868ecc8c49f7e7a7';

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

String _$questionsPageFutureHash() =>
    r'b7ae152723228a69a67860d4f7e87e655effe1e5';

/// See also [questionsPageFuture].
@ProviderFor(questionsPageFuture)
const questionsPageFutureProvider = QuestionsPageFutureFamily();

/// See also [questionsPageFuture].
class QuestionsPageFutureFamily extends Family<AsyncValue<List<Question>>> {
  /// See also [questionsPageFuture].
  const QuestionsPageFutureFamily();

  /// See also [questionsPageFuture].
  QuestionsPageFutureProvider call(
    int pageNumber,
  ) {
    return QuestionsPageFutureProvider(
      pageNumber,
    );
  }

  @override
  QuestionsPageFutureProvider getProviderOverride(
    covariant QuestionsPageFutureProvider provider,
  ) {
    return call(
      provider.pageNumber,
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
  String? get name => r'questionsPageFutureProvider';
}

/// See also [questionsPageFuture].
class QuestionsPageFutureProvider
    extends AutoDisposeFutureProvider<List<Question>> {
  /// See also [questionsPageFuture].
  QuestionsPageFutureProvider(
    int pageNumber,
  ) : this._internal(
          (ref) => questionsPageFuture(
            ref as QuestionsPageFutureRef,
            pageNumber,
          ),
          from: questionsPageFutureProvider,
          name: r'questionsPageFutureProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$questionsPageFutureHash,
          dependencies: QuestionsPageFutureFamily._dependencies,
          allTransitiveDependencies:
              QuestionsPageFutureFamily._allTransitiveDependencies,
          pageNumber: pageNumber,
        );

  QuestionsPageFutureProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.pageNumber,
  }) : super.internal();

  final int pageNumber;

  @override
  Override overrideWith(
    FutureOr<List<Question>> Function(QuestionsPageFutureRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: QuestionsPageFutureProvider._internal(
        (ref) => create(ref as QuestionsPageFutureRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        pageNumber: pageNumber,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<List<Question>> createElement() {
    return _QuestionsPageFutureProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is QuestionsPageFutureProvider &&
        other.pageNumber == pageNumber;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, pageNumber.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin QuestionsPageFutureRef on AutoDisposeFutureProviderRef<List<Question>> {
  /// The parameter `pageNumber` of this provider.
  int get pageNumber;
}

class _QuestionsPageFutureProviderElement
    extends AutoDisposeFutureProviderElement<List<Question>>
    with QuestionsPageFutureRef {
  _QuestionsPageFutureProviderElement(super.provider);

  @override
  int get pageNumber => (origin as QuestionsPageFutureProvider).pageNumber;
}

String _$questionCountFutureHash() =>
    r'8a6b844ca7860742805bb0fcfc1aacef55593e3d';

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
String _$questionPreloadPagesFutureHash() =>
    r'06b3c5c89f0350fe51b55be423ec5e945f827dcd';

/// See also [questionPreloadPagesFuture].
@ProviderFor(questionPreloadPagesFuture)
const questionPreloadPagesFutureProvider = QuestionPreloadPagesFutureFamily();

/// See also [questionPreloadPagesFuture].
class QuestionPreloadPagesFutureFamily extends Family<AsyncValue<Question>> {
  /// See also [questionPreloadPagesFuture].
  const QuestionPreloadPagesFutureFamily();

  /// See also [questionPreloadPagesFuture].
  QuestionPreloadPagesFutureProvider call(
    int index,
  ) {
    return QuestionPreloadPagesFutureProvider(
      index,
    );
  }

  @override
  QuestionPreloadPagesFutureProvider getProviderOverride(
    covariant QuestionPreloadPagesFutureProvider provider,
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
  String? get name => r'questionPreloadPagesFutureProvider';
}

/// See also [questionPreloadPagesFuture].
class QuestionPreloadPagesFutureProvider
    extends AutoDisposeFutureProvider<Question> {
  /// See also [questionPreloadPagesFuture].
  QuestionPreloadPagesFutureProvider(
    int index,
  ) : this._internal(
          (ref) => questionPreloadPagesFuture(
            ref as QuestionPreloadPagesFutureRef,
            index,
          ),
          from: questionPreloadPagesFutureProvider,
          name: r'questionPreloadPagesFutureProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$questionPreloadPagesFutureHash,
          dependencies: QuestionPreloadPagesFutureFamily._dependencies,
          allTransitiveDependencies:
              QuestionPreloadPagesFutureFamily._allTransitiveDependencies,
          index: index,
        );

  QuestionPreloadPagesFutureProvider._internal(
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
    FutureOr<Question> Function(QuestionPreloadPagesFutureRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: QuestionPreloadPagesFutureProvider._internal(
        (ref) => create(ref as QuestionPreloadPagesFutureRef),
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
    return _QuestionPreloadPagesFutureProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is QuestionPreloadPagesFutureProvider && other.index == index;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, index.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin QuestionPreloadPagesFutureRef on AutoDisposeFutureProviderRef<Question> {
  /// The parameter `index` of this provider.
  int get index;
}

class _QuestionPreloadPagesFutureProviderElement
    extends AutoDisposeFutureProviderElement<Question>
    with QuestionPreloadPagesFutureRef {
  _QuestionPreloadPagesFutureProviderElement(super.provider);

  @override
  int get index => (origin as QuestionPreloadPagesFutureProvider).index;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
