import 'package:backoffice/pages/form/form_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';
import '../../../widgets/custom_button.dart';
import '../../../widgets/text_field.dart';

class FormUserView extends StatelessWidget {
  FormUserView({super.key});

  final formKey = GlobalKey<FormBuilderState>();
  FormController controller = Get.put(FormController());

  @override
  Widget build(BuildContext context) {
    const userPostApi = "register";
    const userUpdateApi = "update";
    const userDeleteApi = "delete";
    return FormBuilder(
        key: formKey,
        child: controller.headersTabBar.value == 0
            ? postUserForm(userPostApi)
            : controller.headersTabBar.value == 1
                ? editedUserForm(userUpdateApi)
                : removeUserForm(userDeleteApi));
  }

  Widget postUserForm(userPostApi) {
    return ListView(
      children: [
        textField(name: 'userName', labelName: 'User Name'),
        textField(name: 'email', labelName: 'email'),
        textField(name: 'password', labelName: 'password'),
        customButton(
            btnName: 'Gönder',
            onClick: () {
              formKey.currentState?.saveAndValidate();
              controller.postForm(
                  formKey.currentState?.value, formKey, userPostApi);
            })
      ],
    );
  }

  Widget editedUserForm(userUpdateApi) {
    return ListView(
      children: [
        textField(name: 'user_id', labelName: 'user id : '),
        textField(name: 'name', labelName: 'yeni kullanıcı adı'),
        textField(name: 'password', labelName: 'yeni parola'),
        customButton(
            btnName: 'Gönder',
            onClick: () {
              formKey.currentState?.saveAndValidate();
              controller.updateForm(
                  formKey.currentState?.value, formKey, userUpdateApi);
            })
      ],
    );
  }

  Widget removeUserForm(userDeleteApi) {
    return ListView(
      children: [
        textField(name: 'user_id', labelName: 'Kullanıcı id'),
        customButton(
            btnName: 'Gönder',
            onClick: () {
              formKey.currentState?.saveAndValidate();
              controller.deleteForm(
                  formKey.currentState?.value, formKey, userDeleteApi);
            })
      ],
    );
  }
}
