import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:grocery/pages/auth/login_controller.dart';
import 'package:grocery/utils/utils.dart';
import '../../../services/services.dart';
import 'text_input_widget.dart';

FormBuilder registerFormWidget(GlobalKey<FormBuilderState> formKey,
    LoginController controller, DatabaseServices databaseServices) {
  return FormBuilder(
      key: formKey,
      child: Column(
        children: [
          textInputWidget(
              hintName: 'User Name',
              name: 'userName',
              validation: FormBuilderValidators.required()),
          textInputWidget(
              hintName: 'Email',
              name: 'email',
              validation: FormBuilderValidators.compose([
                FormBuilderValidators.email(),
                FormBuilderValidators.required()
              ])),
          textInputWidget(
              hintName: 'Passwod',
              name: 'password',
              securityPassword: true,
              validation: FormBuilderValidators.required()),
          textInputWidget(
              hintName: 'Passwod',
              name: 'passwordAgain',
              securityPassword: true,
              validation: FormBuilderValidators.required()),
          ElevatedButton(
              onPressed: () {
                if (formKey.currentState?.saveAndValidate() ?? false) {
                  controller.registerUser(formKey.currentState?.value as Map);
                } else {
                  showWarning('Error Register');
                }
              },
              child: const Text('Kayıt Olun'))
        ],
      ));
}
