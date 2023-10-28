import 'package:flutter/material.dart';
import 'package:home_cloud/src/core/constants/home_cloud_strings.dart';

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
          key: const Key("cancel_button"),
          onPressed: () => Navigator.of(context).pop(),
          child: Text(
            HomeCloudStrings.cancelString,
            style: Theme.of(context)
                .textTheme
                .bodyMedium
                ?.copyWith(color: Colors.blue),
          ),
        ),
        TextButton(
          key: const Key("confirm_button"),
          onPressed: () => confirmAction(),
          child: Text(
            confirmButtonTitle,
            style: Theme.of(context)
                .textTheme
                .bodyMedium
                ?.copyWith(color: Colors.blue),
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }
}
