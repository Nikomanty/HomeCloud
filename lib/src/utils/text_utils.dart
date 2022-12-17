import 'package:flutter/material.dart';

class TextUtils {
  Size getTextSize(String text, TextStyle textStyle) {
    TextPainter painter = TextPainter(
      text: TextSpan(
        text: text,
        style: textStyle,
      ),
      maxLines: 1,
      textDirection: TextDirection.ltr,
    )..layout(minWidth: 0, maxWidth: double.infinity);
    return painter.size;
  }
}