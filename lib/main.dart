import 'dart:io';

import 'package:flutter/material.dart';
import 'package:system_info2/system_info2.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as path;

import 'download_manager.dart';
import 'piper_installer.dart';
import 'voice_selector.dart';
import 'data.dart';

void main() {
  runApp(const PiedApp());
}

class PiedApp extends StatelessWidget {
  const PiedApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pied',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
      ),
      home: const MainPage(),
    );
  }
}

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final downloadManager = DownloadManager();
  bool piperPresent = false;
  String title = "Piper Installation";

  void checkForPiper() async {
    final Directory appDir = await getApplicationSupportDirectory();
    Directory piperDir = Directory(path.join(appDir.path, "piper"));
    setState(() {
      piperPresent = piperDir.existsSync();
      if (piperPresent) {
        title = "Voice Selection";
      }
    });
  }

  @override
  void initState() {
    super.initState();
    checkForPiper();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: Padding(
          padding: const EdgeInsets.all(40),
          child: Center(
              child:
                  !supportedArchitectures.contains(SysInfo.kernelArchitecture)
                      ? Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                              const Spacer(),
                              Text(
                                "Sorry, your system architecture (${SysInfo.kernelArchitecture}) isn't currently supported",
                              ),
                              const Spacer(),
                            ])
                      : piperPresent
                          ? const VoiceSelector()
                          : PiperInstaller(onInstallationComplete: () {
                              checkForPiper();
                            })),
        ));
  }
}
