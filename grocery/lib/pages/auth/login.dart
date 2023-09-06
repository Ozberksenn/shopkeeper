import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:get/get.dart';
import 'package:grocery/pages/auth/login_controller.dart';
import 'package:grocery/pages/auth/widgets/text_input_widget.dart';
import 'package:grocery/utils/app_routes.dart';

import '../../theme/light_theme.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormBuilderState> formKey = GlobalKey<FormBuilderState>();
    // AuthController authController = Get.put(AuthController());
    LoginController controller = Get.put(LoginController());
    // final databaseServices = DatabaseServices();
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Image.asset(
            'assets/images/image_one.png',
            fit: BoxFit.cover,
            width: Get.width / 1.4,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 18.0),
                    child: Text(
                      'Giriş Yap',
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 24,
                          color: lightTheme.colorScheme.primary),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Get.toNamed(AppRoutes.register);
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 18.0),
                      child: Text(
                        'Kayıt Ol',
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 22,
                            color: lightTheme.colorScheme.secondary),
                      ),
                    ),
                  ),
                ],
              ),
              FormBuilder(
                  key: formKey,
                  child: Column(
                    children: [
                      textInputWidget(
                          name: 'email',
                          hintName: 'Email',
                          validation: FormBuilderValidators.compose([
                            FormBuilderValidators.required(),
                            FormBuilderValidators.email()
                          ])),
                      textInputWidget(
                          name: 'password',
                          hintName: 'Password',
                          securityPassword: true,
                          validation: FormBuilderValidators.required()),
                      TextButton(
                          onPressed: () {
                            if (formKey.currentState?.saveAndValidate() ??
                                false) {
                              controller.loginUser(
                                  formKey.currentState?.value as Map);
                            } else {
                              debugPrint('Validation Filed');
                            }
                          },
                          child: const Text('Mağza Girişi'))
                    ],
                  ))
            ],
          )
        ],
      ),
    );
  }
}
