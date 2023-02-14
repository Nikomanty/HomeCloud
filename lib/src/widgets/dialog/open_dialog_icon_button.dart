import 'package:flutter/material.dart';

class OpenDialogIconButton extends StatelessWidget {
  final Widget dialogContent;
  final IconData icon;
  final double? iconSize;

  const OpenDialogIconButton({
    super.key,
    required this.dialogContent,
    required this.icon,
    this.iconSize,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(icon, size: iconSize ?? 25),
      onPressed: () {
        showDialog<Widget>(
          context: context,
          builder: (context) {
            return AlertDialog(
              scrollable: true,
              content: dialogContent,
            );
          },
        );
      },
    );
  }
}
