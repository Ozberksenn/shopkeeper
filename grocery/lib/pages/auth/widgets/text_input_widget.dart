import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

Widget textInputWidget(
    {String? name,
    String? hintName,
    bool securityPassword = false,
    FormFieldValidator<String>? validation}) {
  return Container(
    margin: const EdgeInsets.all(12.0),
    child: FormBuilderTextField(
      obscureText: securityPassword,
      decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(14.0)),
          hintText: hintName ?? ''),
      name: name ?? '',
      validator: validation,
    ),
  );
}
