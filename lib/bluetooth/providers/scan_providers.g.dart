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
String _$bleAdapterStateHash() => r'286f60d46f6b4a1aa9450b095d51e8e88f08f208';

/// See also [bleAdapterState].
@ProviderFor(bleAdapterState)
final bleAdapterStateProvider =
    AutoDisposeStreamProvider<BluetoothAdapterState>.internal(
      bleAdapterState,
      name: r'bleAdapterStateProvider',
      debugGetCreateSourceHash:
          const bool.fromEnvironment('dart.vm.product')
              ? null
              : _$bleAdapterStateHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef BleAdapterStateRef =
    AutoDisposeStreamProviderRef<BluetoothAdapterState>;
String _$scanResultsHash() => r'a2bcac3271c7a428a7c137d1d3d2caffb47c1eb7';

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
String _$selectedDeviceHash() => r'5a7c2b5a68d5e17f377a5001c92865cda88d7a8a';

/// See also [SelectedDevice].
@ProviderFor(SelectedDevice)
final selectedDeviceProvider =
    AutoDisposeNotifierProvider<SelectedDevice, BluetoothDevice?>.internal(
      SelectedDevice.new,
      name: r'selectedDeviceProvider',
      debugGetCreateSourceHash:
          const bool.fromEnvironment('dart.vm.product')
              ? null
              : _$selectedDeviceHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

typedef _$SelectedDevice = AutoDisposeNotifier<BluetoothDevice?>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
