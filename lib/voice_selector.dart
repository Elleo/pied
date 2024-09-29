import 'dart:io';
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as path;
import 'delete_dialog.dart';
import 'download_manager.dart';
import 'info_dialog.dart';
import 'templates.dart';
import 'voice_data.dart';
import 'utils.dart';
import 'confirmation_dialog.dart';

class VoiceSelector extends StatefulWidget {
  const VoiceSelector(
      {super.key,
      required this.onVoiceChanged,
      required this.onDownloadComplete});
  final VoidCallback onVoiceChanged;
  final VoidCallback onDownloadComplete;

  @override
  State<VoiceSelector> createState() => _VoiceSelectorState();
}

class _VoiceSelectorState extends State<VoiceSelector> {
  String selectedLanguage = "English (US)";
  List<String> downloadedModels = [];
  List<String> workingOn = [];
  final player = AudioPlayer();
  String currentVoice = "";
  int previewing = -1;
  String previewingLanguage = "English (US)";
  List<String> languages = voices.keys.toList();

  void findDownloads() async {
    final Directory appDir = await getDataDir();
    Directory modelDir = Directory(path.join(appDir.path, "models"));
    if (!modelDir.existsSync()) {
      modelDir.createSync();
    }
    modelDir.list().forEach((f) {
      String filename = path.basename(f.path);
      if (filename.endsWith(".onnx")) {
        setState(() {
          downloadedModels.add(filename);
        });
      }
    });
  }

  void restartSD() {
    if (isFlatpak()) {
      Process.runSync(
          "flatpak-spawn", ["--host", "killall", "speech-dispatcher"]);
    } else {
      Process.runSync("killall", ["speech-dispatcher"]);
    }
  }

  void getCurrentVoice() async {
    File modelConf = File(
        path.join(getHome()!, ".config/speech-dispatcher/modules/piper.conf"));
    if (modelConf.existsSync()) {
      String config = modelConf.readAsStringSync();
      RegExp re = RegExp("--model *(.*onnx) *");
      String? modelPath = re.firstMatch(config)?.group(1);
      if (modelPath != null) {
        setState(() {
          currentVoice = modelPath.split("/").last.trim();
        });
      }
      re = RegExp("AddVoice \"([^\"]+)\"");
      String? language = re.firstMatch(config)?.group(1);
      if (language != null && languageCodes.containsKey(language)) {
        setState(() {
          selectedLanguage = languageCodes[language]!;
          previewingLanguage = selectedLanguage;
        });
      }
    }
  }

  void setSDConfig() async {
    Directory confDir =
        Directory(path.join(getHome()!, ".config/speech-dispatcher"));
    Directory? originalConfigDir;
    if (confDir.existsSync()) {
      File sdConfig = File(path.join(confDir.path, "speechd.conf"));
      if (sdConfig.existsSync()) {
        if (sdConfig
            .readAsStringSync()
            .contains("THIS CONFIG WAS GENERATED BY PIED")) {
          return;
        }
      }
      DateTime now = DateTime.now();
      Directory newDir;
      if (isSnap()) {
        Directory origDir =
            Directory(path.join(getHome()!, ".config/speech-dispatcher.orig"));
        if (!origDir.existsSync()) {
          origDir.createSync();
        }
        newDir = Directory(
            "${confDir.path}.orig/${now.year}-${now.month}-${now.day}");
      } else {
        newDir = Directory(
            "${confDir.path}.orig.${now.year}-${now.month}-${now.day}");
      }
      if (newDir.existsSync()) {
        newDir.deleteSync(recursive: true);
      }
      confDir.renameSync(newDir.path);
      originalConfigDir = newDir;
    }
    confDir.createSync();
    Directory(path.join(confDir.path, "clients")).create();
    Directory(path.join(confDir.path, "modules")).create();
    File sdConfig = File(path.join(confDir.path, "speechd.conf"));
    sdConfig.createSync();
    sdConfig.writeAsString(sdConfigTemplate);
    restartSD();
    Timer(const Duration(seconds: 2), () {
      confirmConfigChange(originalConfigDir);
    });
  }

  Future<void> revertConfig(Directory? originalConfigDir) async {
    Directory confDir =
        Directory(path.join(getHome()!, ".config/speech-dispatcher"));
    confDir.deleteSync(recursive: true);
    if (originalConfigDir != null) {
      originalConfigDir.rename(confDir.path);
    }
    setState(() {
      currentVoice = "";
    });
    restartSD();
    Timer(const Duration(seconds: 2), () {
      showDialog<void>(
          context: context,
          barrierDismissible: false,
          builder: (BuildContext context) {
            return Semantics(
                label:
                    'Your previous speech dispatcher configuration has now been reinstated.',
                enabled: true,
                container: true,
                child: AlertDialog(
                    title:
                        const Text('Speech Dispatcher Configuration Reverted'),
                    content: const SingleChildScrollView(
                      child: ListBody(
                        children: <Widget>[
                          Text(
                              'Your previous speech dispatcher configuration has now been reinstated.')
                        ],
                      ),
                    ),
                    actions: <Widget>[
                      TextButton(
                        child: const Text('Okay'),
                        autofocus: true,
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      ),
                    ]));
          });
    });
  }

  Future<void> confirmConfigChange(Directory? originalConfigDir) async {
    return showDialog<void>(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return ConfirmationDialog(onRevert: () {
            revertConfig(originalConfigDir);
          });
        });
  }

  @override
  void initState() {
    super.initState();
    languages.sort();
    findDownloads();
    getCurrentVoice();
    player.onPlayerStateChanged.listen((event) {
      if (event != PlayerState.playing) {
        setState(() {
          previewing = -1;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        const Text("Select language:"),
        Semantics(
            label:
                "Select language, currently selected language is $selectedLanguage",
            enabled: true,
            container: true,
            child: DropdownButton<String>(
              value: selectedLanguage,
              icon: const Icon(Icons.arrow_downward),
              onChanged: (String? value) {
                setState(() {
                  selectedLanguage = value!;
                });
              },
              items: languages.map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Semantics(
                      enabled: true,
                      label: "Select language",
                      child: Text(value)),
                );
              }).toList(),
            )),
        const SizedBox(height: 32),
        Expanded(
            child: ListView.builder(
                itemCount: voices[selectedLanguage]?.length,
                itemBuilder: (BuildContext context, int index) {
                  String? voice =
                      voices[selectedLanguage]?.keys.elementAt(index);
                  DownloadManager downloadManager = DownloadManager();

                  return Padding(
                      padding: const EdgeInsets.fromLTRB(0, 4, 0, 4),
                      child: Row(children: [
                        voices[selectedLanguage]
                                    ?.entries
                                    .elementAt(index)
                                    .value[5] ==
                                ""
                            ? const SizedBox()
                            : Semantics(
                                label: currentVoice ==
                                        voices[selectedLanguage]
                                            ?.entries
                                            .elementAt(index)
                                            .value[4]
                                    ? "$voice is the currently selected voice. Preview $voice"
                                    : "Preview $voice",
                                enabled: true,
                                child: IconButton(
                                    onPressed: () async {
                                      if (previewing == index &&
                                          previewingLanguage ==
                                              selectedLanguage) {
                                        player.stop();
                                      } else {
                                        String? previewUrl =
                                            voices[selectedLanguage]
                                                ?.entries
                                                .elementAt(index)
                                                .value[5];
                                        if (previewUrl != null) {
                                          player.play(UrlSource(previewUrl));
                                          setState(() {
                                            previewing = index;
                                            previewingLanguage =
                                                selectedLanguage;
                                          });
                                        }
                                      }
                                    },
                                    icon: previewing == index &&
                                            previewingLanguage ==
                                                selectedLanguage
                                        ? const Icon(Icons.stop)
                                        : const Icon(Icons.play_arrow))),
                        const SizedBox(width: 32),
                        Text(voice!),
                        const Spacer(),
                        downloadedModels.contains(voices[selectedLanguage]
                                ?.entries
                                .elementAt(index)
                                .value[4])
                            ? currentVoice ==
                                    voices[selectedLanguage]
                                        ?.entries
                                        .elementAt(index)
                                        .value[4]
                                ? const SizedBox(
                                    height: 20,
                                    width: 99,
                                    child: Text("Current Voice"))
                                : Semantics(
                                    label: "Select $voice voice",
                                    enabled: true,
                                    child: ElevatedButton(
                                        onPressed: () async {
                                          setSDConfig();
                                          final Directory appDir =
                                              await getDataDir();
                                          Directory modelDir = Directory(
                                              path.join(appDir.path, "models"));
                                          File modelConf = File(path.join(
                                              getHome()!,
                                              ".config/speech-dispatcher/modules/piper.conf"));
                                          String configString = modelTemplate;
                                          MapEntry<String, List<String>> voice =
                                              voices[selectedLanguage]!
                                                  .entries
                                                  .elementAt(index);
                                          configString =
                                              configString.replaceAll(
                                                  "PIPER_PATH",
                                                  path.join(appDir.path,
                                                      "piper", "piper"));
                                          configString =
                                              configString.replaceAll(
                                                  "MODEL_PATH",
                                                  path.join(modelDir.path,
                                                      voice.value[4]));
                                          configString =
                                              configString.replaceAll(
                                                  "SAMPLE_RATE",
                                                  voice.value[0]);
                                          configString =
                                              configString.replaceAll(
                                                  "LANGUAGE", voice.value[1]);
                                          modelConf.writeAsString(configString);
                                          restartSD();
                                          setState(() {
                                            currentVoice = voice.value[4];
                                          });
                                          widget.onVoiceChanged();
                                        },
                                        child: const Text("Select Voice")))
                            : workingOn.contains(voices[selectedLanguage]
                                    ?.entries
                                    .elementAt(index)
                                    .value[3])
                                ? const SizedBox(
                                    height: 20,
                                    width: 94,
                                    child: LinearProgressIndicator())
                                : ValueListenableBuilder<double?>(
                                    valueListenable:
                                        downloadManager.progressNotifier,
                                    builder: (context, progress, child) {
                                      if (progress != null) {
                                        return SizedBox(
                                            height: 20,
                                            width: 94,
                                            child: LinearProgressIndicator(
                                                value: progress));
                                      } else {
                                        return Semantics(
                                            label: "Download $voice voice",
                                            enabled: true,
                                            child: ElevatedButton(
                                              child: const Text("Download"),
                                              onPressed: () async {
                                                String? downloadUrl =
                                                    voices[selectedLanguage]
                                                        ?.entries
                                                        .elementAt(index)
                                                        .value[2];
                                                String? downloadMetaUrl =
                                                    voices[selectedLanguage]
                                                        ?.entries
                                                        .elementAt(index)
                                                        .value[3];
                                                String modelFile =
                                                    voices[selectedLanguage]!
                                                        .entries
                                                        .elementAt(index)
                                                        .value[4];
                                                String filename =
                                                    "$modelFile.tar.gz";
                                                final Directory tempDir =
                                                    await getTemporaryDirectory();
                                                final String downloadPath =
                                                    path.join(
                                                        tempDir.path, filename);
                                                final Directory appDir =
                                                    await getDataDir();
                                                Directory modelDir = Directory(
                                                    path.join(
                                                        appDir.path, "models"));
                                                downloadManager.download(
                                                    downloadMetaUrl!,
                                                    File(
                                                        "${modelDir.path}/$modelFile.json"),
                                                    () {});
                                                downloadManager.download(
                                                    downloadUrl!,
                                                    File(
                                                        "${modelDir.path}/$modelFile"),
                                                    () async {
                                                  setState(() {
                                                    downloadedModels
                                                        .add(modelFile);
                                                  });
                                                  widget.onDownloadComplete();
                                                });
                                              },
                                            ));
                                      }
                                    }),
                        const SizedBox(width: 10),
                        voices[selectedLanguage]
                                    ?.entries
                                    .elementAt(index)
                                    .value[6] ==
                                ""
                            ? const SizedBox()
                            : Semantics(
                                label: "Information about $voice",
                                enabled: true,
                                child: IconButton(
                                    icon: const Icon(Icons.info),
                                    onPressed: () {
                                      showDialog<void>(
                                          context: context,
                                          barrierDismissible: false,
                                          builder: (BuildContext context) {
                                            return InfoDialog(
                                              modelName: voice,
                                              infoUri: Uri.parse(
                                                  voices[selectedLanguage]!
                                                      .entries
                                                      .elementAt(index)
                                                      .value[6]),
                                            );
                                          });
                                    })),
                        downloadedModels.contains(voices[selectedLanguage]
                                    ?.entries
                                    .elementAt(index)
                                    .value[4]) &&
                                currentVoice !=
                                    voices[selectedLanguage]
                                        ?.entries
                                        .elementAt(index)
                                        .value[4]
                            ? Semantics(
                                label: "Delete $voice",
                                enabled: true,
                                child: IconButton(
                                    icon: const Icon(Icons.delete),
                                    onPressed: () async {
                                      showDialog<void>(
                                          context: context,
                                          barrierDismissible: false,
                                          builder: (BuildContext context) {
                                            return DeleteDialog(
                                                onDelete: () async {
                                              String modelFile =
                                                  voices[selectedLanguage]!
                                                      .entries
                                                      .elementAt(index)
                                                      .value[4];
                                              final Directory appDir =
                                                  await getDataDir();
                                              Directory modelDir = Directory(
                                                  path.join(
                                                      appDir.path, "models"));
                                              File("${modelDir.path}/$modelFile.json")
                                                  .delete();
                                              File("${modelDir.path}/$modelFile")
                                                  .delete();
                                              setState(() {
                                                downloadedModels
                                                    .remove(modelFile);
                                              });
                                            });
                                          });
                                    }))
                            : const SizedBox(width: 34)
                      ]));
                })),
      ],
    );
  }
}
