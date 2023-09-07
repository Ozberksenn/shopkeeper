import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';
import 'package:grocery/pages/auth/login_controller.dart';
import 'package:grocery/services/services.dart';
import 'package:grocery/theme/light_theme.dart';
import 'package:grocery/utils/app_routes.dart';
import 'widgets/register_form_widget.dart';

class RegisterView extends StatelessWidget {
  RegisterView({super.key});
  final formKey = GlobalKey<FormBuilderState>();
  final databaseServices = DatabaseServices();
  LoginController get controller => Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
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
                      'Kayıt Olun',
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 24,
                          color: lightTheme.colorScheme.primary),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Get.toNamed(AppRoutes.login);
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 18.0),
                      child: Text(
                        'Giriş Yap',
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 22,
                            color: lightTheme.colorScheme.secondary),
                      ),
                    ),
                  ),
                ],
              ),
              registerFormWidget(formKey, controller, databaseServices),
            ],
          )
        ],
      ),
    );
  }
}
