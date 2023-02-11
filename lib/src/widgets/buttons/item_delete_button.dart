import 'package:flutter/material.dart';
import 'package:home_cloud/src/utils/home_cloud_strings.dart';

class DeleteIconButton extends StatefulWidget {
  final VoidCallback deleteItem;
  final String? itemToDeleteName;
  final double? iconSize;

  const DeleteIconButton({
    super.key,
    required this.deleteItem,
    this.itemToDeleteName,
    this.iconSize,
  });

  @override
  State<DeleteIconButton> createState() => _DeleteIconButtonState();
}

class _DeleteIconButtonState extends State<DeleteIconButton> {
  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.delete_outline, size: widget.iconSize ?? 25),
      onPressed: () {
        showDialog<AlertDialog>(
          context: context,
          builder: (context) {
            return _dialog(context);
          },
        );
      },
    );
  }

  AlertDialog _dialog(BuildContext context) {
    return AlertDialog(
      title: Text(
        "${HomeCloudString.itemDeletionQuestion} ${widget.itemToDeleteName}",
      ),
      actions: [
        TextButton(
          onPressed: () {
            widget.deleteItem();
            Navigator.of(context).pop();
          },
          child: const Text(HomeCloudString.confirmItemDeletion),
        ),
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: const Text(HomeCloudString.cancelString),
        ),
      ],
    );
  }
}
