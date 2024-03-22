// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'questions_service.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$questionsServiceModeHash() =>
    r'36bc8bf6055763e47c74e5ef1713077a223255a9';

/// See also [questionsServiceMode].
@ProviderFor(questionsServiceMode)
final questionsServiceModeProvider =
    AutoDisposeProvider<QuestionsServiceMode>.internal(
  questionsServiceMode,
  name: r'questionsServiceModeProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$questionsServiceModeHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef QuestionsServiceModeRef = AutoDisposeProviderRef<QuestionsServiceMode>;
String _$questionFutureHash() => r'075c0e6fba50cb756ade96345df187fce37c029f';

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
    int questionIndex,
  ) {
    return QuestionFutureProvider(
      questionIndex,
    );
  }

  @override
  QuestionFutureProvider getProviderOverride(
    covariant QuestionFutureProvider provider,
  ) {
    return call(
      provider.questionIndex,
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
    int questionIndex,
  ) : this._internal(
          (ref) => questionFuture(
            ref as QuestionFutureRef,
            questionIndex,
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
          questionIndex: questionIndex,
        );

  QuestionFutureProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.questionIndex,
  }) : super.internal();

  final int questionIndex;

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
        questionIndex: questionIndex,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<Question> createElement() {
    return _QuestionFutureProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is QuestionFutureProvider &&
        other.questionIndex == questionIndex;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, questionIndex.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin QuestionFutureRef on AutoDisposeFutureProviderRef<Question> {
  /// The parameter `questionIndex` of this provider.
  int get questionIndex;
}

class _QuestionFutureProviderElement
    extends AutoDisposeFutureProviderElement<Question> with QuestionFutureRef {
  _QuestionFutureProviderElement(super.provider);

  @override
  int get questionIndex => (origin as QuestionFutureProvider).questionIndex;
}

String _$questionsPageFutureHash() =>
    r'387de844042b6941342158bd9a43d3da32899ef7';

/// See also [questionsPageFuture].
@ProviderFor(questionsPageFuture)
const questionsPageFutureProvider = QuestionsPageFutureFamily();

/// See also [questionsPageFuture].
class QuestionsPageFutureFamily extends Family<AsyncValue<List<Question>>> {
  /// See also [questionsPageFuture].
  const QuestionsPageFutureFamily();

  /// See also [questionsPageFuture].
  QuestionsPageFutureProvider call(
    int pageIndex,
  ) {
    return QuestionsPageFutureProvider(
      pageIndex,
    );
  }

  @override
  QuestionsPageFutureProvider getProviderOverride(
    covariant QuestionsPageFutureProvider provider,
  ) {
    return call(
      provider.pageIndex,
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
    int pageIndex,
  ) : this._internal(
          (ref) => questionsPageFuture(
            ref as QuestionsPageFutureRef,
            pageIndex,
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
          pageIndex: pageIndex,
        );

  QuestionsPageFutureProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.pageIndex,
  }) : super.internal();

  final int pageIndex;

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
        pageIndex: pageIndex,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<List<Question>> createElement() {
    return _QuestionsPageFutureProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is QuestionsPageFutureProvider && other.pageIndex == pageIndex;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, pageIndex.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin QuestionsPageFutureRef on AutoDisposeFutureProviderRef<List<Question>> {
  /// The parameter `pageIndex` of this provider.
  int get pageIndex;
}

class _QuestionsPageFutureProviderElement
    extends AutoDisposeFutureProviderElement<List<Question>>
    with QuestionsPageFutureRef {
  _QuestionsPageFutureProviderElement(super.provider);

  @override
  int get pageIndex => (origin as QuestionsPageFutureProvider).pageIndex;
}

String _$questionCountFutureHash() =>
    r'ef7bd8e8b03dc898382ce3d84fc1564634d20642';

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
    r'23b6bd3cb7e7d442beb28dda07f66fb06e86eb56';

/// See also [questionPreloadPagesFuture].
@ProviderFor(questionPreloadPagesFuture)
const questionPreloadPagesFutureProvider = QuestionPreloadPagesFutureFamily();

/// See also [questionPreloadPagesFuture].
class QuestionPreloadPagesFutureFamily extends Family<AsyncValue<Question>> {
  /// See also [questionPreloadPagesFuture].
  const QuestionPreloadPagesFutureFamily();

  /// See also [questionPreloadPagesFuture].
  QuestionPreloadPagesFutureProvider call(
    int questionIndex,
  ) {
    return QuestionPreloadPagesFutureProvider(
      questionIndex,
    );
  }

  @override
  QuestionPreloadPagesFutureProvider getProviderOverride(
    covariant QuestionPreloadPagesFutureProvider provider,
  ) {
    return call(
      provider.questionIndex,
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
    int questionIndex,
  ) : this._internal(
          (ref) => questionPreloadPagesFuture(
            ref as QuestionPreloadPagesFutureRef,
            questionIndex,
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
          questionIndex: questionIndex,
        );

  QuestionPreloadPagesFutureProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.questionIndex,
  }) : super.internal();

  final int questionIndex;

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
        questionIndex: questionIndex,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<Question> createElement() {
    return _QuestionPreloadPagesFutureProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is QuestionPreloadPagesFutureProvider &&
        other.questionIndex == questionIndex;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, questionIndex.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin QuestionPreloadPagesFutureRef on AutoDisposeFutureProviderRef<Question> {
  /// The parameter `questionIndex` of this provider.
  int get questionIndex;
}

class _QuestionPreloadPagesFutureProviderElement
    extends AutoDisposeFutureProviderElement<Question>
    with QuestionPreloadPagesFutureRef {
  _QuestionPreloadPagesFutureProviderElement(super.provider);

  @override
  int get questionIndex =>
      (origin as QuestionPreloadPagesFutureProvider).questionIndex;
}

String _$userSelectedAnswerIndexHash() =>
    r'8c73a3c392ab03f7a159390868ca3258a30692db';

/// See also [userSelectedAnswerIndex].
@ProviderFor(userSelectedAnswerIndex)
const userSelectedAnswerIndexProvider = UserSelectedAnswerIndexFamily();

/// See also [userSelectedAnswerIndex].
class UserSelectedAnswerIndexFamily extends Family<AsyncValue<int?>> {
  /// See also [userSelectedAnswerIndex].
  const UserSelectedAnswerIndexFamily();

  /// See also [userSelectedAnswerIndex].
  UserSelectedAnswerIndexProvider call(
    Question question,
  ) {
    return UserSelectedAnswerIndexProvider(
      question,
    );
  }

  @override
  UserSelectedAnswerIndexProvider getProviderOverride(
    covariant UserSelectedAnswerIndexProvider provider,
  ) {
    return call(
      provider.question,
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
    Question question,
  ) : this._internal(
          (ref) => userSelectedAnswerIndex(
            ref as UserSelectedAnswerIndexRef,
            question,
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
          question: question,
        );

  UserSelectedAnswerIndexProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.question,
  }) : super.internal();

  final Question question;

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
        question: question,
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
        other.question == question;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, question.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin UserSelectedAnswerIndexRef on AutoDisposeStreamProviderRef<int?> {
  /// The parameter `question` of this provider.
  Question get question;
}

class _UserSelectedAnswerIndexProviderElement
    extends AutoDisposeStreamProviderElement<int?>
    with UserSelectedAnswerIndexRef {
  _UserSelectedAnswerIndexProviderElement(super.provider);

  @override
  Question get question => (origin as UserSelectedAnswerIndexProvider).question;
}

String _$questionsServiceControllerHash() =>
    r'c656d653f3c83af4d545a3e461c18168003223d5';

/// See also [QuestionsServiceController].
@ProviderFor(QuestionsServiceController)
final questionsServiceControllerProvider =
    NotifierProvider<QuestionsServiceController, QuestionsService>.internal(
  QuestionsServiceController.new,
  name: r'questionsServiceControllerProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$questionsServiceControllerHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$QuestionsServiceController = Notifier<QuestionsService>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
