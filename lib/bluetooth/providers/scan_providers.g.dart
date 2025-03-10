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
String _$selectedDeviceHash() => r'3a7cbe14b328494e31c8b7f1fd9f55b368a94ae1';

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
String _$rxCharacteristicHash() => r'ad24f7530ff2c57aef1d65537323d7b7853ac3c4';

/// See also [RxCharacteristic].
@ProviderFor(RxCharacteristic)
final rxCharacteristicProvider =
    AutoDisposeStreamNotifierProvider<RxCharacteristic, List<int>>.internal(
      RxCharacteristic.new,
      name: r'rxCharacteristicProvider',
      debugGetCreateSourceHash:
          const bool.fromEnvironment('dart.vm.product')
              ? null
              : _$rxCharacteristicHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

typedef _$RxCharacteristic = AutoDisposeStreamNotifier<List<int>>;
String _$txCharacteristicHash() => r'8d86250f5ded7d4fe3875e3cd122945491b2f266';

/// See also [TxCharacteristic].
@ProviderFor(TxCharacteristic)
final txCharacteristicProvider = AutoDisposeNotifierProvider<
  TxCharacteristic,
  BluetoothCharacteristic?
>.internal(
  TxCharacteristic.new,
  name: r'txCharacteristicProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$txCharacteristicHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$TxCharacteristic = AutoDisposeNotifier<BluetoothCharacteristic?>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
