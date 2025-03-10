import 'package:bluetooth3/bluetooth/providers/scan_providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


class ScanPage extends ConsumerStatefulWidget {
  const ScanPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ScannerPageState();
}

class _ScannerPageState extends ConsumerState<ScanPage> {

    final scanResults = ref.watch(scanResultsProvider);
    final scanController = ref.read(scanResultsProvider.notifier);


  @override
  Widget build(BuildContext context) {
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
                    onTap: () => print('${device.advName} connected'),
                  );
                },
              ),
          error: (_, __) => Center(child: Text("Ошибка")),
          loading: () => CircularProgressIndicator(),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: scanController.startScan,
        child: Icon(Icons.scanner),
      ),
    );
  }
}