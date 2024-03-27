// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chapter_progress_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$chapterCompletionStatusHash() =>
    r'6556d51f8d895395b4021e2fa18b76b21b211733';

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

String _$lastQuestionPageIndexVisitedHash() =>
    r'd5b79bb2a3289faaf2f276a81d712d7b7b52e73e';

/// See also [lastQuestionPageIndexVisited].
@ProviderFor(lastQuestionPageIndexVisited)
const lastQuestionPageIndexVisitedProvider =
    LastQuestionPageIndexVisitedFamily();

/// See also [lastQuestionPageIndexVisited].
class LastQuestionPageIndexVisitedFamily extends Family<AsyncValue<int>> {
  /// See also [lastQuestionPageIndexVisited].
  const LastQuestionPageIndexVisitedFamily();

  /// See also [lastQuestionPageIndexVisited].
  LastQuestionPageIndexVisitedProvider call(
    Chapter chapter,
  ) {
    return LastQuestionPageIndexVisitedProvider(
      chapter,
    );
  }

  @override
  LastQuestionPageIndexVisitedProvider getProviderOverride(
    covariant LastQuestionPageIndexVisitedProvider provider,
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
  String? get name => r'lastQuestionPageIndexVisitedProvider';
}

/// See also [lastQuestionPageIndexVisited].
class LastQuestionPageIndexVisitedProvider
    extends AutoDisposeFutureProvider<int> {
  /// See also [lastQuestionPageIndexVisited].
  LastQuestionPageIndexVisitedProvider(
    Chapter chapter,
  ) : this._internal(
          (ref) => lastQuestionPageIndexVisited(
            ref as LastQuestionPageIndexVisitedRef,
            chapter,
          ),
          from: lastQuestionPageIndexVisitedProvider,
          name: r'lastQuestionPageIndexVisitedProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$lastQuestionPageIndexVisitedHash,
          dependencies: LastQuestionPageIndexVisitedFamily._dependencies,
          allTransitiveDependencies:
              LastQuestionPageIndexVisitedFamily._allTransitiveDependencies,
          chapter: chapter,
        );

  LastQuestionPageIndexVisitedProvider._internal(
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
    FutureOr<int> Function(LastQuestionPageIndexVisitedRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: LastQuestionPageIndexVisitedProvider._internal(
        (ref) => create(ref as LastQuestionPageIndexVisitedRef),
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
    return _LastQuestionPageIndexVisitedProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is LastQuestionPageIndexVisitedProvider &&
        other.chapter == chapter;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, chapter.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin LastQuestionPageIndexVisitedRef on AutoDisposeFutureProviderRef<int> {
  /// The parameter `chapter` of this provider.
  Chapter get chapter;
}

class _LastQuestionPageIndexVisitedProviderElement
    extends AutoDisposeFutureProviderElement<int>
    with LastQuestionPageIndexVisitedRef {
  _LastQuestionPageIndexVisitedProviderElement(super.provider);

  @override
  Chapter get chapter =>
      (origin as LastQuestionPageIndexVisitedProvider).chapter;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
