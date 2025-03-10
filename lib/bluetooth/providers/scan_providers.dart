import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_blue_plus/flutter_blue_plus.dart';
import 'package:permission_handler/permission_handler.dart';

part 'scan_providers.g.dart';


@riverpod
Stream<BluetoothAdapterState> adapterState(Ref ref) {
  return FlutterBluePlus.adapterState;
}


@riverpod
class ScanResults extends _$ScanResults {
  @override
  Stream<List<ScanResult>> build() {
    return FlutterBluePlus.onScanResults;
  }

  Future<void> startScan() async {
      FlutterBluePlus.startScan();
  }
}





