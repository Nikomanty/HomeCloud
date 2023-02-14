import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:home_cloud/src/widgets/forms/form_text_input_field.dart';

void main() {
  TextEditingController textEditingController =
      TextEditingController(text: "Initial String");
  String hintText = "Enter text";

  testWidgets("Tests form input field update string from outside",
      (widgetTester) async {
    await widgetTester.pumpWidget(MaterialApp(
      home: Scaffold(
        body: FormTextInputField(
          hintText: hintText,
          stringToUpdateTextController: textEditingController,
        ),
      ),
    ));

    final textFieldFinder = find.byType(TextFormField);
    expect(textFieldFinder, findsOneWidget);

    expect(textEditingController.text, "Initial String");
    await widgetTester.enterText(textFieldFinder, "Changed string");
    await widgetTester.pump();
    expect(textEditingController.text, "Changed string");
    await widgetTester.enterText(textFieldFinder, "");
  });
}
