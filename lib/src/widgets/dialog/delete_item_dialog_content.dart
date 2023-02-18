import 'package:flutter/material.dart';
import 'package:home_cloud/src/utils/shared_strings.dart';
import 'package:home_cloud/src/utils/utils.dart';
import 'package:home_cloud/src/widgets/dialog/dialog_action_button_row.dart';

class DeleteItemDialogContent extends StatelessWidget {
  final VoidCallback deleteItem;
  final String? itemToDeleteName;

  const DeleteItemDialogContent({
    super.key,
    required this.deleteItem,
    this.itemToDeleteName,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(15.0),
          child: Text(
            "${SharedStrings.itemDeletionQuestion} \n$itemToDeleteName",
            textAlign: TextAlign.center,
          ),
        ),
        DialogActionButtonRow(
          confirmButtonTitle: SharedStrings.confirmItemDeletion,
          confirmAction: () {
            deleteItem();
            Utils.showNotificationSnack(
              context: context,
              notificationString:
                  "$itemToDeleteName ${SharedStrings.deletedString}.",
            );
            Navigator.of(context).pop();
          },
        )
      ],
    );
  }
}
