import 'package:flutter/material.dart';

class FormTextInputWidget extends StatefulWidget {
  final String hintText;
  final String valueKey;
  final TextEditingController stringToUpdateTextController;
  final String? initialValue;
  final String? validatorString;

  const FormTextInputWidget({
    Key? key,
    required this.hintText,
    required this.valueKey,
    this.initialValue,
    required this.stringToUpdateTextController,
    this.validatorString,
  }) : super(key: key);

  @override
  State<FormTextInputWidget> createState() => _FormTextInputWidgetState();
}

class _FormTextInputWidgetState extends State<FormTextInputWidget> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      key: ValueKey(widget.valueKey),
      decoration: InputDecoration(
        hintText: widget.hintText,
        border: InputBorder.none,
      ),
      initialValue: widget.stringToUpdateTextController.text,
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