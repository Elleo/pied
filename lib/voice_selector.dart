import 'dart:io';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:pied/voice_buttons.dart';
import 'package:pied/voice_label.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:path/path.dart' as path;
import 'download_manager.dart';
import 'voice_data.dart';
import 'utils.dart';

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
  String selectedLanguage = "English - US";
  List<String> downloadedModels = [];
  final player = AudioPlayer();
  String currentVoice = "";
  int previewing = -1;
  String previewingLanguage = "English - US";
  List<String> languages = voices.keys.toList();
  Map<dynamic, dynamic> selectedSubVoice = {};
  int currentSubVoice = 0;
  Map<String, DownloadManager> downloadManagers = {};

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
      re = RegExp("-s (\\d+)");
      String? subVoice = re.firstMatch(config)?.group(1);
      if (subVoice != null) {
        setState(() {
          currentSubVoice = int.parse(subVoice);
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

  void getSubVoiceSelection() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? subvoices = prefs.getString("subvoices");
    if (subvoices != null) {
      setState(() {
        selectedSubVoice = jsonDecode(subvoices);
      });
    }
  }

  void saveSubVoiceSelection() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("subvoices", jsonEncode(selectedSubVoice));
  }

  @override
  void initState() {
    super.initState();
    languages.sort();
    findDownloads();
    getCurrentVoice();
    getSubVoiceSelection();
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
                  return LayoutBuilder(builder:
                      (BuildContext context, BoxConstraints constraints) {
                    String? voiceId =
                        voices[selectedLanguage]?.keys.elementAt(index);
                    if (voiceId == null) {
                      return const SizedBox();
                    }
                    DownloadManager downloadManager =
                        downloadManagers[voiceId] ?? DownloadManager();
                    downloadManagers[voiceId] = downloadManager;
                    Map<dynamic, dynamic> subvoices = voices[selectedLanguage]
                        ?.entries
                        .elementAt(index)
                        .value[7];
                    MapEntry<String, List<dynamic>> voice =
                        voices[selectedLanguage]!.entries.elementAt(index);

                    List<Widget> voiceWidgets = [
                      VoiceLabel(
                          voiceId: voiceId,
                          voiceData: voice.value,
                          subvoices: subvoices,
                          currentVoice: currentVoice,
                          player: player,
                          onSubVoiceChanged: (subVoice) {
                            setState(() {
                              selectedSubVoice[voiceId] = subVoice;
                            });
                            saveSubVoiceSelection();
                          }),
                      const Spacer(),
                      const SizedBox(width: 10),
                      Align(
                          alignment: Alignment.centerRight,
                          child: SizedBox(
                              width: 190,
                              child: VoiceButtons(
                                  voiceId: voiceId,
                                  voiceData: voice.value,
                                  currentVoice: currentVoice,
                                  currentSubVoice: currentSubVoice,
                                  selectedSubVoice:
                                      selectedSubVoice[voiceId] ?? 0,
                                  downloadedModels: downloadedModels,
                                  downloadManager: downloadManager,
                                  onDownloadComplete: () {
                                    widget.onDownloadComplete();
                                  },
                                  onCurrentVoiceChanged: (String newVoice) {
                                    setState(() {
                                      currentVoice = newVoice;
                                    });
                                  },
                                  onCurrentSubVoiceChanged: (int newSubVoice) {
                                    setState(() {
                                      currentSubVoice = newSubVoice;
                                    });
                                  })))
                    ];

                    return SizedBox(
                        height: constraints.maxWidth > 470 ? 50 : 102,
                        child: Padding(
                            padding: const EdgeInsets.fromLTRB(0, 4, 0, 4),
                            child: constraints.maxWidth > 470
                                ? Row(children: voiceWidgets)
                                : Column(
                                    children: voiceWidgets +
                                        [const SizedBox(height: 10)])));
                  });
                })),
      ],
    );
  }
}
