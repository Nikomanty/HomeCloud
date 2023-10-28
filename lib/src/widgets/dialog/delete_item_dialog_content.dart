import 'package:flutter/material.dart';
import 'package:home_cloud/src/core/constants/home_cloud_strings.dart';
import 'package:home_cloud/src/core/utils/utils.dart';
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
            "${HomeCloudStrings.itemDeletionQuestion} \n$itemToDeleteName",
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodyMedium,
          ),
        ),
        DialogActionButtonRow(
          confirmButtonTitle: HomeCloudStrings.confirmItemDeletion,
          confirmAction: () {
            deleteItem();
            Utils.showNotificationSnack(
              context: context,
              notificationString:
                  "$itemToDeleteName ${HomeCloudStrings.deletedString}.",
            );
            Navigator.of(context).pop();
          },
        )
      ],
    );
  }
}
