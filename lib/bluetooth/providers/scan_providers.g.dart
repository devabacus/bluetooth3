// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'scan_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$adapterStateHash() => r'e558cadae25b2d629876da5a2175a9e1731b4d34';

/// See also [adapterState].
@ProviderFor(adapterState)
final adapterStateProvider =
    AutoDisposeStreamProvider<BluetoothAdapterState>.internal(
      adapterState,
      name: r'adapterStateProvider',
      debugGetCreateSourceHash:
          const bool.fromEnvironment('dart.vm.product')
              ? null
              : _$adapterStateHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef AdapterStateRef = AutoDisposeStreamProviderRef<BluetoothAdapterState>;
String _$scanResultsHash() => r'7c23b1d3cf22dd0c50526e409f098b244b8eb26e';

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
