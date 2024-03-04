// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'answer_card_list.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$selectedAnswerIndexHash() =>
    r'3cbfa34f79dd609fd1c294e50e30182ead864b51';

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

abstract class _$SelectedAnswerIndex
    extends BuildlessAutoDisposeNotifier<int?> {
  late final int questionPageIndex;

  int? build(
    int questionPageIndex,
  );
}

/// See also [SelectedAnswerIndex].
@ProviderFor(SelectedAnswerIndex)
const selectedAnswerIndexProvider = SelectedAnswerIndexFamily();

/// See also [SelectedAnswerIndex].
class SelectedAnswerIndexFamily extends Family<int?> {
  /// See also [SelectedAnswerIndex].
  const SelectedAnswerIndexFamily();

  /// See also [SelectedAnswerIndex].
  SelectedAnswerIndexProvider call(
    int questionPageIndex,
  ) {
    return SelectedAnswerIndexProvider(
      questionPageIndex,
    );
  }

  @override
  SelectedAnswerIndexProvider getProviderOverride(
    covariant SelectedAnswerIndexProvider provider,
  ) {
    return call(
      provider.questionPageIndex,
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
  String? get name => r'selectedAnswerIndexProvider';
}

/// See also [SelectedAnswerIndex].
class SelectedAnswerIndexProvider
    extends AutoDisposeNotifierProviderImpl<SelectedAnswerIndex, int?> {
  /// See also [SelectedAnswerIndex].
  SelectedAnswerIndexProvider(
    int questionPageIndex,
  ) : this._internal(
          () => SelectedAnswerIndex()..questionPageIndex = questionPageIndex,
          from: selectedAnswerIndexProvider,
          name: r'selectedAnswerIndexProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$selectedAnswerIndexHash,
          dependencies: SelectedAnswerIndexFamily._dependencies,
          allTransitiveDependencies:
              SelectedAnswerIndexFamily._allTransitiveDependencies,
          questionPageIndex: questionPageIndex,
        );

  SelectedAnswerIndexProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.questionPageIndex,
  }) : super.internal();

  final int questionPageIndex;

  @override
  int? runNotifierBuild(
    covariant SelectedAnswerIndex notifier,
  ) {
    return notifier.build(
      questionPageIndex,
    );
  }

  @override
  Override overrideWith(SelectedAnswerIndex Function() create) {
    return ProviderOverride(
      origin: this,
      override: SelectedAnswerIndexProvider._internal(
        () => create()..questionPageIndex = questionPageIndex,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        questionPageIndex: questionPageIndex,
      ),
    );
  }

  @override
  AutoDisposeNotifierProviderElement<SelectedAnswerIndex, int?>
      createElement() {
    return _SelectedAnswerIndexProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is SelectedAnswerIndexProvider &&
        other.questionPageIndex == questionPageIndex;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, questionPageIndex.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin SelectedAnswerIndexRef on AutoDisposeNotifierProviderRef<int?> {
  /// The parameter `questionPageIndex` of this provider.
  int get questionPageIndex;
}

class _SelectedAnswerIndexProviderElement
    extends AutoDisposeNotifierProviderElement<SelectedAnswerIndex, int?>
    with SelectedAnswerIndexRef {
  _SelectedAnswerIndexProviderElement(super.provider);

  @override
  int get questionPageIndex =>
      (origin as SelectedAnswerIndexProvider).questionPageIndex;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
