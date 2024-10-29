// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'logger_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$loggerHash() => r'11a26e818fa80f8f4c635b549569ed80797d8ed7';

/// Provides an instance of [Logger].
///
/// All errors, exceptions, and events in the app should be logged using this
/// [Logger] instance.
///
/// Copied from [logger].
@ProviderFor(logger)
final loggerProvider = Provider<Logger>.internal(
  logger,
  name: r'loggerProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$loggerHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef LoggerRef = ProviderRef<Logger>;
String _$errorLoggerHash() => r'b74f6e0b188fa5ffc7282c5d13ffa58613c5c0a9';

/// See also [errorLogger].
@ProviderFor(errorLogger)
final errorLoggerProvider = Provider<ErrorLogger>.internal(
  errorLogger,
  name: r'errorLoggerProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$errorLoggerHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef ErrorLoggerRef = ProviderRef<ErrorLogger>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
