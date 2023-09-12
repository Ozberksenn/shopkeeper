import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';
import 'package:grocery/pages/Profile/profile_controller.dart';
import 'package:grocery/pages/auth/widgets/text_input_widget.dart';
import '../../widgets/appBar_widget.dart';

class UpdateView extends StatelessWidget {
  UpdateView({super.key});
  final formKey = GlobalKey<FormBuilderState>();
  final ProfileController controller = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarWidget(),
      body: Column(
        children: [
          FormBuilder(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  IconButton(
                      onPressed: () {
                        Get.back();
                      },
                      icon: const Icon(Icons.arrow_back)),
                  textInputWidget(hintName: 'Name', name: 'name'),
                  textInputWidget(hintName: 'Password', name: 'password'),
                  Center(
                    child: TextButton(
                        onPressed: () {
                          if (formKey.currentState?.saveAndValidate() ??
                              false) {
                            var userId = 11.toString();
                            var name = formKey
                                .currentState?.fields['name']?.value
                                .toString();
                            var password = formKey
                                .currentState?.fields['password']?.value
                                .toString();
                            var values = {
                              "user_id": userId,
                              "name": name,
                              "password": password
                            };
                            controller.upload(values);
                          } else {
                            debugPrint('Validation Filed');
                          }
                        },
                        child: const Text('Updated Profile Info')),
                  ),
                ],
              ))
        ],
      ),
    );
  }
}
