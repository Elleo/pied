import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

class VoiceLabel extends StatefulWidget {
  const VoiceLabel(
      {super.key,
      required this.voiceId,
      required this.voiceData,
      required this.subvoices,
      required this.currentVoice,
      required this.player,
      required this.onSubVoiceChanged});
  final ValueChanged<int> onSubVoiceChanged;
  final AudioPlayer player;
  final String voiceId;
  final String currentVoice;
  final List<dynamic> voiceData;
  final Map<dynamic, dynamic> subvoices;

  @override
  State<VoiceLabel> createState() => _VoiceLabelState();
}

class _VoiceLabelState extends State<VoiceLabel> {
  bool previewing = false;
  int selectedSubVoice = 0;

  @override
  void initState() {
    widget.player.onPlayerStateChanged.listen((event) {
      if ((widget.player.source as UrlSource).url != widget.voiceData[5]) {
        setState(() {
          previewing = false;
        });
      }
      if (event != PlayerState.playing) {
        setState(() {
          previewing = false;
        });
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        widget.voiceData[5] == ""
            ? const SizedBox()
            : Semantics(
                label: widget.currentVoice == widget.voiceData[4]
                    ? "$widget.voiceId is the currently selected voice. Preview $widget.voiceId"
                    : "Preview $widget.voiceId",
                enabled: true,
                child: IconButton(
                    onPressed: () async {
                      if (previewing) {
                        widget.player.stop();
                      } else {
                        String? previewUrl = widget.voiceData[5];
                        if (previewUrl != null) {
                          previewUrl = previewUrl.replaceAll(
                              ":speaker_id:", selectedSubVoice.toString());
                          widget.player.play(UrlSource(previewUrl));
                          setState(() {
                            previewing = true;
                          });
                        }
                      }
                    },
                    icon: previewing
                        ? const Icon(Icons.stop)
                        : const Icon(Icons.play_arrow))),
        const SizedBox(width: 32),
        Text(widget.voiceId),
        widget.subvoices.isEmpty ? const SizedBox() : const Text(" - "),
        widget.subvoices.isEmpty
            ? const SizedBox()
            : DropdownButton<int>(
                value: selectedSubVoice,
                items: widget.subvoices.entries
                    .map<DropdownMenuItem<int>>((entry) =>
                        DropdownMenuItem<int>(
                            value: entry.value,
                            child: Semantics(
                                enabled: true,
                                label: "Select sub voice",
                                child: Text(entry.key))))
                    .toList(),
                onChanged: (value) {
                  setState(() {
                    selectedSubVoice = value!;
                  });
                  widget.onSubVoiceChanged(selectedSubVoice);
                }),
      ],
    );
  }
}
