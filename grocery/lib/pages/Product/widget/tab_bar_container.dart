import 'package:flutter/material.dart';
import 'package:grocery/theme/light_theme.dart';

Widget tabBarContainer({String? name}) {
  return Container(
      margin: const EdgeInsets.all(4.0),
      decoration: BoxDecoration(
          color: lightTheme.colorScheme.primary,
          borderRadius: BorderRadius.circular(12.0)),
      padding: const EdgeInsets.all(18.0),
      child: Text(name ?? ''));
}
