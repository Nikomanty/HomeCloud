import 'package:flutter/material.dart';
import 'package:home_cloud/src/core/constants/styles.dart';

//Custom color picker item, rounded rectangle with scaling check mark
class RoundedEventColorPickerItem extends StatelessWidget {
  final Color color;
  final bool isCurrentColor;
  final VoidCallback changeColor;

  const RoundedEventColorPickerItem({
    super.key,
    required this.color,
    required this.isCurrentColor,
    required this.changeColor,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5),
      child: Container(
        width: 40,
        height: 20,
        decoration: BoxDecoration(
          borderRadius: Styles.smallRoundedCorner,
          shape: BoxShape.rectangle,
          boxShadow: isCurrentColor ? Styles.itemShadow : null,
          color: color,
        ),
        child: InkWell(
          splashColor: Colors.transparent,
          onTap: changeColor,
          child: AnimatedScale(
            duration: const Duration(milliseconds: 100),
            scale: isCurrentColor ? 1 : 0,
            child: const Icon(
              Icons.check,
              color: Colors.black,
              size: 20,
            ),
          ),
        ),
      ),
    );
  }
}
