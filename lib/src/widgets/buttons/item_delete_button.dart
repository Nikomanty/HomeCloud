import 'package:flutter/material.dart';

class DeleteIconButton extends StatefulWidget {
  final double? iconSize;

  const DeleteIconButton({
    Key? key,
    this.iconSize,
  }) : super(key: key);

  @override
  State<DeleteIconButton> createState() => _DeleteIconButtonState();
}

class _DeleteIconButtonState extends State<DeleteIconButton> {
  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.delete_outline, size: widget.iconSize ?? 25),
      onPressed: () {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return _dialog(context);
          },
        );
      },
    );
  }

  _dialog(BuildContext context) {
    return AlertDialog(
      title: const Text("Not implemented yet, press cancel to close dialog"),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: const Text("Cancel"),
        )
      ],
    );
  }
}
