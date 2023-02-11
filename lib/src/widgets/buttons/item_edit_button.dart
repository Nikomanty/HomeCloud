import 'package:flutter/material.dart';

class EditIconButton extends StatefulWidget {
  final Widget editDialog;
  final double? iconSize;

  const EditIconButton({
    super.key,
    required this.editDialog,
    this.iconSize,
  });

  @override
  State<EditIconButton> createState() => _EditIconButtonState();
}

class _EditIconButtonState extends State<EditIconButton> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Icon(Icons.edit_outlined, size: widget.iconSize ?? 25),
      onTap: () {
        showDialog<Widget>(
          context: context,
          builder: (context) {
            return widget.editDialog;
          },
        );
      },
    );
  }
}
