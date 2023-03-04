import 'package:flutter/material.dart';
import 'package:home_cloud/src/core/constants/app_colors.dart';

class FormTextInputField extends StatefulWidget {
  final String hintText;
  final TextEditingController stringToUpdateTextController;
  final String? validatorString;

  const FormTextInputField({
    super.key,
    required this.hintText,
    required this.stringToUpdateTextController,
    this.validatorString,
  });

  @override
  State<FormTextInputField> createState() => _FormTextInputFieldState();
}

class _FormTextInputFieldState extends State<FormTextInputField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        hintText: widget.hintText,
        hintStyle: Theme.of(context)
            .textTheme
            .bodyMedium
            ?.copyWith(color: AppColors.onPrimaryVariant),
        border: InputBorder.none,
      ),
      initialValue: widget.stringToUpdateTextController.text,
      style: Theme.of(context).textTheme.bodyMedium,
      textCapitalization: TextCapitalization.sentences,
      onChanged: (value) {
        widget.stringToUpdateTextController.text = value;
      },
      validator: (value) {
        if (widget.validatorString != null) {
          if (value != null && value.isEmpty) {
            return widget.validatorString;
          }
        }
        return null;
      },
    );
  }
}
