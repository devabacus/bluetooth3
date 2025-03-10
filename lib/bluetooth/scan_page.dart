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

class CharPage extends ConsumerStatefulWidget {
  const CharPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _CharPageState();
}

class _CharPageState extends ConsumerState<CharPage> {
  final _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final rxChar = ref.watch(rxCharacteristicProvider);
    final txChar = ref.read(txCharacteristicProvider.notifier);

    return Scaffold(
      body: Center(
        child: SizedBox(
          width: MediaQuery.of(context).size.width*0.8,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              rxChar.when(
                data:
                    (val) => Text(
                      String.fromCharCodes(val),
                      style: TextStyle(fontSize: 30),
                    ),
                error: (_, __) => Text("Error"),
                loading: () => CircularProgressIndicator(),
              ),
              TextField(controller: _controller, decoration: InputDecoration(),),
              SizedBox(height: 30,),
              ElevatedButton(
                onPressed: () {
                  String msg = _controller.text.trim();
                  txChar.writeToTx(msg);
                },
                child: Text("отправить"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
