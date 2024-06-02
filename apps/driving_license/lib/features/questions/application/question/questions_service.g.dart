// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'questions_service.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$questionsServiceHash() => r'693fdcdca6f7d700cd85c90781dd94cbdbe0ecb3';

/// See also [questionsService].
@ProviderFor(questionsService)
final questionsServiceProvider = FutureProvider<QuestionsService>.internal(
  questionsService,
  name: r'questionsServiceProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$questionsServiceHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef QuestionsServiceRef = FutureProviderRef<QuestionsService>;
String _$currentQuestionsServiceModeHash() =>
    r'09796b481abf2edddf167d12c987c52369ff00df';

/// A provider that controls the current mode of the questions service.
///
/// Copied from [CurrentQuestionsServiceMode].
@ProviderFor(CurrentQuestionsServiceMode)
final currentQuestionsServiceModeProvider = NotifierProvider<
    CurrentQuestionsServiceMode, QuestionsServiceMode>.internal(
  CurrentQuestionsServiceMode.new,
  name: r'currentQuestionsServiceModeProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$currentQuestionsServiceModeHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$CurrentQuestionsServiceMode = Notifier<QuestionsServiceMode>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
