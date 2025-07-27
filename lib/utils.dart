import 'dart:async';
import 'dart:io';
import 'package:path_provider/path_provider.dart';

String? getHome() {
  return Platform.environment.containsKey("SNAP_REAL_HOME")
      ? Platform.environment['SNAP_REAL_HOME']!
      : Platform.environment['HOME'];
}

Future<Directory> getDataDir() async {
  if (Platform.environment.containsKey("SNAP_USER_COMMON")) {
    return Future.value(Directory(Platform.environment['SNAP_USER_COMMON']!));
  }
  return getApplicationSupportDirectory();
}

bool isSnap() {
  return Platform.environment.containsKey("SNAP_REAL_HOME");
}

bool isFlatpak() {
  return Platform.environment.containsKey("FLATPAK_ID");
}

String getVersion() {
  return "0.3.1";
}
