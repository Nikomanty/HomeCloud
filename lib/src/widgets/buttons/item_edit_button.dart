import 'package:flutter/material.dart';

class ItemEditButton extends StatefulWidget {
  final Widget dialogContent;
  final double? iconSize;

  const ItemEditButton({
    super.key,
    required this.dialogContent,
    this.iconSize,
  });

  @override
  State<ItemEditButton> createState() => _ItemEditButtonState();
}

class _ItemEditButtonState extends State<ItemEditButton> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Icon(Icons.edit_outlined, size: widget.iconSize ?? 25),
      onTap: () {
        showDialog<Widget>(
          context: context,
          builder: (context) {
            return AlertDialog(
              content: widget.dialogContent,
            );
          },
        );
      },
    );
  }
}
