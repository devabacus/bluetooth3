import 'package:flutter_blue_plus/flutter_blue_plus.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'scan_providers.g.dart';

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
