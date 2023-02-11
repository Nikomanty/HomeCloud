import 'package:flutter/material.dart';

class CenteredErrorText extends StatelessWidget {
  final String? errorMessage;

  const CenteredErrorText({
    super.key,
    this.errorMessage,
  });

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
