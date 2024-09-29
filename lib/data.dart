import 'package:system_info2/system_info2.dart';

List<ProcessorArchitecture> supportedArchitectures = [
  ProcessorArchitecture.arm64,
  ProcessorArchitecture.arm,
  ProcessorArchitecture.x86_64
];

Map<ProcessorArchitecture, String> downloadUrls = {
  ProcessorArchitecture.arm64:
      "https://github.com/rhasspy/piper/releases/download/v1.2.0/piper_arm64.tar.gz",
  ProcessorArchitecture.arm:
      "https://github.com/rhasspy/piper/releases/download/v1.2.0/piper_armv7.tar.gz",
  ProcessorArchitecture.x86_64:
      "https://github.com/rhasspy/piper/releases/download/v1.2.0/piper_amd64.tar.gz"
};

// Format:
// Voice Name: [Sample Rate, Language Code, Model URL, Model Metadata URL, Filename, Sample URL (Optional), Model card (Optional)]
// Use scripts/md-voices-to-map.py to update

Map<String, Map<String, List<String>>> voices = {
  "Arabic (\u0627\u0644\u0639\u0631\u0628\u064a\u0629)": {
    "kareem - low": [
      "16000",
      "ar_JO",
      "https://huggingface.co/rhasspy/piper-voices/resolve/v1.0.0/ar/ar_JO/kareem/low/ar_JO-kareem-low.onnx?download=true",
      "https://huggingface.co/rhasspy/piper-voices/resolve/v1.0.0/ar/ar_JO/kareem/low/ar_JO-kareem-low.onnx.json?download=true.json",
      "ar_JO-kareem-low.onnx",
      "https://huggingface.co/rhasspy/piper-voices/resolve/v1.0.0/ar/ar_JO/kareem/low/samples/speaker_0.mp3?download=true",
      "https://huggingface.co/rhasspy/piper-voices/resolve/v1.0.0/ar/ar_JO/kareem/low/MODEL_CARD?download=true"
    ],
    "kareem - medium": [
      "22050",
      "ar_JO",
      "https://huggingface.co/rhasspy/piper-voices/resolve/v1.0.0/ar/ar_JO/kareem/medium/ar_JO-kareem-medium.onnx?download=true",
      "https://huggingface.co/rhasspy/piper-voices/resolve/v1.0.0/ar/ar_JO/kareem/medium/ar_JO-kareem-medium.onnx.json?download=true.json",
      "ar_JO-kareem-medium.onnx",
      "https://huggingface.co/rhasspy/piper-voices/resolve/v1.0.0/ar/ar_JO/kareem/medium/samples/speaker_0.mp3?download=true",
      "https://huggingface.co/rhasspy/piper-voices/resolve/v1.0.0/ar/ar_JO/kareem/medium/MODEL_CARD?download=true"
    ]
  },
  "Catalan (Catal\u00e0)": {
    "upc_ona - x_low": [
      "16000",
      "ca_ES",
      "https://huggingface.co/rhasspy/piper-voices/resolve/v1.0.0/ca/ca_ES/upc_ona/x_low/ca_ES-upc_ona-x_low.onnx?download=true",
      "https://huggingface.co/rhasspy/piper-voices/resolve/v1.0.0/ca/ca_ES/upc_ona/x_low/ca_ES-upc_ona-x_low.onnx.json?download=true.json",
      "ca_ES-upc_ona-x_low.onnx",
      "https://huggingface.co/rhasspy/piper-voices/resolve/v1.0.0/ca/ca_ES/upc_ona/x_low/samples/speaker_0.mp3?download=true",
      "https://huggingface.co/rhasspy/piper-voices/resolve/v1.0.0/ca/ca_ES/upc_ona/x_low/MODEL_CARD?download=true"
    ],
    "upc_ona - medium": [
      "22050",
      "ca_ES",
      "https://huggingface.co/rhasspy/piper-voices/resolve/v1.0.0/ca/ca_ES/upc_ona/medium/ca_ES-upc_ona-medium.onnx?download=true",
      "https://huggingface.co/rhasspy/piper-voices/resolve/v1.0.0/ca/ca_ES/upc_ona/medium/ca_ES-upc_ona-medium.onnx.json?download=true.json",
      "ca_ES-upc_ona-medium.onnx",
      "https://huggingface.co/rhasspy/piper-voices/resolve/v1.0.0/ca/ca_ES/upc_ona/medium/samples/speaker_0.mp3?download=true",
      "https://huggingface.co/rhasspy/piper-voices/resolve/v1.0.0/ca/ca_ES/upc_ona/medium/MODEL_CARD?download=true"
    ],
    "upc_pau - x_low": [
      "16000",
      "ca_ES",
      "https://huggingface.co/rhasspy/piper-voices/resolve/v1.0.0/ca/ca_ES/upc_pau/x_low/ca_ES-upc_pau-x_low.onnx?download=true",
      "https://huggingface.co/rhasspy/piper-voices/resolve/v1.0.0/ca/ca_ES/upc_pau/x_low/ca_ES-upc_pau-x_low.onnx.json?download=true.json",
      "ca_ES-upc_pau-x_low.onnx",
      "https://huggingface.co/rhasspy/piper-voices/resolve/v1.0.0/ca/ca_ES/upc_pau/x_low/samples/speaker_0.mp3?download=true",
      "https://huggingface.co/rhasspy/piper-voices/resolve/v1.0.0/ca/ca_ES/upc_pau/x_low/MODEL_CARD?download=true"
    ]
  },
  "Czech (\u010ce\u0161tina)": {
    "jirka - low": [
      "16000",
      "cs_CZ",
      "https://huggingface.co/rhasspy/piper-voices/resolve/v1.0.0/cs/cs_CZ/jirka/low/cs_CZ-jirka-low.onnx?download=true",
      "https://huggingface.co/rhasspy/piper-voices/resolve/v1.0.0/cs/cs_CZ/jirka/low/cs_CZ-jirka-low.onnx.json?download=true.json",
      "cs_CZ-jirka-low.onnx",
      "https://huggingface.co/rhasspy/piper-voices/resolve/v1.0.0/cs/cs_CZ/jirka/low/samples/speaker_0.mp3?download=true",
      "https://huggingface.co/rhasspy/piper-voices/resolve/v1.0.0/cs/cs_CZ/jirka/low/MODEL_CARD?download=true"
    ],
    "jirka - medium": [
      "22050",
      "cs_CZ",
      "https://huggingface.co/rhasspy/piper-voices/resolve/v1.0.0/cs/cs_CZ/jirka/medium/cs_CZ-jirka-medium.onnx?download=true",
      "https://huggingface.co/rhasspy/piper-voices/resolve/v1.0.0/cs/cs_CZ/jirka/medium/cs_CZ-jirka-medium.onnx.json?download=true.json",
      "cs_CZ-jirka-medium.onnx",
      "https://huggingface.co/rhasspy/piper-voices/resolve/v1.0.0/cs/cs_CZ/jirka/medium/samples/speaker_0.mp3?download=true",
      "https://huggingface.co/rhasspy/piper-voices/resolve/v1.0.0/cs/cs_CZ/jirka/medium/MODEL_CARD?download=true"
    ]
  },
  "Welsh (Cymraeg)": {
    "gwryw_gogleddol - medium": [
      "22050",
      "cy_GB",
      "https://huggingface.co/rhasspy/piper-voices/resolve/v1.0.0/cy/cy_GB/gwryw_gogleddol/medium/cy_GB-gwryw_gogleddol-medium.onnx?download=true",
      "https://huggingface.co/rhasspy/piper-voices/resolve/v1.0.0/cy/cy_GB/gwryw_gogleddol/medium/cy_GB-gwryw_gogleddol-medium.onnx.json?download=true.json",
      "cy_GB-gwryw_gogleddol-medium.onnx",
      "https://huggingface.co/rhasspy/piper-voices/resolve/v1.0.0/cy/cy_GB/gwryw_gogleddol/medium/samples/speaker_0.mp3?download=true",
      "https://huggingface.co/rhasspy/piper-voices/resolve/v1.0.0/cy/cy_GB/gwryw_gogleddol/medium/MODEL_CARD?download=true"
    ]
  },
  "Danish (Dansk)": {
    "talesyntese - medium": [
      "22050",
      "da_DK",
      "https://huggingface.co/rhasspy/piper-voices/resolve/v1.0.0/da/da_DK/talesyntese/medium/da_DK-talesyntese-medium.onnx?download=true",
      "https://huggingface.co/rhasspy/piper-voices/resolve/v1.0.0/da/da_DK/talesyntese/medium/da_DK-talesyntese-medium.onnx.json?download=true.json",
      "da_DK-talesyntese-medium.onnx",
      "https://huggingface.co/rhasspy/piper-voices/resolve/v1.0.0/da/da_DK/talesyntese/medium/samples/speaker_0.mp3?download=true",
      "https://huggingface.co/rhasspy/piper-voices/resolve/v1.0.0/da/da_DK/talesyntese/medium/MODEL_CARD?download=true"
    ]
  },
  "German (Deutsch)": {
    "eva_k - x_low": [
      "16000",
      "de_DE",
      "https://huggingface.co/rhasspy/piper-voices/resolve/v1.0.0/de/de_DE/eva_k/x_low/de_DE-eva_k-x_low.onnx?download=true",
      "https://huggingface.co/rhasspy/piper-voices/resolve/v1.0.0/de/de_DE/eva_k/x_low/de_DE-eva_k-x_low.onnx.json?download=true.json",
      "de_DE-eva_k-x_low.onnx",
      "https://huggingface.co/rhasspy/piper-voices/resolve/v1.0.0/de/de_DE/eva_k/x_low/samples/speaker_0.mp3?download=true",
      "https://huggingface.co/rhasspy/piper-voices/resolve/v1.0.0/de/de_DE/eva_k/x_low/MODEL_CARD?download=true"
    ],
    "karlsson - low": [
      "16000",
      "de_DE",
      "https://huggingface.co/rhasspy/piper-voices/resolve/v1.0.0/de/de_DE/karlsson/low/de_DE-karlsson-low.onnx?download=true",
      "https://huggingface.co/rhasspy/piper-voices/resolve/v1.0.0/de/de_DE/karlsson/low/de_DE-karlsson-low.onnx.json?download=true.json",
      "de_DE-karlsson-low.onnx",
      "https://huggingface.co/rhasspy/piper-voices/resolve/v1.0.0/de/de_DE/karlsson/low/samples/speaker_0.mp3?download=true",
      "https://huggingface.co/rhasspy/piper-voices/resolve/v1.0.0/de/de_DE/karlsson/low/MODEL_CARD?download=true"
    ],
    "kerstin - low": [
      "16000",
      "de_DE",
      "https://huggingface.co/rhasspy/piper-voices/resolve/v1.0.0/de/de_DE/kerstin/low/de_DE-kerstin-low.onnx?download=true",
      "https://huggingface.co/rhasspy/piper-voices/resolve/v1.0.0/de/de_DE/kerstin/low/de_DE-kerstin-low.onnx.json?download=true.json",
      "de_DE-kerstin-low.onnx",
      "https://huggingface.co/rhasspy/piper-voices/resolve/v1.0.0/de/de_DE/kerstin/low/samples/speaker_0.mp3?download=true",
      "https://huggingface.co/rhasspy/piper-voices/resolve/v1.0.0/de/de_DE/kerstin/low/MODEL_CARD?download=true"
    ],
    "mls - medium": [
      "22050",
      "de_DE",
      "https://huggingface.co/rhasspy/piper-voices/resolve/v1.0.0/de/de_DE/mls/medium/de_DE-mls-medium.onnx?download=true",
      "https://huggingface.co/rhasspy/piper-voices/resolve/v1.0.0/de/de_DE/mls/medium/de_DE-mls-medium.onnx.json?download=true.json",
      "de_DE-mls-medium.onnx",
      "https://huggingface.co/rhasspy/piper-voices/resolve/v1.0.0/de/de_DE/mls/medium/samples/speaker_0.mp3?download=true",
      "https://huggingface.co/rhasspy/piper-voices/resolve/v1.0.0/de/de_DE/mls/medium/MODEL_CARD?download=true"
    ],
    "pavoque - low": [
      "16000",
      "de_DE",
      "https://huggingface.co/rhasspy/piper-voices/resolve/v1.0.0/de/de_DE/pavoque/low/de_DE-pavoque-low.onnx?download=true",
      "https://huggingface.co/rhasspy/piper-voices/resolve/v1.0.0/de/de_DE/pavoque/low/de_DE-pavoque-low.onnx.json?download=true.json",
      "de_DE-pavoque-low.onnx",
      "https://huggingface.co/rhasspy/piper-voices/resolve/v1.0.0/de/de_DE/pavoque/low/samples/speaker_0.mp3?download=true",
      "https://huggingface.co/rhasspy/piper-voices/resolve/v1.0.0/de/de_DE/pavoque/low/MODEL_CARD?download=true"
    ],
    "ramona - low": [
      "16000",
      "de_DE",
      "https://huggingface.co/rhasspy/piper-voices/resolve/v1.0.0/de/de_DE/ramona/low/de_DE-ramona-low.onnx?download=true",
      "https://huggingface.co/rhasspy/piper-voices/resolve/v1.0.0/de/de_DE/ramona/low/de_DE-ramona-low.onnx.json?download=true.json",
      "de_DE-ramona-low.onnx",
      "https://huggingface.co/rhasspy/piper-voices/resolve/v1.0.0/de/de_DE/ramona/low/samples/speaker_0.mp3?download=true",
      "https://huggingface.co/rhasspy/piper-voices/resolve/v1.0.0/de/de_DE/ramona/low/MODEL_CARD?download=true"
    ],
    "thorsten - low": [
      "16000",
      "de_DE",
      "https://huggingface.co/rhasspy/piper-voices/resolve/v1.0.0/de/de_DE/thorsten/low/de_DE-thorsten-low.onnx?download=true",
      "https://huggingface.co/rhasspy/piper-voices/resolve/v1.0.0/de/de_DE/thorsten/low/de_DE-thorsten-low.onnx.json?download=true.json",
      "de_DE-thorsten-low.onnx",
      "https://huggingface.co/rhasspy/piper-voices/resolve/v1.0.0/de/de_DE/thorsten/low/samples/speaker_0.mp3?download=true",
      "https://huggingface.co/rhasspy/piper-voices/resolve/v1.0.0/de/de_DE/thorsten/low/MODEL_CARD?download=true"
    ],
    "thorsten - medium": [
      "22050",
      "de_DE",
      "https://huggingface.co/rhasspy/piper-voices/resolve/v1.0.0/de/de_DE/thorsten/medium/de_DE-thorsten-medium.onnx?download=true",
      "https://huggingface.co/rhasspy/piper-voices/resolve/v1.0.0/de/de_DE/thorsten/medium/de_DE-thorsten-medium.onnx.json?download=true.json",
      "de_DE-thorsten-medium.onnx",
      "https://huggingface.co/rhasspy/piper-voices/resolve/v1.0.0/de/de_DE/thorsten/medium/samples/speaker_0.mp3?download=true",
      "https://huggingface.co/rhasspy/piper-voices/resolve/v1.0.0/de/de_DE/thorsten/medium/MODEL_CARD?download=true"
    ],
    "thorsten - high": [
      "22050",
      "de_DE",
      "https://huggingface.co/rhasspy/piper-voices/resolve/v1.0.0/de/de_DE/thorsten/high/de_DE-thorsten-high.onnx?download=true",
      "https://huggingface.co/rhasspy/piper-voices/resolve/v1.0.0/de/de_DE/thorsten/high/de_DE-thorsten-high.onnx.json?download=true.json",
      "de_DE-thorsten-high.onnx",
      "https://huggingface.co/rhasspy/piper-voices/resolve/v1.0.0/de/de_DE/thorsten/high/samples/speaker_0.mp3?download=true",
      "https://huggingface.co/rhasspy/piper-voices/resolve/v1.0.0/de/de_DE/thorsten/high/MODEL_CARD?download=true"
    ],
    "thorsten_emotional - medium": [
      "22050",
      "de_DE",
      "https://huggingface.co/rhasspy/piper-voices/resolve/v1.0.0/de/de_DE/thorsten_emotional/medium/de_DE-thorsten_emotional-medium.onnx?download=true",
      "https://huggingface.co/rhasspy/piper-voices/resolve/v1.0.0/de/de_DE/thorsten_emotional/medium/de_DE-thorsten_emotional-medium.onnx.json?download=true.json",
      "de_DE-thorsten_emotional-medium.onnx",
      "https://huggingface.co/rhasspy/piper-voices/resolve/v1.0.0/de/de_DE/thorsten_emotional/medium/samples/speaker_0.mp3?download=true",
      "https://huggingface.co/rhasspy/piper-voices/resolve/v1.0.0/de/de_DE/thorsten_emotional/medium/MODEL_CARD?download=true"
    ]
  },
  "Greek (\u0395\u03bb\u03bb\u03b7\u03bd\u03b9\u03ba\u03ac)": {
    "rapunzelina - low": [
      "16000",
      "el_GR",
      "https://huggingface.co/rhasspy/piper-voices/resolve/v1.0.0/el/el_GR/rapunzelina/low/el_GR-rapunzelina-low.onnx?download=true",
      "https://huggingface.co/rhasspy/piper-voices/resolve/v1.0.0/el/el_GR/rapunzelina/low/el_GR-rapunzelina-low.onnx.json?download=true.json",
      "el_GR-rapunzelina-low.onnx",
      "https://huggingface.co/rhasspy/piper-voices/resolve/v1.0.0/el/el_GR/rapunzelina/low/samples/speaker_0.mp3?download=true",
      "https://huggingface.co/rhasspy/piper-voices/resolve/v1.0.0/el/el_GR/rapunzelina/low/MODEL_CARD?download=true"
    ]
  },
  "English (GB)": {
    "alan - low": [
      "16000",
      "en_GB",
      "https://huggingface.co/rhasspy/piper-voices/resolve/v1.0.0/en/en_GB/alan/low/en_GB-alan-low.onnx?download=true",
      "https://huggingface.co/rhasspy/piper-voices/resolve/v1.0.0/en/en_GB/alan/low/en_GB-alan-low.onnx.json?download=true.json",
      "en_GB-alan-low.onnx",
      "https://huggingface.co/rhasspy/piper-voices/resolve/v1.0.0/en/en_GB/alan/low/samples/speaker_0.mp3?download=true",
      "https://huggingface.co/rhasspy/piper-voices/resolve/v1.0.0/en/en_GB/alan/low/MODEL_CARD?download=true"
    ],
    "alan - medium": [
      "22050",
      "en_GB",
      "https://huggingface.co/rhasspy/piper-voices/resolve/v1.0.0/en/en_GB/alan/medium/en_GB-alan-medium.onnx?download=true",
      "https://huggingface.co/rhasspy/piper-voices/resolve/v1.0.0/en/en_GB/alan/medium/en_GB-alan-medium.onnx.json?download=true.json",
      "en_GB-alan-medium.onnx",
      "https://huggingface.co/rhasspy/piper-voices/resolve/v1.0.0/en/en_GB/alan/medium/samples/speaker_0.mp3?download=true",
      "https://huggingface.co/rhasspy/piper-voices/resolve/v1.0.0/en/en_GB/alan/medium/MODEL_CARD?download=true"
    ],
    "alba - medium": [
      "22050",
      "en_GB",
      "https://huggingface.co/rhasspy/piper-voices/resolve/v1.0.0/en/en_GB/alba/medium/en_GB-alba-medium.onnx?download=true",
      "https://huggingface.co/rhasspy/piper-voices/resolve/v1.0.0/en/en_GB/alba/medium/en_GB-alba-medium.onnx.json?download=true.json",
      "en_GB-alba-medium.onnx",
      "https://huggingface.co/rhasspy/piper-voices/resolve/v1.0.0/en/en_GB/alba/medium/samples/speaker_0.mp3?download=true",
      "https://huggingface.co/rhasspy/piper-voices/resolve/v1.0.0/en/en_GB/alba/medium/MODEL_CARD?download=true"
    ],
    "aru - medium": [
      "22050",
      "en_GB",
      "https://huggingface.co/rhasspy/piper-voices/resolve/v1.0.0/en/en_GB/aru/medium/en_GB-aru-medium.onnx?download=true",
      "https://huggingface.co/rhasspy/piper-voices/resolve/v1.0.0/en/en_GB/aru/medium/en_GB-aru-medium.onnx.json?download=true.json",
      "en_GB-aru-medium.onnx",
      "https://huggingface.co/rhasspy/piper-voices/resolve/v1.0.0/en/en_GB/aru/medium/samples/speaker_0.mp3?download=true",
      "https://huggingface.co/rhasspy/piper-voices/resolve/v1.0.0/en/en_GB/aru/medium/MODEL_CARD?download=true"
    ],
    "cori - medium": [
      "22050",
      "en_GB",
      "https://huggingface.co/rhasspy/piper-voices/resolve/v1.0.0/en/en_GB/cori/medium/en_GB-cori-medium.onnx?download=true",
      "https://huggingface.co/rhasspy/piper-voices/resolve/v1.0.0/en/en_GB/cori/medium/en_GB-cori-medium.onnx.json?download=true.json",
      "en_GB-cori-medium.onnx",
      "https://huggingface.co/rhasspy/piper-voices/resolve/v1.0.0/en/en_GB/cori/medium/samples/speaker_0.mp3?download=true",
      "https://huggingface.co/rhasspy/piper-voices/resolve/v1.0.0/en/en_GB/cori/medium/MODEL_CARD?download=true"
    ],
    "cori - high": [
      "22050",
      "en_GB",
      "https://huggingface.co/rhasspy/piper-voices/resolve/v1.0.0/en/en_GB/cori/high/en_GB-cori-high.onnx?download=true",
      "https://huggingface.co/rhasspy/piper-voices/resolve/v1.0.0/en/en_GB/cori/high/en_GB-cori-high.onnx.json?download=true.json",
      "en_GB-cori-high.onnx",
      "https://huggingface.co/rhasspy/piper-voices/resolve/v1.0.0/en/en_GB/cori/high/samples/speaker_0.mp3?download=true",
      "https://huggingface.co/rhasspy/piper-voices/resolve/v1.0.0/en/en_GB/cori/high/MODEL_CARD?download=true"
    ],
    "jenny_dioco - medium": [
      "22050",
      "en_GB",
      "https://huggingface.co/rhasspy/piper-voices/resolve/v1.0.0/en/en_GB/jenny_dioco/medium/en_GB-jenny_dioco-medium.onnx?download=true",
      "https://huggingface.co/rhasspy/piper-voices/resolve/v1.0.0/en/en_GB/jenny_dioco/medium/en_GB-jenny_dioco-medium.onnx.json?download=true.json",
      "en_GB-jenny_dioco-medium.onnx",
      "https://huggingface.co/rhasspy/piper-voices/resolve/v1.0.0/en/en_GB/jenny_dioco/medium/samples/speaker_0.mp3?download=true",
      "https://huggingface.co/rhasspy/piper-voices/resolve/v1.0.0/en/en_GB/jenny_dioco/medium/MODEL_CARD?download=true"
    ],
    "northern_english_male - medium": [
      "22050",
      "en_GB",
      "https://huggingface.co/rhasspy/piper-voices/resolve/v1.0.0/en/en_GB/northern_english_male/medium/en_GB-northern_english_male-medium.onnx?download=true",
      "https://huggingface.co/rhasspy/piper-voices/resolve/v1.0.0/en/en_GB/northern_english_male/medium/en_GB-northern_english_male-medium.onnx.json?download=true.json",
      "en_GB-northern_english_male-medium.onnx",
      "https://huggingface.co/rhasspy/piper-voices/resolve/v1.0.0/en/en_GB/northern_english_male/medium/samples/speaker_0.mp3?download=true",
      "https://huggingface.co/rhasspy/piper-voices/resolve/v1.0.0/en/en_GB/northern_english_male/medium/MODEL_CARD?download=true"
    ],
    "semaine - medium": [
      "22050",
      "en_GB",
      "https://huggingface.co/rhasspy/piper-voices/resolve/v1.0.0/en/en_GB/semaine/medium/en_GB-semaine-medium.onnx?download=true",
      "https://huggingface.co/rhasspy/piper-voices/resolve/v1.0.0/en/en_GB/semaine/medium/en_GB-semaine-medium.onnx.json?download=true.json",
      "en_GB-semaine-medium.onnx",
      "https://huggingface.co/rhasspy/piper-voices/resolve/v1.0.0/en/en_GB/semaine/medium/samples/speaker_0.mp3?download=true",
      "https://huggingface.co/rhasspy/piper-voices/resolve/v1.0.0/en/en_GB/semaine/medium/MODEL_CARD?download=true"
    ],
    "southern_english_female - low": [
      "16000",
      "en_GB",
      "https://huggingface.co/rhasspy/piper-voices/resolve/v1.0.0/en/en_GB/southern_english_female/low/en_GB-southern_english_female-low.onnx?download=true",
      "https://huggingface.co/rhasspy/piper-voices/resolve/v1.0.0/en/en_GB/southern_english_female/low/en_GB-southern_english_female-low.onnx.json?download=true.json",
      "en_GB-southern_english_female-low.onnx",
      "https://huggingface.co/rhasspy/piper-voices/resolve/v1.0.0/en/en_GB/southern_english_female/low/samples/speaker_0.mp3?download=true",
      "https://huggingface.co/rhasspy/piper-voices/resolve/v1.0.0/en/en_GB/southern_english_female/low/MODEL_CARD?download=true"
    ],
    "vctk - medium": [
      "22050",
      "en_GB",
      "https://huggingface.co/rhasspy/piper-voices/resolve/v1.0.0/en/en_GB/vctk/medium/en_GB-vctk-medium.onnx?download=true",
      "https://huggingface.co/rhasspy/piper-voices/resolve/v1.0.0/en/en_GB/vctk/medium/en_GB-vctk-medium.onnx.json?download=true.json",
      "en_GB-vctk-medium.onnx",
      "https://huggingface.co/rhasspy/piper-voices/resolve/v1.0.0/en/en_GB/vctk/medium/samples/speaker_0.mp3?download=true",
      "https://huggingface.co/rhasspy/piper-voices/resolve/v1.0.0/en/en_GB/vctk/medium/MODEL_CARD?download=true"
    ]
  },
  "English (US)": {
    "amy - low": [
      "16000",
      "en_US",
      "https://huggingface.co/rhasspy/piper-voices/resolve/v1.0.0/en/en_US/amy/low/en_US-amy-low.onnx?download=true",
      "https://huggingface.co/rhasspy/piper-voices/resolve/v1.0.0/en/en_US/amy/low/en_US-amy-low.onnx.json?download=true.json",
      "en_US-amy-low.onnx",
      "https://huggingface.co/rhasspy/piper-voices/resolve/v1.0.0/en/en_US/amy/low/samples/speaker_0.mp3?download=true",
      "https://huggingface.co/rhasspy/piper-voices/resolve/v1.0.0/en/en_US/amy/low/MODEL_CARD?download=true"
    ],
    "amy - medium": [
      "22050",
      "en_US",
      "https://huggingface.co/rhasspy/piper-voices/resolve/v1.0.0/en/en_US/amy/medium/en_US-amy-medium.onnx?download=true",
      "https://huggingface.co/rhasspy/piper-voices/resolve/v1.0.0/en/en_US/amy/medium/en_US-amy-medium.onnx.json?download=true.json",
      "en_US-amy-medium.onnx",
      "https://huggingface.co/rhasspy/piper-voices/resolve/v1.0.0/en/en_US/amy/medium/samples/speaker_0.mp3?download=true",
      "https://huggingface.co/rhasspy/piper-voices/resolve/v1.0.0/en/en_US/amy/medium/MODEL_CARD?download=true"
    ],
    "arctic - medium": [
      "22050",
      "en_US",
      "https://huggingface.co/rhasspy/piper-voices/resolve/v1.0.0/en/en_US/arctic/medium/en_US-arctic-medium.onnx?download=true",
      "https://huggingface.co/rhasspy/piper-voices/resolve/v1.0.0/en/en_US/arctic/medium/en_US-arctic-medium.onnx.json?download=true.json",
      "en_US-arctic-medium.onnx",
      "https://huggingface.co/rhasspy/piper-voices/resolve/v1.0.0/en/en_US/arctic/medium/samples/speaker_0.mp3?download=true",
      "https://huggingface.co/rhasspy/piper-voices/resolve/v1.0.0/en/en_US/arctic/medium/MODEL_CARD?download=true"
    ],
    "bryce - medium": [
      "22050",
      "en_US",
      "https://huggingface.co/rhasspy/piper-voices/resolve/v1.0.0/en/en_US/bryce/medium/en_US-bryce-medium.onnx?download=true",
      "https://huggingface.co/rhasspy/piper-voices/resolve/v1.0.0/en/en_US/bryce/medium/en_US-bryce-medium.onnx.json?download=true.json",
      "en_US-bryce-medium.onnx",
      "https://huggingface.co/rhasspy/piper-voices/resolve/v1.0.0/en/en_US/bryce/medium/samples/speaker_0.mp3?download=true",
      "https://huggingface.co/rhasspy/piper-voices/resolve/v1.0.0/en/en_US/bryce/medium/MODEL_CARD?download=true"
    ],
    "danny - low": [
      "16000",
      "en_US",
      "https://huggingface.co/rhasspy/piper-voices/resolve/v1.0.0/en/en_US/danny/low/en_US-danny-low.onnx?download=true",
      "https://huggingface.co/rhasspy/piper-voices/resolve/v1.0.0/en/en_US/danny/low/en_US-danny-low.onnx.json?download=true.json",
      "en_US-danny-low.onnx",
      "https://huggingface.co/rhasspy/piper-voices/resolve/v1.0.0/en/en_US/danny/low/samples/speaker_0.mp3?download=true",
      "https://huggingface.co/rhasspy/piper-voices/resolve/v1.0.0/en/en_US/danny/low/MODEL_CARD?download=true"
    ],
    "hfc_female - medium": [
      "22050",
      "en_US",
      "https://huggingface.co/rhasspy/piper-voices/resolve/v1.0.0/en/en_US/hfc_female/medium/en_US-hfc_female-medium.onnx?download=true",
      "https://huggingface.co/rhasspy/piper-voices/resolve/v1.0.0/en/en_US/hfc_female/medium/en_US-hfc_female-medium.onnx.json?download=true.json",
      "en_US-hfc_female-medium.onnx",
      "https://huggingface.co/rhasspy/piper-voices/resolve/v1.0.0/en/en_US/hfc_female/medium/samples/speaker_0.mp3?download=true",
      "https://huggingface.co/rhasspy/piper-voices/resolve/v1.0.0/en/en_US/hfc_female/medium/MODEL_CARD?download=true"
    ],
    "hfc_male - medium": [
      "22050",
      "en_US",
      "https://huggingface.co/rhasspy/piper-voices/resolve/v1.0.0/en/en_US/hfc_male/medium/en_US-hfc_male-medium.onnx?download=true",
      "https://huggingface.co/rhasspy/piper-voices/resolve/v1.0.0/en/en_US/hfc_male/medium/en_US-hfc_male-medium.onnx.json?download=true.json",
      "en_US-hfc_male-medium.onnx",
      "https://huggingface.co/rhasspy/piper-voices/resolve/v1.0.0/en/en_US/hfc_male/medium/samples/speaker_0.mp3?download=true",
      "https://huggingface.co/rhasspy/piper-voices/resolve/v1.0.0/en/en_US/hfc_male/medium/MODEL_CARD?download=true"
    ],
    "joe - medium": [
      "22050",
      "en_US",
      "https://huggingface.co/rhasspy/piper-voices/resolve/v1.0.0/en/en_US/joe/medium/en_US-joe-medium.onnx?download=true",
      "https://huggingface.co/rhasspy/piper-voices/resolve/v1.0.0/en/en_US/joe/medium/en_US-joe-medium.onnx.json?download=true.json",
      "en_US-joe-medium.onnx",
      "https://huggingface.co/rhasspy/piper-voices/resolve/v1.0.0/en/en_US/joe/medium/samples/speaker_0.mp3?download=true",
      "https://huggingface.co/rhasspy/piper-voices/resolve/v1.0.0/en/en_US/joe/medium/MODEL_CARD?download=true"
    ],
    "john - medium": [
      "22050",
      "en_US",
      "https://huggingface.co/rhasspy/piper-voices/resolve/v1.0.0/en/en_US/john/medium/en_US-john-medium.onnx?download=true",
      "https://huggingface.co/rhasspy/piper-voices/resolve/v1.0.0/en/en_US/john/medium/en_US-john-medium.onnx.json?download=true.json",
      "en_US-john-medium.onnx",
      "https://huggingface.co/rhasspy/piper-voices/resolve/v1.0.0/en/en_US/john/medium/samples/speaker_0.mp3?download=true",
      "https://huggingface.co/rhasspy/piper-voices/resolve/v1.0.0/en/en_US/john/medium/MODEL_CARD?download=true"
    ],
    "kathleen - low": [
      "16000",
      "en_US",
      "https://huggingface.co/rhasspy/piper-voices/resolve/v1.0.0/en/en_US/kathleen/low/en_US-kathleen-low.onnx?download=true",
      "https://huggingface.co/rhasspy/piper-voices/resolve/v1.0.0/en/en_US/kathleen/low/en_US-kathleen-low.onnx.json?download=true.json",
      "en_US-kathleen-low.onnx",
      "https://huggingface.co/rhasspy/piper-voices/resolve/v1.0.0/en/en_US/kathleen/low/samples/speaker_0.mp3?download=true",
      "https://huggingface.co/rhasspy/piper-voices/resolve/v1.0.0/en/en_US/kathleen/low/MODEL_CARD?download=true"
    ],
    "kristin - medium": [
      "22050",
      "en_US",
      "https://huggingface.co/rhasspy/piper-voices/resolve/v1.0.0/en/en_US/kristin/medium/en_US-kristin-medium.onnx?download=true",
      "https://huggingface.co/rhasspy/piper-voices/resolve/v1.0.0/en/en_US/kristin/medium/en_US-kristin-medium.onnx.json?download=true.json",
      "en_US-kristin-medium.onnx",
      "https://huggingface.co/rhasspy/piper-voices/resolve/v1.0.0/en/en_US/kristin/medium/samples/speaker_0.mp3?download=true",
      "https://huggingface.co/rhasspy/piper-voices/resolve/v1.0.0/en/en_US/kristin/medium/MODEL_CARD?download=true"
    ],
    "kusal - medium": [
      "22050",
      "en_US",
      "https://huggingface.co/rhasspy/piper-voices/resolve/v1.0.0/en/en_US/kusal/medium/en_US-kusal-medium.onnx?download=true",
      "https://huggingface.co/rhasspy/piper-voices/resolve/v1.0.0/en/en_US/kusal/medium/en_US-kusal-medium.onnx.json?download=true.json",
      "en_US-kusal-medium.onnx",
      "https://huggingface.co/rhasspy/piper-voices/resolve/v1.0.0/en/en_US/kusal/medium/samples/speaker_0.mp3?download=true",
      "https://huggingface.co/rhasspy/piper-voices/resolve/v1.0.0/en/en_US/kusal/medium/MODEL_CARD?download=true"
    ],
    "l2arctic - medium": [
      "22050",
      "en_US",
      "https://huggingface.co/rhasspy/piper-voices/resolve/v1.0.0/en/en_US/l2arctic/medium/en_US-l2arctic-medium.onnx?download=true",
      "https://huggingface.co/rhasspy/piper-voices/resolve/v1.0.0/en/en_US/l2arctic/medium/en_US-l2arctic-medium.onnx.json?download=true.json",
      "en_US-l2arctic-medium.onnx",
      "https://huggingface.co/rhasspy/piper-voices/resolve/v1.0.0/en/en_US/l2arctic/medium/samples/speaker_0.mp3?download=true",
      "https://huggingface.co/rhasspy/piper-voices/resolve/v1.0.0/en/en_US/l2arctic/medium/MODEL_CARD?download=true"
    ],
    "lessac - low": [
      "16000",
      "en_US",
      "https://huggingface.co/rhasspy/piper-voices/resolve/v1.0.0/en/en_US/lessac/low/en_US-lessac-low.onnx?download=true",
      "https://huggingface.co/rhasspy/piper-voices/resolve/v1.0.0/en/en_US/lessac/low/en_US-lessac-low.onnx.json?download=true.json",
      "en_US-lessac-low.onnx",
      "https://huggingface.co/rhasspy/piper-voices/resolve/v1.0.0/en/en_US/lessac/low/samples/speaker_0.mp3?download=true",
      "https://huggingface.co/rhasspy/piper-voices/resolve/v1.0.0/en/en_US/lessac/low/MODEL_CARD?download=true"
    ],
    "lessac - medium": [
      "22050",
      "en_US",
      "https://huggingface.co/rhasspy/piper-voices/resolve/v1.0.0/en/en_US/lessac/medium/en_US-lessac-medium.onnx?download=true",
      "https://huggingface.co/rhasspy/piper-voices/resolve/v1.0.0/en/en_US/lessac/medium/en_US-lessac-medium.onnx.json?download=true.json",
      "en_US-lessac-medium.onnx",
      "https://huggingface.co/rhasspy/piper-voices/resolve/v1.0.0/en/en_US/lessac/medium/samples/speaker_0.mp3?download=true",
      "https://huggingface.co/rhasspy/piper-voices/resolve/v1.0.0/en/en_US/lessac/medium/MODEL_CARD?download=true"
    ],
    "lessac - high": [
      "22050",
      "en_US",
      "https://huggingface.co/rhasspy/piper-voices/resolve/v1.0.0/en/en_US/lessac/high/en_US-lessac-high.onnx?download=true",
      "https://huggingface.co/rhasspy/piper-voices/resolve/v1.0.0/en/en_US/lessac/high/en_US-lessac-high.onnx.json?download=true.json",
      "en_US-lessac-high.onnx",
      "https://huggingface.co/rhasspy/piper-voices/resolve/v1.0.0/en/en_US/lessac/high/samples/speaker_0.mp3?download=true",
      "https://huggingface.co/rhasspy/piper-voices/resolve/v1.0.0/en/en_US/lessac/high/MODEL_CARD?download=true"
    ],
    "libritts - high": [
      "22050",
      "en_US",
      "https://huggingface.co/rhasspy/piper-voices/resolve/v1.0.0/en/en_US/libritts/high/en_US-libritts-high.onnx?download=true",
      "https://huggingface.co/rhasspy/piper-voices/resolve/v1.0.0/en/en_US/libritts/high/en_US-libritts-high.onnx.json?download=true.json",
      "en_US-libritts-high.onnx",
      "https://huggingface.co/rhasspy/piper-voices/resolve/v1.0.0/en/en_US/libritts/high/samples/speaker_0.mp3?download=true",
      "https://huggingface.co/rhasspy/piper-voices/resolve/v1.0.0/en/en_US/libritts/high/MODEL_CARD?download=true"
    ],
    "libritts_r - medium": [
      "22050",
      "en_US",
      "https://huggingface.co/rhasspy/piper-voices/resolve/v1.0.0/en/en_US/libritts_r/medium/en_US-libritts_r-medium.onnx?download=true",
      "https://huggingface.co/rhasspy/piper-voices/resolve/v1.0.0/en/en_US/libritts_r/medium/en_US-libritts_r-medium.onnx.json?download=true.json",
      "en_US-libritts_r-medium.onnx",
      "https://huggingface.co/rhasspy/piper-voices/resolve/v1.0.0/en/en_US/libritts_r/medium/samples/speaker_0.mp3?download=true",
      "https://huggingface.co/rhasspy/piper-voices/resolve/v1.0.0/en/en_US/libritts_r/medium/MODEL_CARD?download=true"
    ],
    "ljspeech - medium": [
      "22050",
      "en_US",
      "https://huggingface.co/rhasspy/piper-voices/resolve/v1.0.0/en/en_US/ljspeech/medium/en_US-ljspeech-medium.onnx?download=true",
      "https://huggingface.co/rhasspy/piper-voices/resolve/v1.0.0/en/en_US/ljspeech/medium/en_US-ljspeech-medium.onnx.json?download=true.json",
      "en_US-ljspeech-medium.onnx",
      "https://huggingface.co/rhasspy/piper-voices/resolve/v1.0.0/en/en_US/ljspeech/medium/samples/speaker_0.mp3?download=true",
      "https://huggingface.co/rhasspy/piper-voices/resolve/v1.0.0/en/en_US/ljspeech/medium/MODEL_CARD?download=true"
    ],
    "ljspeech - high": [
      "22050",
      "en_US",
      "https://huggingface.co/rhasspy/piper-voices/resolve/v1.0.0/en/en_US/ljspeech/high/en_US-ljspeech-high.onnx?download=true",
      "https://huggingface.co/rhasspy/piper-voices/resolve/v1.0.0/en/en_US/ljspeech/high/en_US-ljspeech-high.onnx.json?download=true.json",
      "en_US-ljspeech-high.onnx",
      "https://huggingface.co/rhasspy/piper-voices/resolve/v1.0.0/en/en_US/ljspeech/high/samples/speaker_0.mp3?download=true",
      "https://huggingface.co/rhasspy/piper-voices/resolve/v1.0.0/en/en_US/ljspeech/high/MODEL_CARD?download=true"
    ],
    "norman - medium": [
      "22050",
      "en_US",
      "https://huggingface.co/rhasspy/piper-voices/resolve/v1.0.0/en/en_US/norman/medium/en_US-norman-medium.onnx?download=true",
      "https://huggingface.co/rhasspy/piper-voices/resolve/v1.0.0/en/en_US/norman/medium/en_US-norman-medium.onnx.json?download=true.json",
      "en_US-norman-medium.onnx",
      "https://huggingface.co/rhasspy/piper-voices/resolve/v1.0.0/en/en_US/norman/medium/samples/speaker_0.mp3?download=true",
      "https://huggingface.co/rhasspy/piper-voices/resolve/v1.0.0/en/en_US/norman/medium/MODEL_CARD?download=true"
    ],
    "ryan - low": [
      "16000",
      "en_US",
      "https://huggingface.co/rhasspy/piper-voices/resolve/v1.0.0/en/en_US/ryan/low/en_US-ryan-low.onnx?download=true",
      "https://huggingface.co/rhasspy/piper-voices/resolve/v1.0.0/en/en_US/ryan/low/en_US-ryan-low.onnx.json?download=true.json",
      "en_US-ryan-low.onnx",
      "https://huggingface.co/rhasspy/piper-voices/resolve/v1.0.0/en/en_US/ryan/low/samples/speaker_0.mp3?download=true",
      "https://huggingface.co/rhasspy/piper-voices/resolve/v1.0.0/en/en_US/ryan/low/MODEL_CARD?download=true"
    ],
    "ryan - medium": [
      "22050",
      "en_US",
      "https://huggingface.co/rhasspy/piper-voices/resolve/v1.0.0/en/en_US/ryan/medium/en_US-ryan-medium.onnx?download=true",
      "https://huggingface.co/rhasspy/piper-voices/resolve/v1.0.0/en/en_US/ryan/medium/en_US-ryan-medium.onnx.json?download=true.json",
      "en_US-ryan-medium.onnx",
      "https://huggingface.co/rhasspy/piper-voices/resolve/v1.0.0/en/en_US/ryan/medium/samples/speaker_0.mp3?download=true",
      "https://huggingface.co/rhasspy/piper-voices/resolve/v1.0.0/en/en_US/ryan/medium/MODEL_CARD?download=true"
    ],
    "ryan - high": [
      "22050",
      "en_US",
      "https://huggingface.co/rhasspy/piper-voices/resolve/v1.0.0/en/en_US/ryan/high/en_US-ryan-high.onnx?download=true",
      "https://huggingface.co/rhasspy/piper-voices/resolve/v1.0.0/en/en_US/ryan/high/en_US-ryan-high.onnx.json?download=true.json",
      "en_US-ryan-high.onnx",
      "https://huggingface.co/rhasspy/piper-voices/resolve/v1.0.0/en/en_US/ryan/high/samples/speaker_0.mp3?download=true",
      "https://huggingface.co/rhasspy/piper-voices/resolve/v1.0.0/en/en_US/ryan/high/MODEL_CARD?download=true"
    ]
  },
  "Spanish (Espa\u00f1ol)": {
    "ald - medium": [
      "22050",
      "es_MX",
      "https://huggingface.co/rhasspy/piper-voices/resolve/v1.0.0/es/es_MX/ald/medium/es_MX-ald-medium.onnx?download=true",
      "https://huggingface.co/rhasspy/piper-voices/resolve/v1.0.0/es/es_MX/ald/medium/es_MX-ald-medium.onnx.json?download=true.json",
      "es_MX-ald-medium.onnx",
      "https://huggingface.co/rhasspy/piper-voices/resolve/v1.0.0/es/es_MX/ald/medium/samples/speaker_0.mp3?download=true",
      "https://huggingface.co/rhasspy/piper-voices/resolve/v1.0.0/es/es_MX/ald/medium/MODEL_CARD?download=true"
    ],
    "claude - high": [
      "22050",
      "es_MX",
      "https://huggingface.co/rhasspy/piper-voices/resolve/v1.0.0/es/es_MX/claude/high/es_MX-claude-high.onnx?download=true",
      "https://huggingface.co/rhasspy/piper-voices/resolve/v1.0.0/es/es_MX/claude/high/es_MX-claude-high.onnx.json?download=true.json",
      "es_MX-claude-high.onnx",
      "https://huggingface.co/rhasspy/piper-voices/resolve/v1.0.0/es/es_MX/claude/high/samples/speaker_0.mp3?download=true",
      "https://huggingface.co/rhasspy/piper-voices/resolve/v1.0.0/es/es_MX/claude/high/MODEL_CARD?download=true"
    ]
  },
  "Farsi (\u0641\u0627\u0631\u0633\u06cc)": {
    "amir - medium": [
      "22050",
      "fa_IR",
      "https://huggingface.co/rhasspy/piper-voices/resolve/v1.0.0/fa/fa_IR/amir/medium/fa_IR-amir-medium.onnx?download=true",
      "https://huggingface.co/rhasspy/piper-voices/resolve/v1.0.0/fa/fa_IR/amir/medium/fa_IR-amir-medium.onnx.json?download=true.json",
      "fa_IR-amir-medium.onnx",
      "https://huggingface.co/rhasspy/piper-voices/resolve/v1.0.0/fa/fa_IR/amir/medium/samples/speaker_0.mp3?download=true",
      "https://huggingface.co/rhasspy/piper-voices/resolve/v1.0.0/fa/fa_IR/amir/medium/MODEL_CARD?download=true"
    ],
    "gyro - medium": [
      "22050",
      "fa_IR",
      "https://huggingface.co/rhasspy/piper-voices/resolve/v1.0.0/fa/fa_IR/gyro/medium/fa_IR-gyro-medium.onnx?download=true",
      "https://huggingface.co/rhasspy/piper-voices/resolve/v1.0.0/fa/fa_IR/gyro/medium/fa_IR-gyro-medium.onnx.json?download=true.json",
      "fa_IR-gyro-medium.onnx",
      "https://huggingface.co/rhasspy/piper-voices/resolve/v1.0.0/fa/fa_IR/gyro/medium/samples/speaker_0.mp3?download=true",
      "https://huggingface.co/rhasspy/piper-voices/resolve/v1.0.0/fa/fa_IR/gyro/medium/MODEL_CARD?download=true"
    ]
  },
  "Finnish (Suomi)": {
    "harri - low": [
      "16000",
      "fi_FI",
      "https://huggingface.co/rhasspy/piper-voices/resolve/v1.0.0/fi/fi_FI/harri/low/fi_FI-harri-low.onnx?download=true",
      "https://huggingface.co/rhasspy/piper-voices/resolve/v1.0.0/fi/fi_FI/harri/low/fi_FI-harri-low.onnx.json?download=true.json",
      "fi_FI-harri-low.onnx",
      "https://huggingface.co/rhasspy/piper-voices/resolve/v1.0.0/fi/fi_FI/harri/low/samples/speaker_0.mp3?download=true",
      "https://huggingface.co/rhasspy/piper-voices/resolve/v1.0.0/fi/fi_FI/harri/low/MODEL_CARD?download=true"
    ],
    "harri - medium": [
      "22050",
      "fi_FI",
      "https://huggingface.co/rhasspy/piper-voices/resolve/v1.0.0/fi/fi_FI/harri/medium/fi_FI-harri-medium.onnx?download=true",
      "https://huggingface.co/rhasspy/piper-voices/resolve/v1.0.0/fi/fi_FI/harri/medium/fi_FI-harri-medium.onnx.json?download=true.json",
      "fi_FI-harri-medium.onnx",
      "https://huggingface.co/rhasspy/piper-voices/resolve/v1.0.0/fi/fi_FI/harri/medium/samples/speaker_0.mp3?download=true",
      "https://huggingface.co/rhasspy/piper-voices/resolve/v1.0.0/fi/fi_FI/harri/medium/MODEL_CARD?download=true"
    ]
  },
  "French (Fran\u00e7ais)": {
    "gilles - low": [
      "16000",
      "fr_FR",
      "https://huggingface.co/rhasspy/piper-voices/resolve/v1.0.0/fr/fr_FR/gilles/low/fr_FR-gilles-low.onnx?download=true",
      "https://huggingface.co/rhasspy/piper-voices/resolve/v1.0.0/fr/fr_FR/gilles/low/fr_FR-gilles-low.onnx.json?download=true.json",
      "fr_FR-gilles-low.onnx",
      "https://huggingface.co/rhasspy/piper-voices/resolve/v1.0.0/fr/fr_FR/gilles/low/samples/speaker_0.mp3?download=true",
      "https://huggingface.co/rhasspy/piper-voices/resolve/v1.0.0/fr/fr_FR/gilles/low/MODEL_CARD?download=true"
    ],
    "mls - medium": [
      "22050",
      "fr_FR",
      "https://huggingface.co/rhasspy/piper-voices/resolve/v1.0.0/fr/fr_FR/mls/medium/fr_FR-mls-medium.onnx?download=true",
      "https://huggingface.co/rhasspy/piper-voices/resolve/v1.0.0/fr/fr_FR/mls/medium/fr_FR-mls-medium.onnx.json?download=true.json",
      "fr_FR-mls-medium.onnx",
      "https://huggingface.co/rhasspy/piper-voices/resolve/v1.0.0/fr/fr_FR/mls/medium/samples/speaker_0.mp3?download=true",
      "https://huggingface.co/rhasspy/piper-voices/resolve/v1.0.0/fr/fr_FR/mls/medium/MODEL_CARD?download=true"
    ],
    "mls_1840 - low": [
      "16000",
      "fr_FR",
      "https://huggingface.co/rhasspy/piper-voices/resolve/v1.0.0/fr/fr_FR/mls_1840/low/fr_FR-mls_1840-low.onnx?download=true",
      "https://huggingface.co/rhasspy/piper-voices/resolve/v1.0.0/fr/fr_FR/mls_1840/low/fr_FR-mls_1840-low.onnx.json?download=true.json",
      "fr_FR-mls_1840-low.onnx",
      "https://huggingface.co/rhasspy/piper-voices/resolve/v1.0.0/fr/fr_FR/mls_1840/low/samples/speaker_0.mp3?download=true",
      "https://huggingface.co/rhasspy/piper-voices/resolve/v1.0.0/fr/fr_FR/mls_1840/low/MODEL_CARD?download=true"
    ],
    "siwis - low": [
      "16000",
      "fr_FR",
      "https://huggingface.co/rhasspy/piper-voices/resolve/v1.0.0/fr/fr_FR/siwis/low/fr_FR-siwis-low.onnx?download=true",
      "https://huggingface.co/rhasspy/piper-voices/resolve/v1.0.0/fr/fr_FR/siwis/low/fr_FR-siwis-low.onnx.json?download=true.json",
      "fr_FR-siwis-low.onnx",
      "https://huggingface.co/rhasspy/piper-voices/resolve/v1.0.0/fr/fr_FR/siwis/low/samples/speaker_0.mp3?download=true",
      "https://huggingface.co/rhasspy/piper-voices/resolve/v1.0.0/fr/fr_FR/siwis/low/MODEL_CARD?download=true"
    ],
    "siwis - medium": [
      "22050",
      "fr_FR",
      "https://huggingface.co/rhasspy/piper-voices/resolve/v1.0.0/fr/fr_FR/siwis/medium/fr_FR-siwis-medium.onnx?download=true",
      "https://huggingface.co/rhasspy/piper-voices/resolve/v1.0.0/fr/fr_FR/siwis/medium/fr_FR-siwis-medium.onnx.json?download=true.json",
      "fr_FR-siwis-medium.onnx",
      "https://huggingface.co/rhasspy/piper-voices/resolve/v1.0.0/fr/fr_FR/siwis/medium/samples/speaker_0.mp3?download=true",
      "https://huggingface.co/rhasspy/piper-voices/resolve/v1.0.0/fr/fr_FR/siwis/medium/MODEL_CARD?download=true"
    ],
    "tom - medium": [
      "44100",
      "fr_FR",
      "https://huggingface.co/rhasspy/piper-voices/resolve/v1.0.0/fr/fr_FR/tom/medium/fr_FR-tom-medium.onnx?download=true",
      "https://huggingface.co/rhasspy/piper-voices/resolve/v1.0.0/fr/fr_FR/tom/medium/fr_FR-tom-medium.onnx.json?download=true.json",
      "fr_FR-tom-medium.onnx",
      "https://huggingface.co/rhasspy/piper-voices/resolve/v1.0.0/fr/fr_FR/tom/medium/samples/speaker_0.mp3?download=true",
      "https://huggingface.co/rhasspy/piper-voices/resolve/v1.0.0/fr/fr_FR/tom/medium/MODEL_CARD?download=true"
    ],
    "upmc - medium": [
      "22050",
      "fr_FR",
      "https://huggingface.co/rhasspy/piper-voices/resolve/v1.0.0/fr/fr_FR/upmc/medium/fr_FR-upmc-medium.onnx?download=true",
      "https://huggingface.co/rhasspy/piper-voices/resolve/v1.0.0/fr/fr_FR/upmc/medium/fr_FR-upmc-medium.onnx.json?download=true.json",
      "fr_FR-upmc-medium.onnx",
      "https://huggingface.co/rhasspy/piper-voices/resolve/v1.0.0/fr/fr_FR/upmc/medium/samples/speaker_0.mp3?download=true",
      "https://huggingface.co/rhasspy/piper-voices/resolve/v1.0.0/fr/fr_FR/upmc/medium/MODEL_CARD?download=true"
    ]
  },
  "Hungarian (Magyar)": {
    "anna - medium": [
      "22050",
      "hu_HU",
      "https://huggingface.co/rhasspy/piper-voices/resolve/v1.0.0/hu/hu_HU/anna/medium/hu_HU-anna-medium.onnx?download=true",
      "https://huggingface.co/rhasspy/piper-voices/resolve/v1.0.0/hu/hu_HU/anna/medium/hu_HU-anna-medium.onnx.json?download=true.json",
      "hu_HU-anna-medium.onnx",
      "https://huggingface.co/rhasspy/piper-voices/resolve/v1.0.0/hu/hu_HU/anna/medium/samples/speaker_0.mp3?download=true",
      "https://huggingface.co/rhasspy/piper-voices/resolve/v1.0.0/hu/hu_HU/anna/medium/MODEL_CARD?download=true"
    ],
    "berta - medium": [
      "22050",
      "hu_HU",
      "https://huggingface.co/rhasspy/piper-voices/resolve/v1.0.0/hu/hu_HU/berta/medium/hu_HU-berta-medium.onnx?download=true",
      "https://huggingface.co/rhasspy/piper-voices/resolve/v1.0.0/hu/hu_HU/berta/medium/hu_HU-berta-medium.onnx.json?download=true.json",
      "hu_HU-berta-medium.onnx",
      "https://huggingface.co/rhasspy/piper-voices/resolve/v1.0.0/hu/hu_HU/berta/medium/samples/speaker_0.mp3?download=true",
      "https://huggingface.co/rhasspy/piper-voices/resolve/v1.0.0/hu/hu_HU/berta/medium/MODEL_CARD?download=true"
    ],
    "imre - medium": [
      "22050",
      "hu_HU",
      "https://huggingface.co/rhasspy/piper-voices/resolve/v1.0.0/hu/hu_HU/imre/medium/hu_HU-imre-medium.onnx?download=true",
      "https://huggingface.co/rhasspy/piper-voices/resolve/v1.0.0/hu/hu_HU/imre/medium/hu_HU-imre-medium.onnx.json?download=true.json",
      "hu_HU-imre-medium.onnx",
      "https://huggingface.co/rhasspy/piper-voices/resolve/v1.0.0/hu/hu_HU/imre/medium/samples/speaker_0.mp3?download=true",
      "https://huggingface.co/rhasspy/piper-voices/resolve/v1.0.0/hu/hu_HU/imre/medium/MODEL_CARD?download=true"
    ]
  },
  "Icelandic (\u00edslenska)": {
    "bui - medium": [
      "22050",
      "is_IS",
      "https://huggingface.co/rhasspy/piper-voices/resolve/v1.0.0/is/is_IS/bui/medium/is_IS-bui-medium.onnx?download=true",
      "https://huggingface.co/rhasspy/piper-voices/resolve/v1.0.0/is/is_IS/bui/medium/is_IS-bui-medium.onnx.json?download=true.json",
      "is_IS-bui-medium.onnx",
      "https://huggingface.co/rhasspy/piper-voices/resolve/v1.0.0/is/is_IS/bui/medium/samples/speaker_0.mp3?download=true",
      "https://huggingface.co/rhasspy/piper-voices/resolve/v1.0.0/is/is_IS/bui/medium/MODEL_CARD?download=true"
    ],
    "salka - medium": [
      "22050",
      "is_IS",
      "https://huggingface.co/rhasspy/piper-voices/resolve/v1.0.0/is/is_IS/salka/medium/is_IS-salka-medium.onnx?download=true",
      "https://huggingface.co/rhasspy/piper-voices/resolve/v1.0.0/is/is_IS/salka/medium/is_IS-salka-medium.onnx.json?download=true.json",
      "is_IS-salka-medium.onnx",
      "https://huggingface.co/rhasspy/piper-voices/resolve/v1.0.0/is/is_IS/salka/medium/samples/speaker_0.mp3?download=true",
      "https://huggingface.co/rhasspy/piper-voices/resolve/v1.0.0/is/is_IS/salka/medium/MODEL_CARD?download=true"
    ],
    "steinn - medium": [
      "22050",
      "is_IS",
      "https://huggingface.co/rhasspy/piper-voices/resolve/v1.0.0/is/is_IS/steinn/medium/is_IS-steinn-medium.onnx?download=true",
      "https://huggingface.co/rhasspy/piper-voices/resolve/v1.0.0/is/is_IS/steinn/medium/is_IS-steinn-medium.onnx.json?download=true.json",
      "is_IS-steinn-medium.onnx",
      "https://huggingface.co/rhasspy/piper-voices/resolve/v1.0.0/is/is_IS/steinn/medium/samples/speaker_0.mp3?download=true",
      "https://huggingface.co/rhasspy/piper-voices/resolve/v1.0.0/is/is_IS/steinn/medium/MODEL_CARD?download=true"
    ],
    "ugla - medium": [
      "22050",
      "is_IS",
      "https://huggingface.co/rhasspy/piper-voices/resolve/v1.0.0/is/is_IS/ugla/medium/is_IS-ugla-medium.onnx?download=true",
      "https://huggingface.co/rhasspy/piper-voices/resolve/v1.0.0/is/is_IS/ugla/medium/is_IS-ugla-medium.onnx.json?download=true.json",
      "is_IS-ugla-medium.onnx",
      "https://huggingface.co/rhasspy/piper-voices/resolve/v1.0.0/is/is_IS/ugla/medium/samples/speaker_0.mp3?download=true",
      "https://huggingface.co/rhasspy/piper-voices/resolve/v1.0.0/is/is_IS/ugla/medium/MODEL_CARD?download=true"
    ]
  },
  "Italian (Italiano)": {
    "paola - medium": [
      "22050",
      "it_IT",
      "https://huggingface.co/rhasspy/piper-voices/resolve/v1.0.0/it/it_IT/paola/medium/it_IT-paola-medium.onnx?download=true",
      "https://huggingface.co/rhasspy/piper-voices/resolve/v1.0.0/it/it_IT/paola/medium/it_IT-paola-medium.onnx.json?download=true.json",
      "it_IT-paola-medium.onnx",
      "https://huggingface.co/rhasspy/piper-voices/resolve/v1.0.0/it/it_IT/paola/medium/samples/speaker_0.mp3?download=true",
      "https://huggingface.co/rhasspy/piper-voices/resolve/v1.0.0/it/it_IT/paola/medium/MODEL_CARD?download=true"
    ],
    "riccardo - x_low": [
      "16000",
      "it_IT",
      "https://huggingface.co/rhasspy/piper-voices/resolve/v1.0.0/it/it_IT/riccardo/x_low/it_IT-riccardo-x_low.onnx?download=true",
      "https://huggingface.co/rhasspy/piper-voices/resolve/v1.0.0/it/it_IT/riccardo/x_low/it_IT-riccardo-x_low.onnx.json?download=true.json",
      "it_IT-riccardo-x_low.onnx",
      "https://huggingface.co/rhasspy/piper-voices/resolve/v1.0.0/it/it_IT/riccardo/x_low/samples/speaker_0.mp3?download=true",
      "https://huggingface.co/rhasspy/piper-voices/resolve/v1.0.0/it/it_IT/riccardo/x_low/MODEL_CARD?download=true"
    ]
  },
  "Georgian (\u10e5\u10d0\u10e0\u10d7\u10e3\u10da\u10d8 \u10d4\u10dc\u10d0)": {
    "natia - medium": [
      "22050",
      "ka_GE",
      "https://huggingface.co/rhasspy/piper-voices/resolve/v1.0.0/ka/ka_GE/natia/medium/ka_GE-natia-medium.onnx?download=true",
      "https://huggingface.co/rhasspy/piper-voices/resolve/v1.0.0/ka/ka_GE/natia/medium/ka_GE-natia-medium.onnx.json?download=true.json",
      "ka_GE-natia-medium.onnx",
      "https://huggingface.co/rhasspy/piper-voices/resolve/v1.0.0/ka/ka_GE/natia/medium/samples/speaker_0.mp3?download=true",
      "https://huggingface.co/rhasspy/piper-voices/resolve/v1.0.0/ka/ka_GE/natia/medium/MODEL_CARD?download=true"
    ]
  },
  "Kazakh (\u049b\u0430\u0437\u0430\u049b\u0448\u0430)": {
    "iseke - x_low": [
      "16000",
      "kk_KZ",
      "https://huggingface.co/rhasspy/piper-voices/resolve/v1.0.0/kk/kk_KZ/iseke/x_low/kk_KZ-iseke-x_low.onnx?download=true",
      "https://huggingface.co/rhasspy/piper-voices/resolve/v1.0.0/kk/kk_KZ/iseke/x_low/kk_KZ-iseke-x_low.onnx.json?download=true.json",
      "kk_KZ-iseke-x_low.onnx",
      "https://huggingface.co/rhasspy/piper-voices/resolve/v1.0.0/kk/kk_KZ/iseke/x_low/samples/speaker_0.mp3?download=true",
      "https://huggingface.co/rhasspy/piper-voices/resolve/v1.0.0/kk/kk_KZ/iseke/x_low/MODEL_CARD?download=true"
    ],
    "issai - high": [
      "22050",
      "kk_KZ",
      "https://huggingface.co/rhasspy/piper-voices/resolve/v1.0.0/kk/kk_KZ/issai/high/kk_KZ-issai-high.onnx?download=true",
      "https://huggingface.co/rhasspy/piper-voices/resolve/v1.0.0/kk/kk_KZ/issai/high/kk_KZ-issai-high.onnx.json?download=true.json",
      "kk_KZ-issai-high.onnx",
      "https://huggingface.co/rhasspy/piper-voices/resolve/v1.0.0/kk/kk_KZ/issai/high/samples/speaker_0.mp3?download=true",
      "https://huggingface.co/rhasspy/piper-voices/resolve/v1.0.0/kk/kk_KZ/issai/high/MODEL_CARD?download=true"
    ],
    "raya - x_low": [
      "16000",
      "kk_KZ",
      "https://huggingface.co/rhasspy/piper-voices/resolve/v1.0.0/kk/kk_KZ/raya/x_low/kk_KZ-raya-x_low.onnx?download=true",
      "https://huggingface.co/rhasspy/piper-voices/resolve/v1.0.0/kk/kk_KZ/raya/x_low/kk_KZ-raya-x_low.onnx.json?download=true.json",
      "kk_KZ-raya-x_low.onnx",
      "https://huggingface.co/rhasspy/piper-voices/resolve/v1.0.0/kk/kk_KZ/raya/x_low/samples/speaker_0.mp3?download=true",
      "https://huggingface.co/rhasspy/piper-voices/resolve/v1.0.0/kk/kk_KZ/raya/x_low/MODEL_CARD?download=true"
    ]
  },
  "Luxembourgish (L\u00ebtzebuergesch)": {
    "marylux - medium": [
      "22050",
      "lb_LU",
      "https://huggingface.co/rhasspy/piper-voices/resolve/v1.0.0/lb/lb_LU/marylux/medium/lb_LU-marylux-medium.onnx?download=true",
      "https://huggingface.co/rhasspy/piper-voices/resolve/v1.0.0/lb/lb_LU/marylux/medium/lb_LU-marylux-medium.onnx.json?download=true.json",
      "lb_LU-marylux-medium.onnx",
      "https://huggingface.co/rhasspy/piper-voices/resolve/v1.0.0/lb/lb_LU/marylux/medium/samples/speaker_0.mp3?download=true",
      "https://huggingface.co/rhasspy/piper-voices/resolve/v1.0.0/lb/lb_LU/marylux/medium/MODEL_CARD?download=true"
    ]
  },
  "Nepali (\u0928\u0947\u092a\u093e\u0932\u0940)": {
    "google - x_low": [
      "16000",
      "ne_NP",
      "https://huggingface.co/rhasspy/piper-voices/resolve/v1.0.0/ne/ne_NP/google/x_low/ne_NP-google-x_low.onnx?download=true",
      "https://huggingface.co/rhasspy/piper-voices/resolve/v1.0.0/ne/ne_NP/google/x_low/ne_NP-google-x_low.onnx.json?download=true.json",
      "ne_NP-google-x_low.onnx",
      "https://huggingface.co/rhasspy/piper-voices/resolve/v1.0.0/ne/ne_NP/google/x_low/samples/speaker_0.mp3?download=true",
      "https://huggingface.co/rhasspy/piper-voices/resolve/v1.0.0/ne/ne_NP/google/x_low/MODEL_CARD?download=true"
    ],
    "google - medium": [
      "22050",
      "ne_NP",
      "https://huggingface.co/rhasspy/piper-voices/resolve/v1.0.0/ne/ne_NP/google/medium/ne_NP-google-medium.onnx?download=true",
      "https://huggingface.co/rhasspy/piper-voices/resolve/v1.0.0/ne/ne_NP/google/medium/ne_NP-google-medium.onnx.json?download=true.json",
      "ne_NP-google-medium.onnx",
      "https://huggingface.co/rhasspy/piper-voices/resolve/v1.0.0/ne/ne_NP/google/medium/samples/speaker_0.mp3?download=true",
      "https://huggingface.co/rhasspy/piper-voices/resolve/v1.0.0/ne/ne_NP/google/medium/MODEL_CARD?download=true"
    ]
  },
  "Dutch (Nederlands)": {
    "mls - medium": [
      "22050",
      "nl_NL",
      "https://huggingface.co/rhasspy/piper-voices/resolve/v1.0.0/nl/nl_NL/mls/medium/nl_NL-mls-medium.onnx?download=true",
      "https://huggingface.co/rhasspy/piper-voices/resolve/v1.0.0/nl/nl_NL/mls/medium/nl_NL-mls-medium.onnx.json?download=true.json",
      "nl_NL-mls-medium.onnx",
      "https://huggingface.co/rhasspy/piper-voices/resolve/v1.0.0/nl/nl_NL/mls/medium/samples/speaker_0.mp3?download=true",
      "https://huggingface.co/rhasspy/piper-voices/resolve/v1.0.0/nl/nl_NL/mls/medium/MODEL_CARD?download=true"
    ],
    "mls_5809 - low": [
      "16000",
      "nl_NL",
      "https://huggingface.co/rhasspy/piper-voices/resolve/v1.0.0/nl/nl_NL/mls_5809/low/nl_NL-mls_5809-low.onnx?download=true",
      "https://huggingface.co/rhasspy/piper-voices/resolve/v1.0.0/nl/nl_NL/mls_5809/low/nl_NL-mls_5809-low.onnx.json?download=true.json",
      "nl_NL-mls_5809-low.onnx",
      "https://huggingface.co/rhasspy/piper-voices/resolve/v1.0.0/nl/nl_NL/mls_5809/low/samples/speaker_0.mp3?download=true",
      "https://huggingface.co/rhasspy/piper-voices/resolve/v1.0.0/nl/nl_NL/mls_5809/low/MODEL_CARD?download=true"
    ],
    "mls_7432 - low": [
      "16000",
      "nl_NL",
      "https://huggingface.co/rhasspy/piper-voices/resolve/v1.0.0/nl/nl_NL/mls_7432/low/nl_NL-mls_7432-low.onnx?download=true",
      "https://huggingface.co/rhasspy/piper-voices/resolve/v1.0.0/nl/nl_NL/mls_7432/low/nl_NL-mls_7432-low.onnx.json?download=true.json",
      "nl_NL-mls_7432-low.onnx",
      "https://huggingface.co/rhasspy/piper-voices/resolve/v1.0.0/nl/nl_NL/mls_7432/low/samples/speaker_0.mp3?download=true",
      "https://huggingface.co/rhasspy/piper-voices/resolve/v1.0.0/nl/nl_NL/mls_7432/low/MODEL_CARD?download=true"
    ]
  },
  "Norwegian (Norsk)": {
    "talesyntese - medium": [
      "22050",
      "no_NO",
      "https://huggingface.co/rhasspy/piper-voices/resolve/v1.0.0/no/no_NO/talesyntese/medium/no_NO-talesyntese-medium.onnx?download=true",
      "https://huggingface.co/rhasspy/piper-voices/resolve/v1.0.0/no/no_NO/talesyntese/medium/no_NO-talesyntese-medium.onnx.json?download=true.json",
      "no_NO-talesyntese-medium.onnx",
      "https://huggingface.co/rhasspy/piper-voices/resolve/v1.0.0/no/no_NO/talesyntese/medium/samples/speaker_0.mp3?download=true",
      "https://huggingface.co/rhasspy/piper-voices/resolve/v1.0.0/no/no_NO/talesyntese/medium/MODEL_CARD?download=true"
    ]
  },
  "Polish (Polski)": {
    "darkman - medium": [
      "22050",
      "pl_PL",
      "https://huggingface.co/rhasspy/piper-voices/resolve/v1.0.0/pl/pl_PL/darkman/medium/pl_PL-darkman-medium.onnx?download=true",
      "https://huggingface.co/rhasspy/piper-voices/resolve/v1.0.0/pl/pl_PL/darkman/medium/pl_PL-darkman-medium.onnx.json?download=true.json",
      "pl_PL-darkman-medium.onnx",
      "https://huggingface.co/rhasspy/piper-voices/resolve/v1.0.0/pl/pl_PL/darkman/medium/samples/speaker_0.mp3?download=true",
      "https://huggingface.co/rhasspy/piper-voices/resolve/v1.0.0/pl/pl_PL/darkman/medium/MODEL_CARD?download=true"
    ],
    "gosia - medium": [
      "22050",
      "pl_PL",
      "https://huggingface.co/rhasspy/piper-voices/resolve/v1.0.0/pl/pl_PL/gosia/medium/pl_PL-gosia-medium.onnx?download=true",
      "https://huggingface.co/rhasspy/piper-voices/resolve/v1.0.0/pl/pl_PL/gosia/medium/pl_PL-gosia-medium.onnx.json?download=true.json",
      "pl_PL-gosia-medium.onnx",
      "https://huggingface.co/rhasspy/piper-voices/resolve/v1.0.0/pl/pl_PL/gosia/medium/samples/speaker_0.mp3?download=true",
      "https://huggingface.co/rhasspy/piper-voices/resolve/v1.0.0/pl/pl_PL/gosia/medium/MODEL_CARD?download=true"
    ],
    "mc_speech - medium": [
      "22050",
      "pl_PL",
      "https://huggingface.co/rhasspy/piper-voices/resolve/v1.0.0/pl/pl_PL/mc_speech/medium/pl_PL-mc_speech-medium.onnx?download=true",
      "https://huggingface.co/rhasspy/piper-voices/resolve/v1.0.0/pl/pl_PL/mc_speech/medium/pl_PL-mc_speech-medium.onnx.json?download=true.json",
      "pl_PL-mc_speech-medium.onnx",
      "https://huggingface.co/rhasspy/piper-voices/resolve/v1.0.0/pl/pl_PL/mc_speech/medium/samples/speaker_0.mp3?download=true",
      "https://huggingface.co/rhasspy/piper-voices/resolve/v1.0.0/pl/pl_PL/mc_speech/medium/MODEL_CARD?download=true"
    ],
    "mls_6892 - low": [
      "16000",
      "pl_PL",
      "https://huggingface.co/rhasspy/piper-voices/resolve/v1.0.0/pl/pl_PL/mls_6892/low/pl_PL-mls_6892-low.onnx?download=true",
      "https://huggingface.co/rhasspy/piper-voices/resolve/v1.0.0/pl/pl_PL/mls_6892/low/pl_PL-mls_6892-low.onnx.json?download=true.json",
      "pl_PL-mls_6892-low.onnx",
      "https://huggingface.co/rhasspy/piper-voices/resolve/v1.0.0/pl/pl_PL/mls_6892/low/samples/speaker_0.mp3?download=true",
      "https://huggingface.co/rhasspy/piper-voices/resolve/v1.0.0/pl/pl_PL/mls_6892/low/MODEL_CARD?download=true"
    ]
  },
  "Portuguese (Portugu\u00eas)": {
    "tug\u00e3o - medium": [
      "22050",
      "pt_PT",
      "https://huggingface.co/rhasspy/piper-voices/resolve/v1.0.0/pt/pt_PT/tug\u00e3o/medium/pt_PT-tug\u00e3o-medium.onnx?download=true",
      "https://huggingface.co/rhasspy/piper-voices/resolve/v1.0.0/pt/pt_PT/tug\u00e3o/medium/pt_PT-tug\u00e3o-medium.onnx.json?download=true.json",
      "pt_PT-tug\u00e3o-medium.onnx",
      "https://huggingface.co/rhasspy/piper-voices/resolve/v1.0.0/pt/pt_PT/tug\u00e3o/medium/samples/speaker_0.mp3?download=true",
      "https://huggingface.co/rhasspy/piper-voices/resolve/v1.0.0/pt/pt_PT/tug\u00e3o/medium/MODEL_CARD?download=true"
    ]
  },
  "Romanian (Rom\u00e2n\u0103)": {
    "mihai - medium": [
      "22050",
      "ro_RO",
      "https://huggingface.co/rhasspy/piper-voices/resolve/v1.0.0/ro/ro_RO/mihai/medium/ro_RO-mihai-medium.onnx?download=true",
      "https://huggingface.co/rhasspy/piper-voices/resolve/v1.0.0/ro/ro_RO/mihai/medium/ro_RO-mihai-medium.onnx.json?download=true.json",
      "ro_RO-mihai-medium.onnx",
      "https://huggingface.co/rhasspy/piper-voices/resolve/v1.0.0/ro/ro_RO/mihai/medium/samples/speaker_0.mp3?download=true",
      "https://huggingface.co/rhasspy/piper-voices/resolve/v1.0.0/ro/ro_RO/mihai/medium/MODEL_CARD?download=true"
    ]
  },
  "Russian (\u0420\u0443\u0441\u0441\u043a\u0438\u0439)": {
    "denis - medium": [
      "22050",
      "ru_RU",
      "https://huggingface.co/rhasspy/piper-voices/resolve/v1.0.0/ru/ru_RU/denis/medium/ru_RU-denis-medium.onnx?download=true",
      "https://huggingface.co/rhasspy/piper-voices/resolve/v1.0.0/ru/ru_RU/denis/medium/ru_RU-denis-medium.onnx.json?download=true.json",
      "ru_RU-denis-medium.onnx",
      "https://huggingface.co/rhasspy/piper-voices/resolve/v1.0.0/ru/ru_RU/denis/medium/samples/speaker_0.mp3?download=true",
      "https://huggingface.co/rhasspy/piper-voices/resolve/v1.0.0/ru/ru_RU/denis/medium/MODEL_CARD?download=true"
    ],
    "dmitri - medium": [
      "22050",
      "ru_RU",
      "https://huggingface.co/rhasspy/piper-voices/resolve/v1.0.0/ru/ru_RU/dmitri/medium/ru_RU-dmitri-medium.onnx?download=true",
      "https://huggingface.co/rhasspy/piper-voices/resolve/v1.0.0/ru/ru_RU/dmitri/medium/ru_RU-dmitri-medium.onnx.json?download=true.json",
      "ru_RU-dmitri-medium.onnx",
      "https://huggingface.co/rhasspy/piper-voices/resolve/v1.0.0/ru/ru_RU/dmitri/medium/samples/speaker_0.mp3?download=true",
      "https://huggingface.co/rhasspy/piper-voices/resolve/v1.0.0/ru/ru_RU/dmitri/medium/MODEL_CARD?download=true"
    ],
    "irina - medium": [
      "22050",
      "ru_RU",
      "https://huggingface.co/rhasspy/piper-voices/resolve/v1.0.0/ru/ru_RU/irina/medium/ru_RU-irina-medium.onnx?download=true",
      "https://huggingface.co/rhasspy/piper-voices/resolve/v1.0.0/ru/ru_RU/irina/medium/ru_RU-irina-medium.onnx.json?download=true.json",
      "ru_RU-irina-medium.onnx",
      "https://huggingface.co/rhasspy/piper-voices/resolve/v1.0.0/ru/ru_RU/irina/medium/samples/speaker_0.mp3?download=true",
      "https://huggingface.co/rhasspy/piper-voices/resolve/v1.0.0/ru/ru_RU/irina/medium/MODEL_CARD?download=true"
    ],
    "ruslan - medium": [
      "22050",
      "ru_RU",
      "https://huggingface.co/rhasspy/piper-voices/resolve/v1.0.0/ru/ru_RU/ruslan/medium/ru_RU-ruslan-medium.onnx?download=true",
      "https://huggingface.co/rhasspy/piper-voices/resolve/v1.0.0/ru/ru_RU/ruslan/medium/ru_RU-ruslan-medium.onnx.json?download=true.json",
      "ru_RU-ruslan-medium.onnx",
      "https://huggingface.co/rhasspy/piper-voices/resolve/v1.0.0/ru/ru_RU/ruslan/medium/samples/speaker_0.mp3?download=true",
      "https://huggingface.co/rhasspy/piper-voices/resolve/v1.0.0/ru/ru_RU/ruslan/medium/MODEL_CARD?download=true"
    ]
  },
  "Slovak (Sloven\u010dina)": {
    "lili - medium": [
      "22050",
      "sk_SK",
      "https://huggingface.co/rhasspy/piper-voices/resolve/v1.0.0/sk/sk_SK/lili/medium/sk_SK-lili-medium.onnx?download=true",
      "https://huggingface.co/rhasspy/piper-voices/resolve/v1.0.0/sk/sk_SK/lili/medium/sk_SK-lili-medium.onnx.json?download=true.json",
      "sk_SK-lili-medium.onnx",
      "https://huggingface.co/rhasspy/piper-voices/resolve/v1.0.0/sk/sk_SK/lili/medium/samples/speaker_0.mp3?download=true",
      "https://huggingface.co/rhasspy/piper-voices/resolve/v1.0.0/sk/sk_SK/lili/medium/MODEL_CARD?download=true"
    ]
  },
  "Slovenian (Sloven\u0161\u010dina)": {
    "artur - medium": [
      "22050",
      "sl_SI",
      "https://huggingface.co/rhasspy/piper-voices/resolve/v1.0.0/sl/sl_SI/artur/medium/sl_SI-artur-medium.onnx?download=true",
      "https://huggingface.co/rhasspy/piper-voices/resolve/v1.0.0/sl/sl_SI/artur/medium/sl_SI-artur-medium.onnx.json?download=true.json",
      "sl_SI-artur-medium.onnx",
      "https://huggingface.co/rhasspy/piper-voices/resolve/v1.0.0/sl/sl_SI/artur/medium/samples/speaker_0.mp3?download=true",
      "https://huggingface.co/rhasspy/piper-voices/resolve/v1.0.0/sl/sl_SI/artur/medium/MODEL_CARD?download=true"
    ]
  },
  "Serbian (srpski)": {
    "serbski_institut - medium": [
      "22050",
      "sr_RS",
      "https://huggingface.co/rhasspy/piper-voices/resolve/v1.0.0/sr/sr_RS/serbski_institut/medium/sr_RS-serbski_institut-medium.onnx?download=true",
      "https://huggingface.co/rhasspy/piper-voices/resolve/v1.0.0/sr/sr_RS/serbski_institut/medium/sr_RS-serbski_institut-medium.onnx.json?download=true.json",
      "sr_RS-serbski_institut-medium.onnx",
      "https://huggingface.co/rhasspy/piper-voices/resolve/v1.0.0/sr/sr_RS/serbski_institut/medium/samples/speaker_0.mp3?download=true",
      "https://huggingface.co/rhasspy/piper-voices/resolve/v1.0.0/sr/sr_RS/serbski_institut/medium/MODEL_CARD?download=true"
    ]
  },
  "Swedish (Svenska)": {
    "nst - medium": [
      "22050",
      "sv_SE",
      "https://huggingface.co/rhasspy/piper-voices/resolve/v1.0.0/sv/sv_SE/nst/medium/sv_SE-nst-medium.onnx?download=true",
      "https://huggingface.co/rhasspy/piper-voices/resolve/v1.0.0/sv/sv_SE/nst/medium/sv_SE-nst-medium.onnx.json?download=true.json",
      "sv_SE-nst-medium.onnx",
      "https://huggingface.co/rhasspy/piper-voices/resolve/v1.0.0/sv/sv_SE/nst/medium/samples/speaker_0.mp3?download=true",
      "https://huggingface.co/rhasspy/piper-voices/resolve/v1.0.0/sv/sv_SE/nst/medium/MODEL_CARD?download=true"
    ]
  },
  "Swahili (Kiswahili)": {
    "lanfrica - medium": [
      "22050",
      "sw_CD",
      "https://huggingface.co/rhasspy/piper-voices/resolve/v1.0.0/sw/sw_CD/lanfrica/medium/sw_CD-lanfrica-medium.onnx?download=true",
      "https://huggingface.co/rhasspy/piper-voices/resolve/v1.0.0/sw/sw_CD/lanfrica/medium/sw_CD-lanfrica-medium.onnx.json?download=true.json",
      "sw_CD-lanfrica-medium.onnx",
      "https://huggingface.co/rhasspy/piper-voices/resolve/v1.0.0/sw/sw_CD/lanfrica/medium/samples/speaker_0.mp3?download=true",
      "https://huggingface.co/rhasspy/piper-voices/resolve/v1.0.0/sw/sw_CD/lanfrica/medium/MODEL_CARD?download=true"
    ]
  },
  "Turkish (T\u00fcrk\u00e7e)": {
    "dfki - medium": [
      "22050",
      "tr_TR",
      "https://huggingface.co/rhasspy/piper-voices/resolve/v1.0.0/tr/tr_TR/dfki/medium/tr_TR-dfki-medium.onnx?download=true",
      "https://huggingface.co/rhasspy/piper-voices/resolve/v1.0.0/tr/tr_TR/dfki/medium/tr_TR-dfki-medium.onnx.json?download=true.json",
      "tr_TR-dfki-medium.onnx",
      "https://huggingface.co/rhasspy/piper-voices/resolve/v1.0.0/tr/tr_TR/dfki/medium/samples/speaker_0.mp3?download=true",
      "https://huggingface.co/rhasspy/piper-voices/resolve/v1.0.0/tr/tr_TR/dfki/medium/MODEL_CARD?download=true"
    ],
    "fahrettin - medium": [
      "22050",
      "tr_TR",
      "https://huggingface.co/rhasspy/piper-voices/resolve/v1.0.0/tr/tr_TR/fahrettin/medium/tr_TR-fahrettin-medium.onnx?download=true",
      "https://huggingface.co/rhasspy/piper-voices/resolve/v1.0.0/tr/tr_TR/fahrettin/medium/tr_TR-fahrettin-medium.onnx.json?download=true.json",
      "tr_TR-fahrettin-medium.onnx",
      "https://huggingface.co/rhasspy/piper-voices/resolve/v1.0.0/tr/tr_TR/fahrettin/medium/samples/speaker_0.mp3?download=true",
      "https://huggingface.co/rhasspy/piper-voices/resolve/v1.0.0/tr/tr_TR/fahrettin/medium/MODEL_CARD?download=true"
    ],
    "fettah - medium": [
      "22050",
      "tr_TR",
      "https://huggingface.co/rhasspy/piper-voices/resolve/v1.0.0/tr/tr_TR/fettah/medium/tr_TR-fettah-medium.onnx?download=true",
      "https://huggingface.co/rhasspy/piper-voices/resolve/v1.0.0/tr/tr_TR/fettah/medium/tr_TR-fettah-medium.onnx.json?download=true.json",
      "tr_TR-fettah-medium.onnx",
      "https://huggingface.co/rhasspy/piper-voices/resolve/v1.0.0/tr/tr_TR/fettah/medium/samples/speaker_0.mp3?download=true",
      "https://huggingface.co/rhasspy/piper-voices/resolve/v1.0.0/tr/tr_TR/fettah/medium/MODEL_CARD?download=true"
    ]
  },
  "Ukrainian (\u0443\u043a\u0440\u0430\u0457\u0301\u043d\u0441\u044c\u043a\u0430 \u043c\u043e\u0301\u0432\u0430)": {
    "lada - x_low": [
      "16000",
      "uk_UA",
      "https://huggingface.co/rhasspy/piper-voices/resolve/v1.0.0/uk/uk_UA/lada/x_low/uk_UA-lada-x_low.onnx?download=true",
      "https://huggingface.co/rhasspy/piper-voices/resolve/v1.0.0/uk/uk_UA/lada/x_low/uk_UA-lada-x_low.onnx.json?download=true.json",
      "uk_UA-lada-x_low.onnx",
      "https://huggingface.co/rhasspy/piper-voices/resolve/v1.0.0/uk/uk_UA/lada/x_low/samples/speaker_0.mp3?download=true",
      "https://huggingface.co/rhasspy/piper-voices/resolve/v1.0.0/uk/uk_UA/lada/x_low/MODEL_CARD?download=true"
    ],
    "ukrainian_tts - medium": [
      "22050",
      "uk_UA",
      "https://huggingface.co/rhasspy/piper-voices/resolve/v1.0.0/uk/uk_UA/ukrainian_tts/medium/uk_UA-ukrainian_tts-medium.onnx?download=true",
      "https://huggingface.co/rhasspy/piper-voices/resolve/v1.0.0/uk/uk_UA/ukrainian_tts/medium/uk_UA-ukrainian_tts-medium.onnx.json?download=true.json",
      "uk_UA-ukrainian_tts-medium.onnx",
      "https://huggingface.co/rhasspy/piper-voices/resolve/v1.0.0/uk/uk_UA/ukrainian_tts/medium/samples/speaker_0.mp3?download=true",
      "https://huggingface.co/rhasspy/piper-voices/resolve/v1.0.0/uk/uk_UA/ukrainian_tts/medium/MODEL_CARD?download=true"
    ]
  },
  "Vietnamese (Ti\u1ebfng Vi\u1ec7t)": {
    "25hours_single - low": [
      "16000",
      "vi_VN",
      "https://huggingface.co/rhasspy/piper-voices/resolve/v1.0.0/vi/vi_VN/25hours_single/low/vi_VN-25hours_single-low.onnx?download=true",
      "https://huggingface.co/rhasspy/piper-voices/resolve/v1.0.0/vi/vi_VN/25hours_single/low/vi_VN-25hours_single-low.onnx.json?download=true.json",
      "vi_VN-25hours_single-low.onnx",
      "https://huggingface.co/rhasspy/piper-voices/resolve/v1.0.0/vi/vi_VN/25hours_single/low/samples/speaker_0.mp3?download=true",
      "https://huggingface.co/rhasspy/piper-voices/resolve/v1.0.0/vi/vi_VN/25hours_single/low/MODEL_CARD?download=true"
    ],
    "vais1000 - medium": [
      "22050",
      "vi_VN",
      "https://huggingface.co/rhasspy/piper-voices/resolve/v1.0.0/vi/vi_VN/vais1000/medium/vi_VN-vais1000-medium.onnx?download=true",
      "https://huggingface.co/rhasspy/piper-voices/resolve/v1.0.0/vi/vi_VN/vais1000/medium/vi_VN-vais1000-medium.onnx.json?download=true.json",
      "vi_VN-vais1000-medium.onnx",
      "https://huggingface.co/rhasspy/piper-voices/resolve/v1.0.0/vi/vi_VN/vais1000/medium/samples/speaker_0.mp3?download=true",
      "https://huggingface.co/rhasspy/piper-voices/resolve/v1.0.0/vi/vi_VN/vais1000/medium/MODEL_CARD?download=true"
    ],
    "vivos - x_low": [
      "16000",
      "vi_VN",
      "https://huggingface.co/rhasspy/piper-voices/resolve/v1.0.0/vi/vi_VN/vivos/x_low/vi_VN-vivos-x_low.onnx?download=true",
      "https://huggingface.co/rhasspy/piper-voices/resolve/v1.0.0/vi/vi_VN/vivos/x_low/vi_VN-vivos-x_low.onnx.json?download=true.json",
      "vi_VN-vivos-x_low.onnx",
      "https://huggingface.co/rhasspy/piper-voices/resolve/v1.0.0/vi/vi_VN/vivos/x_low/samples/speaker_0.mp3?download=true",
      "https://huggingface.co/rhasspy/piper-voices/resolve/v1.0.0/vi/vi_VN/vivos/x_low/MODEL_CARD?download=true"
    ]
  },
  "Chinese (\u7b80\u4f53\u4e2d\u6587)": {
    "huayan - x_low": [
      "16000",
      "zh_CN",
      "https://huggingface.co/rhasspy/piper-voices/resolve/v1.0.0/zh/zh_CN/huayan/x_low/zh_CN-huayan-x_low.onnx?download=true",
      "https://huggingface.co/rhasspy/piper-voices/resolve/v1.0.0/zh/zh_CN/huayan/x_low/zh_CN-huayan-x_low.onnx.json?download=true.json",
      "zh_CN-huayan-x_low.onnx",
      "https://huggingface.co/rhasspy/piper-voices/resolve/v1.0.0/zh/zh_CN/huayan/x_low/samples/speaker_0.mp3?download=true",
      "https://huggingface.co/rhasspy/piper-voices/resolve/v1.0.0/zh/zh_CN/huayan/x_low/MODEL_CARD?download=true"
    ],
    "huayan - medium": [
      "22050",
      "zh_CN",
      "https://huggingface.co/rhasspy/piper-voices/resolve/v1.0.0/zh/zh_CN/huayan/medium/zh_CN-huayan-medium.onnx?download=true",
      "https://huggingface.co/rhasspy/piper-voices/resolve/v1.0.0/zh/zh_CN/huayan/medium/zh_CN-huayan-medium.onnx.json?download=true.json",
      "zh_CN-huayan-medium.onnx",
      "https://huggingface.co/rhasspy/piper-voices/resolve/v1.0.0/zh/zh_CN/huayan/medium/samples/speaker_0.mp3?download=true",
      "https://huggingface.co/rhasspy/piper-voices/resolve/v1.0.0/zh/zh_CN/huayan/medium/MODEL_CARD?download=true"
    ]
  }
} ;

Map<String, String> languageCodes = {
  "ar_JO": "Arabic (\u0627\u0644\u0639\u0631\u0628\u064a\u0629)",
  "ca_ES": "Catalan (Catal\u00e0)",
  "cs_CZ": "Czech (\u010ce\u0161tina)",
  "cy_GB": "Welsh (Cymraeg)",
  "da_DK": "Danish (Dansk)",
  "de_DE": "German (Deutsch)",
  "el_GR": "Greek (\u0395\u03bb\u03bb\u03b7\u03bd\u03b9\u03ba\u03ac)",
  "en_GB": "English (GB)",
  "en_US": "English (US)",
  "es_ES": "Spanish (Espa\u00f1ol)",
  "es_MX": "Spanish (Espa\u00f1ol)",
  "fa_IR": "Farsi (\u0641\u0627\u0631\u0633\u06cc)",
  "fi_FI": "Finnish (Suomi)",
  "fr_FR": "French (Fran\u00e7ais)",
  "hu_HU": "Hungarian (Magyar)",
  "is_IS": "Icelandic (\u00edslenska)",
  "it_IT": "Italian (Italiano)",
  "ka_GE": "Georgian (\u10e5\u10d0\u10e0\u10d7\u10e3\u10da\u10d8 \u10d4\u10dc\u10d0)",
  "kk_KZ": "Kazakh (\u049b\u0430\u0437\u0430\u049b\u0448\u0430)",
  "lb_LU": "Luxembourgish (L\u00ebtzebuergesch)",
  "ne_NP": "Nepali (\u0928\u0947\u092a\u093e\u0932\u0940)",
  "nl_BE": "Dutch (Nederlands)",
  "nl_NL": "Dutch (Nederlands)",
  "no_NO": "Norwegian (Norsk)",
  "pl_PL": "Polish (Polski)",
  "pt_BR": "Portuguese (Portugu\u00eas)",
  "pt_PT": "Portuguese (Portugu\u00eas)",
  "ro_RO": "Romanian (Rom\u00e2n\u0103)",
  "ru_RU": "Russian (\u0420\u0443\u0441\u0441\u043a\u0438\u0439)",
  "sk_SK": "Slovak (Sloven\u010dina)",
  "sl_SI": "Slovenian (Sloven\u0161\u010dina)",
  "sr_RS": "Serbian (srpski)",
  "sv_SE": "Swedish (Svenska)",
  "sw_CD": "Swahili (Kiswahili)",
  "tr_TR": "Turkish (T\u00fcrk\u00e7e)",
  "uk_UA": "Ukrainian (\u0443\u043a\u0440\u0430\u0457\u0301\u043d\u0441\u044c\u043a\u0430 \u043c\u043e\u0301\u0432\u0430)",
  "vi_VN": "Vietnamese (Ti\u1ebfng Vi\u1ec7t)",
  "zh_CN": "Chinese (\u7b80\u4f53\u4e2d\u6587)"
} ;
