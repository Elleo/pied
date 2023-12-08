import 'package:flutter/material.dart';
import 'countdown_button.dart';

class ConfirmationDialog extends StatefulWidget {
  const ConfirmationDialog({super.key, required this.onRevert});

  final VoidCallback onRevert;

  @override
  State<ConfirmationDialog> createState() => _ConfirmationDialogState();
}

class _ConfirmationDialogState extends State<ConfirmationDialog> {
  @override
  Widget build(BuildContext context) {
    return Semantics(
        label:
            'Pied has changed your speech dispatcher configuration. Please check that speech is working correctly. After 60 seconds your previous configuration will be reinstated.',
        enabled: true,
        container: true,
        child: AlertDialog(
          title: const Text('Speech Dispatcher Configuration Changed'),
          content: const SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text(
                    'Pied has changed your speech dispatcher configuration. Please check that speech is working correctly. After 60 seconds your previous configuration will be reinstated.')
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              autofocus: true,
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Accept new configuration'),
            ),
            CountdownButton(
              onPressed: () {
                widget.onRevert();
                Navigator.of(context).pop();
              },
            ),
          ],
        ));
  }
}
