import 'package:flutter/cupertino.dart';
import 'package:flutter_blue_plus/flutter_blue_plus.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'scan_providers.g.dart';

class BleUuids {
  static const String serviceUuid = "6e400001-b5a3-f393-e0a9-e50e24dcca9e";
  static const String txChar = "6e400002-b5a3-f393-e0a9-e50e24dcca9e";
  static const String rxChar = "6e400003-b5a3-f393-e0a9-e50e24dcca9e";
}

@riverpod
Future<void> requestBlePermissions(Ref ref) async {
  await Permission.bluetoothScan.request();
  await Permission.bluetoothConnect.request();
  await Permission.location.request();
}

@riverpod
Stream<BluetoothAdapterState> bleAdapterState(Ref ref) {
  return FlutterBluePlus.adapterState;
}

@riverpod
class ScanResults extends _$ScanResults {
  @override
  Stream<List<ScanResult>> build() {
    ref.watch(requestBlePermissionsProvider);
    return FlutterBluePlus.scanResults;
  }

  Future<void> startScan() async {
    try {
      FlutterBluePlus.startScan(timeout: Duration(seconds: 10));
    } catch (e) {
      print("Ошибка сканирования $e");
    }
  }
}

@riverpod
class SelectedDevice extends _$SelectedDevice {
  @override
  BluetoothDevice? build() {
    return null;
  }

  void selectDevice(BluetoothDevice device) async {
    await device.connect();
    final services = await device.discoverServices();
    BluetoothService? service;
    try {
      service = services.firstWhere(
        (service) =>
            service.serviceUuid.toString().toLowerCase() ==
            BleUuids.serviceUuid.toLowerCase(),
      );
    } catch (e) {
      print("wrong device");
    }
    if (service != null) {
      final chars = getCharacteristic(service);
      final rxCharProvider = ref.read(rxCharacteristicProvider.notifier);
      rxCharProvider.setChar(chars['rx']);
    }

    state = device;
  }

  Map<String, BluetoothCharacteristic> getCharacteristic(
    BluetoothService service,
  ) {
    final charList = service.characteristics;
    BluetoothCharacteristic? rx;
    BluetoothCharacteristic? tx;
    for (var char in charList) {
      if (char.uuid.toString().toLowerCase() == BleUuids.rxChar.toLowerCase()) {
        rx = char;
      }
      if (char.uuid.toString().toLowerCase() == BleUuids.txChar.toLowerCase()) {
        tx = char;
      }
    }

    return {'rx': rx!, 'tx': tx!};
  }
}

@riverpod
class RxCharacteristic extends _$RxCharacteristic {
  BluetoothCharacteristic? _char;
  @override
  Stream<List<int>> build() {
    return _char?.onValueReceived??Stream.value([]);
  }

  void setChar(BluetoothCharacteristic char) {
    _char = char;
    state = char.onValueReceived;
  }
}
