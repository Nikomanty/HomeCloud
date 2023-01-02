import 'package:flutter/material.dart';

class CenteredErrorText extends StatelessWidget {
  final String? errorMessage;

  const CenteredErrorText({
    Key? key,
    this.errorMessage,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        errorMessage ?? "No error message found.",
        style: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
