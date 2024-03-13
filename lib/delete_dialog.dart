import 'package:flutter/material.dart';
import 'countdown_button.dart';

class DeleteDialog extends StatefulWidget {
  const DeleteDialog({super.key, required this.onDelete});

  final VoidCallback onDelete;

  @override
  State<DeleteDialog> createState() => _DeleteDialogState();
}

class _DeleteDialogState extends State<DeleteDialog> {
  @override
  Widget build(BuildContext context) {
    return Semantics(
        label: 'Are you sure you wish to delete this voice?',
        enabled: true,
        container: true,
        child: AlertDialog(
          title: const Text('Delete Voice'),
          content: const SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('Are you sure you wish to delete this voice?')
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              autofocus: true,
              child: const Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: const Text('Delete Voice'),
              onPressed: () {
                widget.onDelete();
                Navigator.of(context).pop();
              },
            ),
          ],
        ));
  }
}
