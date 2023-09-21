import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

Widget textAreaField({required String name, String? hintText}) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 32.0, vertical: 6),
    child: FormBuilderTextField(
      maxLines: 4,
      name: name,
      decoration: InputDecoration(
          border: const OutlineInputBorder(), hintText: hintText ?? ''),
    ),
  );
}
