import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

Widget textField({required String name, String? labelName}) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 32.0, vertical: 6),
    child: FormBuilderTextField(
      name: name,
      decoration: InputDecoration(
          border: const OutlineInputBorder(), labelText: labelName ?? ''),
    ),
  );
}
