import 'package:flutter/cupertino.dart';
import 'package:flutter_blue_plus/flutter_blue_plus.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
class SavedDevice extends _$SavedDevice {
  @override
  FutureOr<String> build() async {
    final pref = await SharedPreferences.getInstance();
    return pref.getString('remoteId') ?? "";
  }

  Future<bool> saveDevice(String remoteId) async {
    final pref = await SharedPreferences.getInstance();
    state = AsyncData(remoteId);
    return await pref.setString('remoteId', remoteId);
  }
}


@riverpod
class SelectedDevice extends _$SelectedDevice {
  @override
  BluetoothDevice? build() {
    return null;
  }

  Future<void> _connectToDevice(BluetoothDevice device) async {
    
    await device.connect(autoConnect: true);
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
      final txCharProvider = ref.read(txCharacteristicProvider.notifier);
      rxCharProvider.setChar(chars['rx']!);
      txCharProvider.setChar(chars['tx']!);
    }
      state = device;

  }

  Future<void> selectDevice(BluetoothDevice device) async {
    

    _connectToDevice(device);

    final savedDevice = ref.read(savedDeviceProvider.notifier);
    savedDevice.saveDevice(device.remoteId.toString());
  }

  Future<void> connectToSavedDevice() async {

    final remoteId = await ref.read(savedDeviceProvider.future);
    final device = BluetoothDevice.fromId(remoteId);
    if (remoteId.isEmpty) {
      return;
    }
    try {
        _connectToDevice(device);
        
    } catch (e) {
        print('$e error');
    }
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
    return _char?.onValueReceived ?? Stream.value([]);
  }

  void setChar(BluetoothCharacteristic char) {
    _char = char;
    _char!.setNotifyValue(true);

    ref.invalidateSelf();
  }
}

@riverpod
class TxCharacteristic extends _$TxCharacteristic {
  @override
  BluetoothCharacteristic? build() {
    ref.keepAlive();

    return null;
  }

  void setChar(BluetoothCharacteristic char) {
    state = char;
  }

  Future<void> writeToTx(String val) async {
    await state!.write(val.codeUnits);
  }
}
