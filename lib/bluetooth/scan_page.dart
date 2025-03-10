import 'package:bluetooth3/bluetooth/providers/scan_providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ScanPage extends ConsumerStatefulWidget {
  const ScanPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ScannerPageState();
}

class _ScannerPageState extends ConsumerState<ScanPage> {
  @override
  void initState() {
    _startScan();
    super.initState();
  }

  Future<void> _startScan() async {
    final scanController = ref.read(scanResultsProvider.notifier);
    await scanController.startScan();
  }

  @override
  Widget build(BuildContext context) {
    final scanResults = ref.watch(scanResultsProvider);
    final scanController = ref.read(scanResultsProvider.notifier);
    final selectedDevice = ref.read(selectedDeviceProvider.notifier);

    return Scaffold(
      body: Center(
        child: scanResults.when(
          data:
              (results) => ListView.builder(
                itemCount: results.length,
                itemBuilder: (context, index) {
                  final scanResult = results[index];
                  final device = scanResult.device;
                  final deviceName =
                      device.advName.isEmpty
                          ? "Неизвестное устройство"
                          : device.advName;

                  return ListTile(
                    title: Text(deviceName),
                    subtitle: Text("${device.remoteId}"),
                    trailing: Text("${scanResult.rssi}"),
                    // onTap: () => selectedDevice.selectDevice(device),
                    onTap: () {
                       selectedDevice.selectDevice(device);
                      Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => CharPage()),
                      );
                    },
                  );
                },
              ),
          error: (_, __) => Center(child: Text("Ошибка")),
          loading: () => CircularProgressIndicator(),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: scanController.startScan,
        child: Icon(Icons.update),
      ),
    );
  }
}

class CharPage extends ConsumerWidget {
  const CharPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final rxChar = ref.watch(rxCharacteristicProvider);

    return Scaffold(
      body: Center(
        child: rxChar.when(
          data: (val) => Text(String.fromCharCodes(val), style: TextStyle(fontSize: 30),),
          error: (_, __) => Text("Error"),
          loading: () => CircularProgressIndicator(),
        ),
      ),
    );
  }
}
