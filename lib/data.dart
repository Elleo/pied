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
