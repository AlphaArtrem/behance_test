import 'package:behance/business/helpers/sizing.dart';
import 'package:behance/data/theme_colors.dart';
import 'package:flutter/material.dart';

Widget comingSoon() {
  return Center(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          Icons.hourglass_bottom,
          color: ThemeColors.kSecondaryColor,
          size: Sizing.getProportionateScreenHeight(120.0),
        ),
        SizedBox(
          height: Sizing.getProportionateScreenHeight(30.0),
        ),
        const Text(
          'Coming Soon',
          style: TextStyle(
            fontSize: 30.0,
            fontWeight: FontWeight.w500,
            color: ThemeColors.kSelectedColor,
          ),
        ),
      ],
    ),
  );
}
