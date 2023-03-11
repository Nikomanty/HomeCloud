import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:home_cloud/src/widgets/forms/form_field_container.dart';

void main() {
  testWidgets("Tests form input field widget", (widgetTester) async {
    await widgetTester.pumpWidget(const MaterialApp(
      home: Scaffold(
          body: FormFieldContainer(
              fieldIcon: Icons.person, child: Text("Test content"))),
    ));
  });
}
