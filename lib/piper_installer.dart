import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:system_info2/system_info2.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as path;
import 'package:posix/posix.dart';

import 'extract.dart';
import 'download_manager.dart';
import 'data.dart';

class PiperInstaller extends StatefulWidget {
  const PiperInstaller({super.key, required this.onInstallationComplete});
  final VoidCallback onInstallationComplete;

  @override
  State<PiperInstaller> createState() => _PiperInstallerState();
}

class _PiperInstallerState extends State<PiperInstaller> {
  final downloadManager = DownloadManager();
  bool installing = false;
  bool unpacking = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          installing
              ? (unpacking ? "Unpacking..." : "Downloading Piper...")
              : 'Piper is not currently installed. Press the button to download and install it for this user.',
        ),
        const SizedBox(height: 32),
        installing
            ? ValueListenableBuilder<double?>(
                valueListenable: downloadManager.progressNotifier,
                builder: (context, progress, child) {
                  return LinearProgressIndicator(value: progress);
                })
            : ElevatedButton(
                onPressed: () async {
                  setState(() {
                    installing = true;
                  });
                  final Directory tempDir = await getTemporaryDirectory();
                  final String downloadPath =
                      path.join(tempDir.path, "piper.tar.gz");
                  downloadManager.download(
                      downloadUrls[SysInfo.kernelArchitecture]!,
                      File(downloadPath), () async {
                    setState(() {
                      unpacking = true;
                    });

                    final Directory appDir =
                        await getApplicationSupportDirectory();
                    Map<String, dynamic> params = {
                      "archive": downloadPath,
                      "destination": appDir.path
                    };
                    await compute(extract, params);
                    setState(() {
                      unpacking = false;
                      installing = false;
                    });
                    // Make piper executable
                    chmod(path.join(appDir.path, "piper", "piper"), "755");
                    widget.onInstallationComplete();
                  });
                },
                child: Semantics(
                    label:
                        "Piper is not currently installed. Press to download and install Piper for this user.",
                    enabled: true,
                    child: const Text('Install Piper'))),
      ],
    );
  }
}
