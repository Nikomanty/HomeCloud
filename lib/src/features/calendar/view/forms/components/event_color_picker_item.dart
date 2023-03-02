import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:home_cloud/src/constants/app_colors.dart';

class EventColorPickerItem extends StatefulWidget {
  final Color color;
  final bool isCurrentColor;
  final VoidCallback changeColor;

  const EventColorPickerItem(
      {super.key,
      required this.color,
      required this.isCurrentColor,
      required this.changeColor});

  @override
  State<EventColorPickerItem> createState() => _EventColorPickerItemState();
}

class _EventColorPickerItemState extends State<EventColorPickerItem> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: DecoratedBox(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: widget.color,
        ),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: widget.changeColor,
            borderRadius: BorderRadius.circular(50),
            child: AnimatedOpacity(
              duration: const Duration(milliseconds: 210),
              opacity: widget.isCurrentColor ? 1 : 0,
              child: Icon(Icons.done,
                  color: useWhiteForeground(widget.color)
                      ? Colors.white
                      : Colors.black),
            ),
          ),
        ),
      ),
    );
  }
}
