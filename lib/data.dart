import 'package:system_info2/system_info2.dart';

List<ProcessorArchitecture> supportedArchitectures = [
  ProcessorArchitecture.arm64,
  ProcessorArchitecture.arm,
  ProcessorArchitecture.x86_64
];

Map<ProcessorArchitecture, String> downloadUrls = {
  ProcessorArchitecture.arm64:
      "https://github.com/rhasspy/piper/releases/download/v1.0.0/piper_arm64.tar.gz",
  ProcessorArchitecture.arm:
      "https://github.com/rhasspy/piper/releases/download/v1.0.0/piper_armv7.tar.gz",
  ProcessorArchitecture.x86_64:
      "https://github.com/rhasspy/piper/releases/download/v1.0.0/piper_amd64.tar.gz"
};

// Format:
// Voice Name: [Sample Rate, Language Code, Model URL, Filename, Sample URL (Optional)]

Map<String, Map<String, List<String>>> voices = {
  "Catalan": {
    "Ona": [
      "16000",
      "ca",
      "https://github.com/rhasspy/piper/releases/download/v0.0.2/voice-ca-upc_ona-x-low.tar.gz",
      "ca-upc_ona-x-low.onnx",
      "https://github.com/rhasspy/piper-samples/raw/master/samples/ca/ca_ES/upc_ona/x_low/speaker_0.mp3"
    ],
    "Pau": [
      "16000",
      "ca",
      "https://github.com/rhasspy/piper/releases/download/v0.0.2/voice-ca-upc_pau-x-low.tar.gz",
      "ca-upc_pau-x-low.onnx",
      "https://github.com/rhasspy/piper-samples/raw/master/samples/ca/ca_ES/upc_pau/x_low/speaker_0.mp3"
    ],
  },
  "Danish": {
    "Talesyntese": [
      "22050",
      "da",
      "https://github.com/rhasspy/piper/releases/download/v0.0.2/voice-da-nst_talesyntese-medium.tar.gz",
      "da-nst_talesyntese-medium.onnx",
      "https://github.com/rhasspy/piper-samples/raw/master/samples/da/da_DK/talesyntese/medium/speaker_0.mp3"
    ]
  },
  "German": {
    "Eva": [
      "16000",
      "de",
      "https://github.com/rhasspy/piper/releases/download/v0.0.2/voice-de-eva_k-x-low.tar.gz",
      "de-eva_k-x-low.onnx",
      "https://github.com/rhasspy/piper-samples/raw/master/samples/de/de_DE/eva_k/x_low/speaker_0.mp3"
    ],
    "Karlsson": [
      "16000",
      "de",
      "https://github.com/rhasspy/piper/releases/download/v0.0.2/voice-de-karlsson-low.tar.gz",
      "de-karlsson-low.onnx",
      "https://github.com/rhasspy/piper-samples/raw/master/samples/de/de_DE/karlsson/low/speaker_0.mp3"
    ],
    "Kerstin": [
      "16000",
      "de",
      "https://github.com/rhasspy/piper/releases/download/v0.0.2/voice-de-kerstin-low.tar.gz",
      "de-kerstin-low.onnx",
      "https://github.com/rhasspy/piper-samples/raw/master/samples/de/de_DE/kerstin/low/speaker_0.mp3"
    ],
    "Pavoque": [
      "16000",
      "de",
      "https://github.com/rhasspy/piper/releases/download/v0.0.2/voice-de-pavoque-low.tar.gz",
      "de-pavoque-low.onnx",
      "https://github.com/rhasspy/piper-samples/raw/master/samples/de/de_DE/pavoque/low/speaker_0.mp3"
    ],
    "Ramona": [
      "16000",
      "de",
      "https://github.com/rhasspy/piper/releases/download/v0.0.2/voice-de-ramona-low.tar.gz",
      "de-ramona-low.onnx",
      "https://github.com/rhasspy/piper-samples/raw/master/samples/de/de_DE/ramona/low/speaker_0.mp3"
    ],
    "Thorsten": [
      "16000",
      "de",
      "https://github.com/rhasspy/piper/releases/download/v0.0.2/voice-de-thorsten-low.tar.gz",
      "de-thorsten-low.onnx",
      "https://github.com/rhasspy/piper-samples/blob/master/samples/de/de_DE/thorsten/low/speaker_0.mp3"
    ],
  },
  "Greek": {
    "Repunzelina": [
      "16000",
      "el-gr",
      "https://github.com/rhasspy/piper/releases/download/v0.0.2/voice-el-gr-rapunzelina-low.tar.gz",
      "el-gr-rapunzelina-low.onnx"
          "https://github.com/rhasspy/piper-samples/raw/master/samples/el/el_GR/rapunzelina/low/speaker_0.mp3"
    ]
  },
  "English (UK)": {
    "Alan": [
      "16000",
      "en-gb",
      "https://github.com/rhasspy/piper/releases/download/v0.0.2/voice-en-gb-alan-low.tar.gz",
      "en-gb-alan-low.onnx",
      "https://github.com/rhasspy/piper-samples/raw/master/samples/en/en_GB/alan/low/speaker_0.mp3"
    ],
    "Southern English Female": [
      "16000",
      "en-gb",
      "https://github.com/rhasspy/piper/releases/download/v0.0.2/voice-en-gb-southern_english_female-low.tar.gz",
      "en-gb-southern_english_female-low.onnx",
      "https://github.com/rhasspy/piper-samples/raw/master/samples/en/en_GB/southern_english_female/low/speaker_0.mp3"
    ],
  },
  "English (US)": {
    "Amy": [
      "16000",
      "en-us",
      "https://github.com/rhasspy/piper/releases/download/v0.0.2/voice-en-us-amy-low.tar.gz",
      "en-us-amy-low.onnx",
      "https://github.com/rhasspy/piper-samples/raw/master/samples/en/en_US/amy/low/speaker_0.mp3"
    ],
    "Danny": [
      "16000",
      "en-us",
      "https://github.com/rhasspy/piper/releases/download/v0.0.2/voice-en-us-danny-low.tar.gz",
      "en-us-danny-low.onnx",
      "https://github.com/rhasspy/piper-samples/raw/master/samples/en/en_US/danny/low/speaker_0.mp3"
    ],
    "Kathleen": [
      "16000",
      "en-us",
      "https://github.com/rhasspy/piper/releases/download/v0.0.2/voice-en-us-kathleen-low.tar.gz",
      "en-us-kathleen-low.onnx",
      "https://github.com/rhasspy/piper-samples/raw/master/samples/en/en_US/kathleen/low/speaker_0.mp3"
    ],
    "Lessac": [
      "16000",
      "en-us",
      "https://github.com/rhasspy/piper/releases/download/v0.0.2/voice-en-us-lessac-medium.tar.gz",
      "en-us-lessac-medium.onnx",
      "https://github.com/rhasspy/piper-samples/raw/master/samples/en/en_US/lessac/medium/speaker_0.mp3"
    ],
    "Libritts": [
      "22050",
      "en-us",
      "https://github.com/rhasspy/piper/releases/download/v0.0.2/voice-en-us-libritts-high.tar.gz",
      "en-us-libritts-high.onnx",
      "https://github.com/rhasspy/piper-samples/raw/master/samples/en/en_US/libritts/high/speaker_0.mp3"
    ],
    "Ryan": [
      "22050",
      "en-us",
      "https://github.com/rhasspy/piper/releases/download/v0.0.2/voice-en-us-ryan-high.tar.gz",
      "en-us-ryan-high.onnx",
      "https://github.com/rhasspy/piper-samples/raw/master/samples/en/en_US/ryan/high/speaker_0.mp3"
    ],
  },
  "Spanish": {
    "Carl": [
      "16000",
      "es",
      "https://github.com/rhasspy/piper/releases/download/v0.0.2/voice-es-carlfm-x-low.tar.gz",
      "es-carlfm-x-low.onnx",
      "https://github.com/rhasspy/piper-samples/raw/master/samples/es/es_ES/carlfm/x_low/speaker_0.mp3"
    ],
    "MLS 10246": [
      "16000",
      "es",
      "https://github.com/rhasspy/piper/releases/download/v0.0.2/voice-es-mls_10246-low.tar.gz",
      "es-mls_10246-low.onnx",
      "https://github.com/rhasspy/piper-samples/raw/master/samples/es/es_ES/mls_10246/low/speaker_0.mp3"
    ],
    "MLS 9972": [
      "16000",
      "es",
      "https://github.com/rhasspy/piper/releases/download/v0.0.2/voice-es-mls_9972-low.tar.gz",
      "es-mls_9972-low.onnx",
      "https://github.com/rhasspy/piper-samples/raw/master/samples/es/es_ES/mls_9972/low/speaker_0.mp3"
    ]
  },
  "Finnish": {
    "Harri": [
      "16000",
      "fi",
      "https://github.com/rhasspy/piper/releases/download/v0.0.2/voice-fi-harri-low.tar.gz",
      "fi-harri-low.onnx",
      "https://github.com/rhasspy/piper-samples/raw/master/samples/fi/fi_FI/harri/low/speaker_0.mp3"
    ]
  },
  "French": {
    "Gilles": [
      "16000",
      "fr",
      "https://github.com/rhasspy/piper/releases/download/v0.0.2/voice-fr-gilles-low.tar.gz",
      "fr-gilles-low.onnx",
      "https://github.com/rhasspy/piper-samples/raw/master/samples/fr/fr_FR/gilles/low/speaker_0.mp3"
    ],
    "MLS 1840": [
      "16000",
      "fr",
      "https://github.com/rhasspy/piper/releases/download/v0.0.2/voice-fr-mls_1840-low.tar.gz",
      "fr-mls_1840-low.onnx"
          "https://github.com/rhasspy/piper-samples/raw/master/samples/fr/fr_FR/mls_1840/low/speaker_0.mp3"
    ],
    "Siwis": [
      "22050",
      "fr",
      "https://github.com/rhasspy/piper/releases/download/v0.0.2/voice-fr-siwis-medium.tar.gz",
      "fr-siwis-medium.onnx",
      "https://github.com/rhasspy/piper-samples/raw/master/samples/fr/fr_FR/siwis/medium/speaker_0.mp3"
    ],
  },
  "Icelandic": {
    "Bui": [
      "22050",
      "is",
      "https://github.com/rhasspy/piper/releases/download/v0.0.2/voice-is-bui-medium.tar.gz",
      "is-bui-medium.onnx",
      "https://github.com/rhasspy/piper-samples/raw/master/samples/is/is_IS/bui/medium/speaker_0.mp3"
    ],
    "Salka": [
      "22050",
      "is",
      "https://github.com/rhasspy/piper/releases/download/v0.0.2/voice-is-salka-medium.tar.gz",
      "is-salka-medium.onnx",
      "https://github.com/rhasspy/piper-samples/raw/master/samples/is/is_IS/salka/medium/speaker_0.mp3"
    ],
    "Steinn": [
      "22050",
      "is",
      "https://github.com/rhasspy/piper/releases/download/v0.0.2/voice-is-steinn-medium.tar.gz",
      "is-steinn-medium.onnx",
      "https://github.com/rhasspy/piper-samples/raw/master/samples/is/is_IS/steinn/medium/speaker_0.mp3"
    ],
    "Ugla": [
      "22050",
      "is",
      "https://github.com/rhasspy/piper/releases/download/v0.0.2/voice-is-ugla-medium.tar.gz",
      "is-ugla-medium.onnx",
      "https://github.com/rhasspy/piper-samples/raw/master/samples/is/is_IS/ugla/medium/speaker_0.mp3"
    ],
  },
  "Italian": {
    "Riccardo": [
      "16000",
      "it",
      "https://github.com/rhasspy/piper/releases/download/v0.0.2/voice-it-riccardo_fasol-x-low.tar.gz",
      "it-riccardo_fasol-x-low.onnx",
      "https://github.com/rhasspy/piper-samples/raw/master/samples/it/it_IT/riccardo/x_low/speaker_0.mp3"
    ],
  },
  "Kazakh": {
    "Iseke": [
      "16000",
      "kk",
      "https://github.com/rhasspy/piper/releases/download/v0.0.2/voice-kk-iseke-x-low.tar.gz",
      "kk-iseke-x-low.onnx",
      "https://github.com/rhasspy/piper-samples/raw/master/samples/kk/kk_KZ/iseke/x_low/speaker_0.mp3"
    ],
    "Issai": [
      "22050",
      "kk",
      "https://github.com/rhasspy/piper/releases/download/v0.0.2/voice-kk-issai-high.tar.gz",
      "kk-issai-high.onnx",
      "https://github.com/rhasspy/piper-samples/raw/master/samples/kk/kk_KZ/issai/high/speaker_0.mp3"
    ],
    "Raya": [
      "16000",
      "kk",
      "https://github.com/rhasspy/piper/releases/download/v0.0.2/voice-kk-raya-x-low.tar.gz",
      "kk-raya-x-low.onnx",
      "https://github.com/rhasspy/piper-samples/raw/master/samples/kk/kk_KZ/raya/x_low/speaker_0.mp3"
    ],
  },
  "Nepali": {
    "Google": [
      "22050",
      "ne",
      "https://github.com/rhasspy/piper/releases/download/v0.0.2/voice-ne-google-medium.tar.gz",
      "ne-google-medium.onnx",
      "https://github.com/rhasspy/piper-samples/raw/master/samples/ne/ne_NP/google/medium/speaker_0.mp3"
    ],
  },
  "Dutch (Netherlands)": {
    "MLS 5809": [
      "16000",
      "nl_nl",
      "https://github.com/rhasspy/piper/releases/download/v0.0.2/voice-nl-mls_5809-low.tar.gz",
      "nl-mls_5809-low.onnx",
      "https://github.com/rhasspy/piper-samples/raw/master/samples/nl/nl_NL/mls_5809/low/speaker_0.mp3"
    ],
    "MLS 7432": [
      "16000",
      "nl_nl",
      "https://github.com/rhasspy/piper/releases/download/v0.0.2/voice-nl-mls_7432-low.tar.gz",
      "nl-mls_7432-low.onnx",
      "https://github.com/rhasspy/piper-samples/raw/master/samples/nl/nl_NL/mls_7432/low/speaker_0.mp3"
    ],
  },
  "Dutch (Belgium)": {
    "Nathale": [
      "16000",
      "nl_be",
      "https://github.com/rhasspy/piper/releases/download/v0.0.2/voice-nl-nathalie-x-low.tar.gz",
      "nl-nathalie-x-low.onnx",
      "https://github.com/rhasspy/piper-samples/raw/master/samples/nl/nl_BE/nathalie/x_low/speaker_0.mp3"
    ],
    "RDH": [
      "22050",
      "nl_be",
      "https://github.com/rhasspy/piper/releases/download/v0.0.2/voice-nl-rdh-medium.tar.gz",
      "nl-rdh-medium.onnx",
      "https://github.com/rhasspy/piper-samples/raw/master/samples/nl/nl_BE/rdh/medium/speaker_0.mp3"
    ],
  },
  "Norwegian": {
    "Talesyntese": [
      "22050",
      "no",
      "https://github.com/rhasspy/piper/releases/download/v0.0.2/voice-no-talesyntese-medium.tar.gz",
      "no-talesyntese-medium.onnx",
      "https://github.com/rhasspy/piper-samples/raw/master/samples/no/no_NO/talesyntese/medium/speaker_0.mp3"
    ],
  },
  "Polish": {
    "MLS 2892": [
      "16000",
      "pl",
      "https://github.com/rhasspy/piper/releases/download/v0.0.2/voice-pl-mls_6892-low.tar.gz",
      "pl-mls_6892-low.onnx",
      "https://github.com/rhasspy/piper-samples/raw/master/samples/pl/pl_PL/mls_6892/low/speaker_0.mp3"
    ],
  },
  "Brazilian Portuguese": {
    "Edresson": [
      "16000",
      "pt-br",
      "https://github.com/rhasspy/piper/releases/download/v0.0.2/voice-pt-br-edresson-low.tar.gz",
      "pt-br-edresson-low.onnx",
      "https://github.com/rhasspy/piper-samples/raw/master/samples/pt/pt_BR/edresson/low/speaker_0.mp3"
    ],
  },
  "Russian": {
    "Irinia": [
      "22050",
      "ru",
      "https://github.com/rhasspy/piper/releases/download/v0.0.2/voice-ru-irinia-medium.tar.gz",
      "ru-irinia-medium.onnx",
      "https://github.com/rhasspy/piper-samples/raw/master/samples/ru/ru_RU/irina/medium/speaker_0.mp3"
    ],
  },
  "Swedish": {
    "NST": [
      "22050",
      "sv-se",
      "https://github.com/rhasspy/piper/releases/download/v0.0.2/voice-sv-se-nst-medium.tar.gz",
      "sv-se-nst-medium.onnx",
      "https://github.com/rhasspy/piper-samples/raw/master/samples/sv/sv_SE/nst/medium/speaker_0.mp3"
    ],
  },
  "Ukrainian": {
    "Lada": [
      "16000",
      "uk",
      "https://github.com/rhasspy/piper/releases/download/v0.0.2/voice-uk-lada-x-low.tar.gz",
      "uk-lada-x-low.onnx",
      "https://github.com/rhasspy/piper-samples/raw/master/samples/uk/uk_UA/lada/x_low/speaker_0.mp3"
    ],
  },
  "Vietnamese": {
    "25 Hours": [
      "16000",
      "vi",
      "https://github.com/rhasspy/piper/releases/download/v0.0.2/voice-vi-25hours-single-low.tar.gz",
      "vi-25hours-single-low.onnx",
      "https://github.com/rhasspy/piper-samples/raw/master/samples/vi/vi_VN/25hours_single/low/speaker_0.mp3"
    ],
    "Vivos": [
      "16000",
      "vi",
      "https://github.com/rhasspy/piper/releases/download/v0.0.2/voice-vi-vivos-x-low.tar.gz",
      "vi-vivos-x-low.onnx",
      "https://github.com/rhasspy/piper-samples/raw/master/samples/vi/vi_VN/vivos/x_low/speaker_0.mp3"
    ],
  },
  "Chinese": {
    "Huayan": [
      "22050",
      "zh-cn",
      "https://github.com/rhasspy/piper/releases/download/v0.0.2/voice-zh_CN-huayan-medium.tar.gz",
      "zh_CN-huayan-medium.onnx",
      "https://github.com/rhasspy/piper-samples/raw/master/samples/zh/zh_CN/huayan/medium/speaker_0.mp3"
    ],
  },
};

Map<String, String> languageCodes = {
  "ca": "Catalan",
  "de": "German",
  "el-gr": "Greek",
  "en-gb": "English (UK)",
  "en-us": "English (US)",
  "es": "Spanish",
  "fr": "French",
  "is": "Icelandic",
  "it": "Italian",
  "kk": "Kazakh",
  "ne": "Nepali",
  "nl_be": "Dutch (Belgium)",
  "nl_nl": "Dutch (Netherlands)",
  "no": "Norwegian",
  "pl": "Polish",
  "pt-br": "Brazilian Portuguese",
  "ru": "Russian",
  "sv-se": "Swedish",
  "uk": "Ukrainian",
  "vi": "Vietnamese",
  "zh-cn": "Chinese"
};
