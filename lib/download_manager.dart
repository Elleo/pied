import 'dart:io';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

class DownloadManager {
  final progressNotifier = ValueNotifier<double?>(null);

  void download(String url, File file, VoidCallback onFinished) async {
    progressNotifier.value = null;

    final request = Request('GET', Uri.parse(url));
    final StreamedResponse response = await Client().send(request);

    final contentLength = response.contentLength;
    progressNotifier.value = 0;

    List<int> bytes = [];

    response.stream.listen(
      (List<int> newBytes) {
        bytes.addAll(newBytes);
        final downloadedLength = bytes.length;
        progressNotifier.value = downloadedLength / contentLength!;
      },
      onDone: () async {
        progressNotifier.value = null;
        await file.writeAsBytes(bytes);
        onFinished();
      },
      onError: (e) {
        debugPrint(e);
      },
      cancelOnError: true,
    );
  }
}
