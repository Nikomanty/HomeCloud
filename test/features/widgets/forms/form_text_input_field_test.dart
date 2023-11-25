import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:home_cloud/widgets/forms/form_text_input_field.dart';

void main() {
  TextEditingController textEditingController =
      TextEditingController(text: "Initial String");
  String hintText = "Enter text";

  Widget createWidgetUnderTest() {
    return MaterialApp(
      title: 'News App',
      home: Scaffold(
        body: FormTextInputField(
          hintText: hintText,
          stringToUpdateTextController: textEditingController,
        ),
      ),
    );
  }

  testWidgets("Tests Form text input field elements", (widgetTester) async {
    await widgetTester.pumpWidget(createWidgetUnderTest());

    TextField textField = widgetTester.widget(find.byType(TextField));
    InputDecoration? decoration = textField.decoration;
    expect(decoration?.hintText, hintText);
    expect(decoration?.border, InputBorder.none);
  });

  testWidgets("Tests Form text input field initial values",
      (widgetTester) async {
    await widgetTester.pumpWidget(createWidgetUnderTest());

    final textFieldFinder = find.byType(TextFormField);
    expect(textFieldFinder, findsOneWidget);
    TextFormField textFormField = widgetTester.widget(textFieldFinder);
    expect(textFormField.initialValue, "Initial String");
  });

  testWidgets("Tests form input field value when updated",
      (widgetTester) async {
    await widgetTester.pumpWidget(createWidgetUnderTest());

    final textFieldFinder = find.byType(TextFormField);
    expect(textEditingController.text, "Initial String");

    await widgetTester.enterText(textFieldFinder, "Changed string");
    await widgetTester.pump();
    expect(textEditingController.text, "Changed string");
  });
}
