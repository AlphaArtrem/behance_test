import 'package:behance/business/helpers/sizing.dart';
import 'package:behance/data/theme_colors.dart';
import 'package:flutter/material.dart';

Widget commonTextField(IconData prefixIconData, String hintText) {
  return Container(
    decoration: BoxDecoration(
      color: ThemeColors.kPrimaryBackgroundColor,
      borderRadius: BorderRadius.circular(10.0),
    ),
    child: TextField(
      readOnly: true,
      decoration: InputDecoration(
        border: InputBorder.none,
        prefixIcon: Icon(
          prefixIconData,
          color: ThemeColors.kUnselectedColor,
        ),
        hintText: hintText,
        hintStyle: TextStyle(
          color: ThemeColors.kUnselectedColor,
          fontWeight: FontWeight.w500,
          fontSize: Sizing.getProportionateScreenHeight(20.0),
        ),
      ),
    ),
  );
}
