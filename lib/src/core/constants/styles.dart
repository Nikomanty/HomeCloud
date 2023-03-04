import 'package:flutter/material.dart';
import 'package:home_cloud/src/core/constants/app_colors.dart';

abstract class Styles {
  static Widget smallDivider(bool vertical) {
    return Padding(
      padding: const EdgeInsets.only(right: 4.0, top: 2.0, bottom: 2.0),
      child: Container(
        color: AppColors.onPrimary,
        height: !vertical ? 1 : null,
        width: vertical ? 1 : null,
      ),
    );
  }

  static const BorderRadius smallRoundedCorner =
      BorderRadius.all(Radius.circular(5));
  static const BorderRadius mediumRoundedCorner =
      BorderRadius.all(Radius.circular(15));
  static const BorderRadius largeRoundedCorner =
      BorderRadius.all(Radius.circular(20));

  static const List<BoxShadow> itemShadow = [
    BoxShadow(
      offset: Offset(0.0, 1.0),
      blurRadius: 2.0,
    ),
  ];
}
