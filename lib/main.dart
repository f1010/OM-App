import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:poc_flutter/office_manager/home.dart';
import 'package:poc_flutter/office_manager/theme.dart';

final ThemeData themeData = ThemeData(
  primaryColor: AppColors.darkViolet,
  primaryColorDark: AppColors.darkViolet,
  accentColor: AppColors.lightBlue,
);

void main() {
  runApp(MaterialApp(
    home: HomeScreen(),
    theme: themeData,
  ));
}
