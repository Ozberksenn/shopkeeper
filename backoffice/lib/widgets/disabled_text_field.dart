import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

Widget disabledTextField(
    {required String name, String? labelName, required dynamic initialValue}) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 32.0, vertical: 6),
    child: FormBuilderTextField(
      initialValue: initialValue,
      enabled: false,
      name: name,
      decoration: InputDecoration(
          filled: true,
          fillColor: Colors.grey,
          border: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(6)),
          labelText: labelName ?? ''),
    ),
  );
}
