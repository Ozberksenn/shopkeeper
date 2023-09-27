import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

Widget textField(
    {required String name, String? labelName, bool? obscure, validator}) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 32.0, vertical: 6),
    child: FormBuilderTextField(
      validator: validator,
      obscureText: obscure ?? false,
      name: name,
      decoration: InputDecoration(
          border: const OutlineInputBorder(), hintText: labelName ?? ''),
    ),
  );
}
