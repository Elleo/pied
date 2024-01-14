import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:markdown_widget/markdown_widget.dart';

class InfoDialog extends StatefulWidget {
  const InfoDialog({super.key, required this.modelName, required this.infoUri});

  final String modelName;
  final Uri infoUri;

  @override
  State<InfoDialog> createState() => _InfoDialogState();
}

class _InfoDialogState extends State<InfoDialog> {
  String modelInfo = "";
  FocusNode buttonFocus = FocusNode();

  @override
  void initState() {
    http.get(widget.infoUri).then((value) {
      setState(() {
        modelInfo = value.body;
        buttonFocus.requestFocus();
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Semantics(
        label: modelInfo,
        enabled: true,
        container: true,
        child: AlertDialog(
          title: Text(widget.modelName),
          content: SizedBox(
              height: 500,
              width: 500,
              child:
                  SingleChildScrollView(child: MarkdownBlock(data: modelInfo))),
          actions: <Widget>[
            TextButton(
              focusNode: buttonFocus,
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Close'),
            ),
          ],
        ));
  }
}
