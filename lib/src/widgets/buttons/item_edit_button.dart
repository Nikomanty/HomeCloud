import 'package:flutter/material.dart';

class EditIconButton extends StatefulWidget {
  final double? iconSize;

  const EditIconButton({
    Key? key,
    this.iconSize,
  }) : super(key: key);

  @override
  State<EditIconButton> createState() => _EditIconButtonState();
}

class _EditIconButtonState extends State<EditIconButton> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Icon(Icons.edit_outlined, size: widget.iconSize ?? 25),
      onTap: () {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text("Not implemented yet, press cancel to close dialog"),
              actions: [
                TextButton(
                  onPressed: () => Navigator.of(context).pop(),
                  child: const Text("Cancel"),
                )
              ],
            );
          },
        );
      },
    );
  }
}
