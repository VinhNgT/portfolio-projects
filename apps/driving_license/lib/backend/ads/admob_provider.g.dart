// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'admob_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$rewardedAdHash() => r'e0bab8c52db32b6e9e9201cbb8546811f03eb010';

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

/// See also [rewardedAd].
@ProviderFor(rewardedAd)
const rewardedAdProvider = RewardedAdFamily();

/// See also [rewardedAd].
class RewardedAdFamily extends Family<RewardedAd?> {
  /// See also [rewardedAd].
  const RewardedAdFamily();

  /// See also [rewardedAd].
  RewardedAdProvider call(
    AdUnit adUnit,
  ) {
    return RewardedAdProvider(
      adUnit,
    );
  }

  @override
  RewardedAdProvider getProviderOverride(
    covariant RewardedAdProvider provider,
  ) {
    return call(
      provider.adUnit,
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
  String? get name => r'rewardedAdProvider';
}

/// See also [rewardedAd].
class RewardedAdProvider extends AutoDisposeProvider<RewardedAd?> {
  /// See also [rewardedAd].
  RewardedAdProvider(
    AdUnit adUnit,
  ) : this._internal(
          (ref) => rewardedAd(
            ref as RewardedAdRef,
            adUnit,
          ),
          from: rewardedAdProvider,
          name: r'rewardedAdProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$rewardedAdHash,
          dependencies: RewardedAdFamily._dependencies,
          allTransitiveDependencies:
              RewardedAdFamily._allTransitiveDependencies,
          adUnit: adUnit,
        );

  RewardedAdProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.adUnit,
  }) : super.internal();

  final AdUnit adUnit;

  @override
  Override overrideWith(
    RewardedAd? Function(RewardedAdRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: RewardedAdProvider._internal(
        (ref) => create(ref as RewardedAdRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        adUnit: adUnit,
      ),
    );
  }

  @override
  AutoDisposeProviderElement<RewardedAd?> createElement() {
    return _RewardedAdProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is RewardedAdProvider && other.adUnit == adUnit;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, adUnit.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin RewardedAdRef on AutoDisposeProviderRef<RewardedAd?> {
  /// The parameter `adUnit` of this provider.
  AdUnit get adUnit;
}

class _RewardedAdProviderElement extends AutoDisposeProviderElement<RewardedAd?>
    with RewardedAdRef {
  _RewardedAdProviderElement(super.provider);

  @override
  AdUnit get adUnit => (origin as RewardedAdProvider).adUnit;
}

String _$bannerAdHash() => r'47972516e4c865ae13afca5fc45bfea91505da32';

/// See also [bannerAd].
@ProviderFor(bannerAd)
const bannerAdProvider = BannerAdFamily();

/// See also [bannerAd].
class BannerAdFamily extends Family<BannerAd?> {
  /// See also [bannerAd].
  const BannerAdFamily();

  /// See also [bannerAd].
  BannerAdProvider call(
    AdUnit adUnit,
  ) {
    return BannerAdProvider(
      adUnit,
    );
  }

  @override
  BannerAdProvider getProviderOverride(
    covariant BannerAdProvider provider,
  ) {
    return call(
      provider.adUnit,
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
  String? get name => r'bannerAdProvider';
}

/// See also [bannerAd].
class BannerAdProvider extends AutoDisposeProvider<BannerAd?> {
  /// See also [bannerAd].
  BannerAdProvider(
    AdUnit adUnit,
  ) : this._internal(
          (ref) => bannerAd(
            ref as BannerAdRef,
            adUnit,
          ),
          from: bannerAdProvider,
          name: r'bannerAdProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$bannerAdHash,
          dependencies: BannerAdFamily._dependencies,
          allTransitiveDependencies: BannerAdFamily._allTransitiveDependencies,
          adUnit: adUnit,
        );

  BannerAdProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.adUnit,
  }) : super.internal();

  final AdUnit adUnit;

  @override
  Override overrideWith(
    BannerAd? Function(BannerAdRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: BannerAdProvider._internal(
        (ref) => create(ref as BannerAdRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        adUnit: adUnit,
      ),
    );
  }

  @override
  AutoDisposeProviderElement<BannerAd?> createElement() {
    return _BannerAdProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is BannerAdProvider && other.adUnit == adUnit;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, adUnit.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin BannerAdRef on AutoDisposeProviderRef<BannerAd?> {
  /// The parameter `adUnit` of this provider.
  AdUnit get adUnit;
}

class _BannerAdProviderElement extends AutoDisposeProviderElement<BannerAd?>
    with BannerAdRef {
  _BannerAdProviderElement(super.provider);

  @override
  AdUnit get adUnit => (origin as BannerAdProvider).adUnit;
}

String _$adMobControllerHash() => r'd57a738ff78e0e20f5f52805c92ddb2426b66ddf';

/// See also [AdMobController].
@ProviderFor(AdMobController)
final adMobControllerProvider =
    NotifierProvider<AdMobController, Map<AdUnit, Ad>>.internal(
  AdMobController.new,
  name: r'adMobControllerProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$adMobControllerHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$AdMobController = Notifier<Map<AdUnit, Ad>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
