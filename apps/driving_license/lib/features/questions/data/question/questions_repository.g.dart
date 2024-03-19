// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'questions_repository.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$questionsRepositoryHash() =>
    r'e5ac8335ba129717e770beac729ec00e5ed41d27';

/// See also [questionsRepository].
@ProviderFor(questionsRepository)
final questionsRepositoryProvider = Provider<QuestionsRepository>.internal(
  questionsRepository,
  name: r'questionsRepositoryProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$questionsRepositoryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef QuestionsRepositoryRef = ProviderRef<QuestionsRepository>;
String _$allQuestionDbIndexesByChapterHash() =>
    r'7b3b2f3ae74e0aa98bdf1e8104b1f58e0a7c3c3e';

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

/// See also [allQuestionDbIndexesByChapter].
@ProviderFor(allQuestionDbIndexesByChapter)
const allQuestionDbIndexesByChapterProvider =
    AllQuestionDbIndexesByChapterFamily();

/// See also [allQuestionDbIndexesByChapter].
class AllQuestionDbIndexesByChapterFamily
    extends Family<AsyncValue<List<QuestionDbIndex>>> {
  /// See also [allQuestionDbIndexesByChapter].
  const AllQuestionDbIndexesByChapterFamily();

  /// See also [allQuestionDbIndexesByChapter].
  AllQuestionDbIndexesByChapterProvider call(
    Chapter chapter,
  ) {
    return AllQuestionDbIndexesByChapterProvider(
      chapter,
    );
  }

  @override
  AllQuestionDbIndexesByChapterProvider getProviderOverride(
    covariant AllQuestionDbIndexesByChapterProvider provider,
  ) {
    return call(
      provider.chapter,
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
  String? get name => r'allQuestionDbIndexesByChapterProvider';
}

/// See also [allQuestionDbIndexesByChapter].
class AllQuestionDbIndexesByChapterProvider
    extends AutoDisposeFutureProvider<List<QuestionDbIndex>> {
  /// See also [allQuestionDbIndexesByChapter].
  AllQuestionDbIndexesByChapterProvider(
    Chapter chapter,
  ) : this._internal(
          (ref) => allQuestionDbIndexesByChapter(
            ref as AllQuestionDbIndexesByChapterRef,
            chapter,
          ),
          from: allQuestionDbIndexesByChapterProvider,
          name: r'allQuestionDbIndexesByChapterProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$allQuestionDbIndexesByChapterHash,
          dependencies: AllQuestionDbIndexesByChapterFamily._dependencies,
          allTransitiveDependencies:
              AllQuestionDbIndexesByChapterFamily._allTransitiveDependencies,
          chapter: chapter,
        );

  AllQuestionDbIndexesByChapterProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.chapter,
  }) : super.internal();

  final Chapter chapter;

  @override
  Override overrideWith(
    FutureOr<List<QuestionDbIndex>> Function(
            AllQuestionDbIndexesByChapterRef provider)
        create,
  ) {
    return ProviderOverride(
      origin: this,
      override: AllQuestionDbIndexesByChapterProvider._internal(
        (ref) => create(ref as AllQuestionDbIndexesByChapterRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        chapter: chapter,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<List<QuestionDbIndex>> createElement() {
    return _AllQuestionDbIndexesByChapterProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is AllQuestionDbIndexesByChapterProvider &&
        other.chapter == chapter;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, chapter.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin AllQuestionDbIndexesByChapterRef
    on AutoDisposeFutureProviderRef<List<QuestionDbIndex>> {
  /// The parameter `chapter` of this provider.
  Chapter get chapter;
}

class _AllQuestionDbIndexesByChapterProviderElement
    extends AutoDisposeFutureProviderElement<List<QuestionDbIndex>>
    with AllQuestionDbIndexesByChapterRef {
  _AllQuestionDbIndexesByChapterProviderElement(super.provider);

  @override
  Chapter get chapter =>
      (origin as AllQuestionDbIndexesByChapterProvider).chapter;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
