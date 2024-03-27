// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chapter_progress_service.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$chapterProgressServiceHash() =>
    r'94cb37937cb24c2f28cd535a7ea89e4b322858aa';

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

/// See also [chapterProgressService].
@ProviderFor(chapterProgressService)
const chapterProgressServiceProvider = ChapterProgressServiceFamily();

/// See also [chapterProgressService].
class ChapterProgressServiceFamily
    extends Family<AsyncValue<ChapterProgressService>> {
  /// See also [chapterProgressService].
  const ChapterProgressServiceFamily();

  /// See also [chapterProgressService].
  ChapterProgressServiceProvider call(
    Chapter chapter,
  ) {
    return ChapterProgressServiceProvider(
      chapter,
    );
  }

  @override
  ChapterProgressServiceProvider getProviderOverride(
    covariant ChapterProgressServiceProvider provider,
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
  String? get name => r'chapterProgressServiceProvider';
}

/// See also [chapterProgressService].
class ChapterProgressServiceProvider
    extends AutoDisposeFutureProvider<ChapterProgressService> {
  /// See also [chapterProgressService].
  ChapterProgressServiceProvider(
    Chapter chapter,
  ) : this._internal(
          (ref) => chapterProgressService(
            ref as ChapterProgressServiceRef,
            chapter,
          ),
          from: chapterProgressServiceProvider,
          name: r'chapterProgressServiceProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$chapterProgressServiceHash,
          dependencies: ChapterProgressServiceFamily._dependencies,
          allTransitiveDependencies:
              ChapterProgressServiceFamily._allTransitiveDependencies,
          chapter: chapter,
        );

  ChapterProgressServiceProvider._internal(
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
    FutureOr<ChapterProgressService> Function(
            ChapterProgressServiceRef provider)
        create,
  ) {
    return ProviderOverride(
      origin: this,
      override: ChapterProgressServiceProvider._internal(
        (ref) => create(ref as ChapterProgressServiceRef),
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
  AutoDisposeFutureProviderElement<ChapterProgressService> createElement() {
    return _ChapterProgressServiceProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is ChapterProgressServiceProvider && other.chapter == chapter;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, chapter.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin ChapterProgressServiceRef
    on AutoDisposeFutureProviderRef<ChapterProgressService> {
  /// The parameter `chapter` of this provider.
  Chapter get chapter;
}

class _ChapterProgressServiceProviderElement
    extends AutoDisposeFutureProviderElement<ChapterProgressService>
    with ChapterProgressServiceRef {
  _ChapterProgressServiceProviderElement(super.provider);

  @override
  Chapter get chapter => (origin as ChapterProgressServiceProvider).chapter;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
