import 'package:flutter/material.dart';
import 'package:home_cloud/src/core/constants/styles.dart';

class FormFieldContainer extends StatelessWidget {
  final IconData fieldIcon;
  final Widget child;

  const FormFieldContainer({
    super.key,
    required this.fieldIcon,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: DecoratedBox(
        decoration: BoxDecoration(
          borderRadius: Styles.smallRoundedCorner,
          border: Border.all(color: Colors.grey),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4),
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: Icon(fieldIcon),
              ),
              Expanded(
                child: child,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
