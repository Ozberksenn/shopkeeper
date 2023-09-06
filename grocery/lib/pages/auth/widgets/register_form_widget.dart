import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import '../../../controller/auth_controller.dart';
import '../../../services/services.dart';
import 'text_input_widget.dart';

FormBuilder registerFormWidget(GlobalKey<FormBuilderState> formKey,
    AuthController authController, DatabaseServices databaseServices) {
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
                  authController.register.value =
                      formKey.currentState?.value as Map;
                  databaseServices.register(authController.register);
                } else {
                  debugPrint('Validation Filed');
                }
              },
              child: const Text('Kayıt Olun'))
        ],
      ));
}
