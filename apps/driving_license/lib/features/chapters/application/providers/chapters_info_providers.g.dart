// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chapters_info_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$chapterQuestionsCountHash() =>
    r'e1f39879692c556140a18421335e7f0041f66dd5';

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

/// See also [chapterQuestionsCount].
@ProviderFor(chapterQuestionsCount)
const chapterQuestionsCountProvider = ChapterQuestionsCountFamily();

/// See also [chapterQuestionsCount].
class ChapterQuestionsCountFamily extends Family<AsyncValue<int>> {
  /// See also [chapterQuestionsCount].
  const ChapterQuestionsCountFamily();

  /// See also [chapterQuestionsCount].
  ChapterQuestionsCountProvider call(
    Chapter chapter,
  ) {
    return ChapterQuestionsCountProvider(
      chapter,
    );
  }

  @override
  ChapterQuestionsCountProvider getProviderOverride(
    covariant ChapterQuestionsCountProvider provider,
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
  String? get name => r'chapterQuestionsCountProvider';
}

/// See also [chapterQuestionsCount].
class ChapterQuestionsCountProvider extends AutoDisposeFutureProvider<int> {
  /// See also [chapterQuestionsCount].
  ChapterQuestionsCountProvider(
    Chapter chapter,
  ) : this._internal(
          (ref) => chapterQuestionsCount(
            ref as ChapterQuestionsCountRef,
            chapter,
          ),
          from: chapterQuestionsCountProvider,
          name: r'chapterQuestionsCountProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$chapterQuestionsCountHash,
          dependencies: ChapterQuestionsCountFamily._dependencies,
          allTransitiveDependencies:
              ChapterQuestionsCountFamily._allTransitiveDependencies,
          chapter: chapter,
        );

  ChapterQuestionsCountProvider._internal(
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
    FutureOr<int> Function(ChapterQuestionsCountRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: ChapterQuestionsCountProvider._internal(
        (ref) => create(ref as ChapterQuestionsCountRef),
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
  AutoDisposeFutureProviderElement<int> createElement() {
    return _ChapterQuestionsCountProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is ChapterQuestionsCountProvider && other.chapter == chapter;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, chapter.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin ChapterQuestionsCountRef on AutoDisposeFutureProviderRef<int> {
  /// The parameter `chapter` of this provider.
  Chapter get chapter;
}

class _ChapterQuestionsCountProviderElement
    extends AutoDisposeFutureProviderElement<int>
    with ChapterQuestionsCountRef {
  _ChapterQuestionsCountProviderElement(super.provider);

  @override
  Chapter get chapter => (origin as ChapterQuestionsCountProvider).chapter;
}

String _$notEmptyChaptersHash() => r'407b3a91719269dcbf08f5d90ea59c247e67b8ed';

/// See also [notEmptyChapters].
@ProviderFor(notEmptyChapters)
final notEmptyChaptersProvider =
    AutoDisposeFutureProvider<List<Chapter>>.internal(
  notEmptyChapters,
  name: r'notEmptyChaptersProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$notEmptyChaptersHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef NotEmptyChaptersRef = AutoDisposeFutureProviderRef<List<Chapter>>;
String _$chapterCompletionStatusHash() =>
    r'383d967adbd29ac2fda250190c8f8486b94adeb4';

/// See also [chapterCompletionStatus].
@ProviderFor(chapterCompletionStatus)
const chapterCompletionStatusProvider = ChapterCompletionStatusFamily();

/// See also [chapterCompletionStatus].
class ChapterCompletionStatusFamily extends Family<
    AsyncValue<({int questionsCount, UserAnswersSummary summary})>> {
  /// See also [chapterCompletionStatus].
  const ChapterCompletionStatusFamily();

  /// See also [chapterCompletionStatus].
  ChapterCompletionStatusProvider call(
    Chapter chapter,
  ) {
    return ChapterCompletionStatusProvider(
      chapter,
    );
  }

  @override
  ChapterCompletionStatusProvider getProviderOverride(
    covariant ChapterCompletionStatusProvider provider,
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
  String? get name => r'chapterCompletionStatusProvider';
}

/// See also [chapterCompletionStatus].
class ChapterCompletionStatusProvider extends AutoDisposeStreamProvider<
    ({int questionsCount, UserAnswersSummary summary})> {
  /// See also [chapterCompletionStatus].
  ChapterCompletionStatusProvider(
    Chapter chapter,
  ) : this._internal(
          (ref) => chapterCompletionStatus(
            ref as ChapterCompletionStatusRef,
            chapter,
          ),
          from: chapterCompletionStatusProvider,
          name: r'chapterCompletionStatusProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$chapterCompletionStatusHash,
          dependencies: ChapterCompletionStatusFamily._dependencies,
          allTransitiveDependencies:
              ChapterCompletionStatusFamily._allTransitiveDependencies,
          chapter: chapter,
        );

  ChapterCompletionStatusProvider._internal(
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
    Stream<({int questionsCount, UserAnswersSummary summary})> Function(
            ChapterCompletionStatusRef provider)
        create,
  ) {
    return ProviderOverride(
      origin: this,
      override: ChapterCompletionStatusProvider._internal(
        (ref) => create(ref as ChapterCompletionStatusRef),
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
  AutoDisposeStreamProviderElement<
      ({int questionsCount, UserAnswersSummary summary})> createElement() {
    return _ChapterCompletionStatusProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is ChapterCompletionStatusProvider && other.chapter == chapter;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, chapter.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin ChapterCompletionStatusRef on AutoDisposeStreamProviderRef<
    ({int questionsCount, UserAnswersSummary summary})> {
  /// The parameter `chapter` of this provider.
  Chapter get chapter;
}

class _ChapterCompletionStatusProviderElement
    extends AutoDisposeStreamProviderElement<
        ({int questionsCount, UserAnswersSummary summary})>
    with ChapterCompletionStatusRef {
  _ChapterCompletionStatusProviderElement(super.provider);

  @override
  Chapter get chapter => (origin as ChapterCompletionStatusProvider).chapter;
}

String _$chapterFirstUnansweredQuestionIndexHash() =>
    r'80ec643f7eed134ae83248f672f703c6deed0c4c';

/// See also [chapterFirstUnansweredQuestionIndex].
@ProviderFor(chapterFirstUnansweredQuestionIndex)
const chapterFirstUnansweredQuestionIndexProvider =
    ChapterFirstUnansweredQuestionIndexFamily();

/// See also [chapterFirstUnansweredQuestionIndex].
class ChapterFirstUnansweredQuestionIndexFamily
    extends Family<AsyncValue<int?>> {
  /// See also [chapterFirstUnansweredQuestionIndex].
  const ChapterFirstUnansweredQuestionIndexFamily();

  /// See also [chapterFirstUnansweredQuestionIndex].
  ChapterFirstUnansweredQuestionIndexProvider call(
    Chapter chapter,
  ) {
    return ChapterFirstUnansweredQuestionIndexProvider(
      chapter,
    );
  }

  @override
  ChapterFirstUnansweredQuestionIndexProvider getProviderOverride(
    covariant ChapterFirstUnansweredQuestionIndexProvider provider,
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
  String? get name => r'chapterFirstUnansweredQuestionIndexProvider';
}

/// See also [chapterFirstUnansweredQuestionIndex].
class ChapterFirstUnansweredQuestionIndexProvider
    extends AutoDisposeFutureProvider<int?> {
  /// See also [chapterFirstUnansweredQuestionIndex].
  ChapterFirstUnansweredQuestionIndexProvider(
    Chapter chapter,
  ) : this._internal(
          (ref) => chapterFirstUnansweredQuestionIndex(
            ref as ChapterFirstUnansweredQuestionIndexRef,
            chapter,
          ),
          from: chapterFirstUnansweredQuestionIndexProvider,
          name: r'chapterFirstUnansweredQuestionIndexProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$chapterFirstUnansweredQuestionIndexHash,
          dependencies: ChapterFirstUnansweredQuestionIndexFamily._dependencies,
          allTransitiveDependencies: ChapterFirstUnansweredQuestionIndexFamily
              ._allTransitiveDependencies,
          chapter: chapter,
        );

  ChapterFirstUnansweredQuestionIndexProvider._internal(
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
    FutureOr<int?> Function(ChapterFirstUnansweredQuestionIndexRef provider)
        create,
  ) {
    return ProviderOverride(
      origin: this,
      override: ChapterFirstUnansweredQuestionIndexProvider._internal(
        (ref) => create(ref as ChapterFirstUnansweredQuestionIndexRef),
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
  AutoDisposeFutureProviderElement<int?> createElement() {
    return _ChapterFirstUnansweredQuestionIndexProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is ChapterFirstUnansweredQuestionIndexProvider &&
        other.chapter == chapter;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, chapter.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin ChapterFirstUnansweredQuestionIndexRef
    on AutoDisposeFutureProviderRef<int?> {
  /// The parameter `chapter` of this provider.
  Chapter get chapter;
}

class _ChapterFirstUnansweredQuestionIndexProviderElement
    extends AutoDisposeFutureProviderElement<int?>
    with ChapterFirstUnansweredQuestionIndexRef {
  _ChapterFirstUnansweredQuestionIndexProviderElement(super.provider);

  @override
  Chapter get chapter =>
      (origin as ChapterFirstUnansweredQuestionIndexProvider).chapter;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
