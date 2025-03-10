// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'scan_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$requestBlePermissionsHash() =>
    r'd1dbca468b40c90620f6514964d7bf1d79a051b7';

/// See also [requestBlePermissions].
@ProviderFor(requestBlePermissions)
final requestBlePermissionsProvider = AutoDisposeFutureProvider<void>.internal(
  requestBlePermissions,
  name: r'requestBlePermissionsProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$requestBlePermissionsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef RequestBlePermissionsRef = AutoDisposeFutureProviderRef<void>;
String _$scanResultsHash() => r'9fd449b1af26b6ee91737dff5d5156c69ae7743e';

/// See also [ScanResults].
@ProviderFor(ScanResults)
final scanResultsProvider =
    AutoDisposeStreamNotifierProvider<ScanResults, List<ScanResult>>.internal(
      ScanResults.new,
      name: r'scanResultsProvider',
      debugGetCreateSourceHash:
          const bool.fromEnvironment('dart.vm.product')
              ? null
              : _$scanResultsHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

typedef _$ScanResults = AutoDisposeStreamNotifier<List<ScanResult>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
