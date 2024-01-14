import 'dart:async';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:pied/utils.dart';
import 'package:system_info2/system_info2.dart';
import 'package:path/path.dart' as path;
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:yaru/yaru.dart';
import 'package:xdg_desktop_portal/xdg_desktop_portal.dart';
import 'package:http/http.dart' as http;
import 'package:url_launcher/url_launcher.dart';

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
      home: Builder(
        builder: (context) => const YaruTheme(
          child: MainPage(),
        ),
      ),
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
  bool updateAvailable = false;
  String title = "Piper Installation";
  FlutterLocalNotificationsPlugin notification =
      FlutterLocalNotificationsPlugin();

  void checkForPiper() async {
    final Directory appDir = await getDataDir();
    Directory piperDir = Directory(path.join(appDir.path, "piper"));
    setState(() {
      piperPresent = piperDir.existsSync();
      if (piperPresent) {
        title = "Voice Selection";
      }
    });
  }

  void checkForUpdate() {
    Future<http.Response> response =
        http.get(Uri.parse('https://pied.mikeasoft.com/version'));
    response.then((value) {
      setState(() {
        updateAvailable = value.body.trim() != getVersion();
      });
    });
  }

  @override
  void initState() {
    super.initState();
    const LinuxInitializationSettings initializationSettingsLinux =
        LinuxInitializationSettings(defaultActionName: "Open");
    const InitializationSettings initializationSettings =
        InitializationSettings(linux: initializationSettingsLinux);
    notification.initialize(initializationSettings);

    if (!isSnap()) {
      checkForUpdate();
    }
    checkForPiper();
  }

  void showNotification(String message) {
    if (isFlatpak()) {
      var client = XdgDesktopPortalClient();
      client.notification
          .addNotification("com.mikeasoft.pied", title: "Pied", body: message);
    } else {
      const LinuxNotificationDetails linuxNotificationDetails =
          LinuxNotificationDetails();
      const NotificationDetails notificationDetails =
          NotificationDetails(linux: linuxNotificationDetails);
      notification.show(0, "Pied", message, notificationDetails);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Text(title),
            actions: const [Image(image: AssetImage("assets/icon-cut.png"))]),
        bottomNavigationBar: BottomAppBar(
            height: 36,
            padding: EdgeInsets.zero,
            child: Align(
                alignment: Alignment.topRight,
                child: updateAvailable
                    ? Row(children: [
                        const Spacer(),
                        Text("Version: ${getVersion()}"),
                        TextButton(
                            child: const Text("Update Available"),
                            onPressed: () {
                              launch("https://pied.mikeasoft.com/#download");
                            })
                      ])
                    : Padding(
                        padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
                        child: Text("Version: ${getVersion()}")))),
        body: Padding(
          padding: const EdgeInsets.fromLTRB(40, 40, 40, 0),
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
                          ? VoiceSelector(onVoiceChanged: () {
                              // Give time for speech-dispatcher to restart
                              Timer(const Duration(seconds: 2), () {
                                showNotification(
                                    "Your new voice has now been activated!");
                              });
                            }, onDownloadComplete: () {
                              showNotification("Voice download complete.");
                            })
                          : PiperInstaller(onInstallationComplete: () {
                              showNotification(
                                  "Piper installation complete. You can now download and select voices.");
                              checkForPiper();
                            })),
        ));
  }
}
