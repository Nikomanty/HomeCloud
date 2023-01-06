import 'package:flutter/material.dart';

class FormInputFieldContainer extends StatefulWidget {
  final IconData fieldIcon;
  final Widget child;

  const FormInputFieldContainer({Key? key, required this.fieldIcon, required this.child}) : super(key: key);

  @override
  State<FormInputFieldContainer> createState() => _FormInputFieldContainerState();
}

class _FormInputFieldContainerState extends State<FormInputFieldContainer> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(5)),
          border: Border.all(color: Colors.grey),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4),
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: Icon(widget.fieldIcon),
              ),
              Expanded(
                child: widget.child,
              ),
            ],
          ),
        ),
      ),
    );
  }
}