// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chapter_info_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$chapterQuestionsCountHash() =>
    r'5f674de8dc7d872f2110aecd9f580abffcd01058';

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

String _$chaptersHasQuestionHash() =>
    r'2dab251afa173ee66d759e6b376dba4cbb31bc7e';

/// See also [chaptersHasQuestion].
@ProviderFor(chaptersHasQuestion)
final chaptersHasQuestionProvider =
    AutoDisposeFutureProvider<List<Chapter>>.internal(
  chaptersHasQuestion,
  name: r'chaptersHasQuestionProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$chaptersHasQuestionHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef ChaptersHasQuestionRef = AutoDisposeFutureProviderRef<List<Chapter>>;
String _$chapterCompletionStatusHash() =>
    r'5a14d08a014c041a1b6351c3db7009440e37ae76';

/// See also [chapterCompletionStatus].
@ProviderFor(chapterCompletionStatus)
const chapterCompletionStatusProvider = ChapterCompletionStatusFamily();

/// See also [chapterCompletionStatus].
class ChapterCompletionStatusFamily extends Family<AsyncValue<TestResult>> {
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
class ChapterCompletionStatusProvider
    extends AutoDisposeStreamProvider<TestResult> {
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
    Stream<TestResult> Function(ChapterCompletionStatusRef provider) create,
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
  AutoDisposeStreamProviderElement<TestResult> createElement() {
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

mixin ChapterCompletionStatusRef on AutoDisposeStreamProviderRef<TestResult> {
  /// The parameter `chapter` of this provider.
  Chapter get chapter;
}

class _ChapterCompletionStatusProviderElement
    extends AutoDisposeStreamProviderElement<TestResult>
    with ChapterCompletionStatusRef {
  _ChapterCompletionStatusProviderElement(super.provider);

  @override
  Chapter get chapter => (origin as ChapterCompletionStatusProvider).chapter;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
