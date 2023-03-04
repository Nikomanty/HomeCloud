import 'package:flutter/material.dart';
import 'package:home_cloud/src/core/constants/shared_strings.dart';

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
            style: Theme.of(context)
                .textTheme
                .bodyMedium
                ?.copyWith(color: Colors.blue),
          ),
        ),
        TextButton(
            onPressed: () => confirmAction(),
            child: Text(
              confirmButtonTitle,
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium
                  ?.copyWith(color: Colors.blue),
              textAlign: TextAlign.center,
            )),
      ],
    );
  }
}
