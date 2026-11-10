import 'dart:io';

import 'package:path/path.dart' as path;
import 'templates.dart';
import 'utils.dart';

// The Piper voices configured for Speech Dispatcher: one voice per language
// (like "en_US"), and the voice used for the languages without a voice.
//
// A voice name is the model file name without ".onnx", followed by
// ":speaker" for the other speakers of a model with several speakers,
// e.g. "en_US-lessac-high" or "en_US-libritts-high:12".
class PiperVoices {
  Map<String, String> byLanguage = {};
  String defaultVoice = "";
}

File piperConfigFile() {
  return File(
      path.join(getHome()!, ".config/speech-dispatcher/modules/piper.conf"));
}

String voiceName(String modelFile, int speaker) {
  String name = modelFile.replaceAll(RegExp(r"\.onnx$"), "");
  return speaker == 0 ? name : "$name:$speaker";
}

String voiceModel(String name) {
  return "${name.split(":").first}.onnx";
}

// Model files start with the language, e.g. "ru_RU-denis-medium.onnx"
String voiceLanguage(String name) {
  return name.split("-").first;
}

PiperVoices readPiperVoices() {
  PiperVoices voices = PiperVoices();
  File modelConf = piperConfigFile();
  if (!modelConf.existsSync()) {
    return voices;
  }

  String config = modelConf.readAsStringSync();
  if (config.contains("\$VOICE")) {
    for (RegExpMatch match
        in RegExp(r'^AddVoice "[^"]+" "MALE1" "([^"]+)"', multiLine: true)
            .allMatches(config)) {
      String name = match.group(1)!;
      voices.byLanguage[voiceLanguage(name)] = name;
    }
    String? name = RegExp(r'^DefaultVoice "([^"]+)"', multiLine: true)
        .firstMatch(config)
        ?.group(1);
    if (name != null) {
      voices.defaultVoice = name;
    }
  } else {
    // written by an older version: one voice for all languages
    String? modelPath =
        RegExp("--model *(.*onnx) *").firstMatch(config)?.group(1);
    if (modelPath != null) {
      String? speaker = RegExp("-s (\\d+)").firstMatch(config)?.group(1);
      String name = voiceName(path.basename(modelPath.trim()),
          speaker != null ? int.parse(speaker) : 0);
      voices.byLanguage[voiceLanguage(name)] = name;
      voices.defaultVoice = name;
    }
  }

  return voices;
}

void _addVoice(StringBuffer config, String code, String name) {
  config.writeln('GenericLanguage "$code" "$code" "utf-8"');
  config.writeln('AddVoice "$code" "MALE1" "$name"');
}

// Speech Dispatcher asks for languages like "en" or "en-us". A request for a
// region without a voice falls back to the voice of the language, so a
// language with a single region only gets the short code.
Future<void> writePiperVoices(PiperVoices voices) async {
  final Directory appDir = await getDataDir();
  StringBuffer config = StringBuffer(modelTemplate
      .replaceAll("PIPER_PATH", path.join(appDir.path, "piper", "piper"))
      .replaceAll("MODEL_DIR", path.join(appDir.path, "models")));

  Map<String, List<String>> regions = {};
  List<String> languages = voices.byLanguage.keys.toList()..sort();
  for (String language in languages) {
    regions.putIfAbsent(language.split("_").first, () => []).add(language);
  }

  config.writeln();
  regions.forEach((String base, List<String> list) {
    if (list.length == 1) {
      _addVoice(config, base, voices.byLanguage[list.first]!);
      return;
    }
    for (String language in list) {
      _addVoice(config, language.replaceAll("_", "-").toLowerCase(),
          voices.byLanguage[language]!);
    }
    String preferred = list.contains(voiceLanguage(voices.defaultVoice))
        ? voiceLanguage(voices.defaultVoice)
        : list.first;
    _addVoice(config, base, voices.byLanguage[preferred]!);
  });

  if (voices.defaultVoice != "") {
    config.writeln('DefaultVoice "${voices.defaultVoice}"');
  }

  await piperConfigFile().writeAsString(config.toString());
}
