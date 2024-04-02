// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'exams_service.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$examsServiceHash() => r'fc1c7a9c90de74c65565aeb0899451e4e139164b';

/// See also [examsService].
@ProviderFor(examsService)
final examsServiceProvider = FutureProvider<ExamsService>.internal(
  examsService,
  name: r'examsServiceProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$examsServiceHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef ExamsServiceRef = FutureProviderRef<ExamsService>;
String _$examsListStreamHash() => r'fdd0a6f107fcf0f10a288615dfaf9b169989e2df';

/// See also [examsListStream].
@ProviderFor(examsListStream)
final examsListStreamProvider = AutoDisposeStreamProvider<List<Exam>>.internal(
  examsListStream,
  name: r'examsListStreamProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$examsListStreamHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef ExamsListStreamRef = AutoDisposeStreamProviderRef<List<Exam>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
