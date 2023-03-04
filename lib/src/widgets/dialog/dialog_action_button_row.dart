import 'package:flutter/material.dart';
import 'package:home_cloud/src/constants/shared_strings.dart';
import 'package:home_cloud/src/utils/styles.dart';

class DialogActionButtonRow extends StatelessWidget {
  final VoidCallback confirmAction;
  final String confirmButtonTitle;

  const DialogActionButtonRow({
    super.key,
    required this.confirmAction,
    required this.confirmButtonTitle,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: Text(
            SharedStrings.cancelString,
            style: Styles.actionsButtonTextStyle(),
          ),
        ),
        TextButton(
            onPressed: () => confirmAction(),
            child: Text(
              confirmButtonTitle,
              style: Styles.actionsButtonTextStyle(),
              textAlign: TextAlign.center,
            )),
      ],
    );
  }
}
