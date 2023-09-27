import 'package:backoffice/model/user_model.dart';
import 'package:backoffice/pages/form/form_controller.dart';
import 'package:backoffice/widgets/disabled_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:get/get.dart';
import '../../../widgets/custom_button.dart';
import '../../../widgets/text_field.dart';

class FormUserView extends StatelessWidget {
  FormUserView({Key? key, this.parameter}) : super(key: key);
  final UsersModel? parameter;
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
        textField(
            name: 'userName',
            labelName: 'kullanıcı adı',
            validator: FormBuilderValidators.required()),
        textField(
            name: 'email',
            labelName: 'mail',
            validator: FormBuilderValidators.compose([
              FormBuilderValidators.email(),
              FormBuilderValidators.required()
            ])),
        textField(
            name: 'password',
            labelName: 'şifre',
            obscure: true,
            validator: FormBuilderValidators.compose([
              FormBuilderValidators.maxLength(24),
              FormBuilderValidators.required()
            ])),
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
    return parameter == null
        ? ListView(
            children: [
              textField(
                  name: 'user_id',
                  labelName: 'kullanıcı id',
                  validator: FormBuilderValidators.compose([
                    FormBuilderValidators.required(),
                    FormBuilderValidators.integer()
                  ])),
              textField(
                  name: 'name',
                  labelName: 'yeni kullanıcı adı',
                  validator: FormBuilderValidators.compose(
                      [FormBuilderValidators.required()])),
              textField(
                  name: 'password',
                  labelName: 'yeni parola',
                  obscure: true,
                  validator: FormBuilderValidators.compose([
                    FormBuilderValidators.required(),
                    FormBuilderValidators.maxLength(24)
                  ])),
              customButton(
                  btnName: 'Gönder',
                  onClick: () {
                    formKey.currentState?.saveAndValidate();
                    controller.updateForm(
                        formKey.currentState?.value, formKey, userUpdateApi);
                  })
            ],
          )
        : ListView(
            children: [
              disabledTextField(
                  name: 'user_id', initialValue: parameter?.userId.toString()),
              textField(
                  name: 'name',
                  labelName: parameter?.username,
                  validator: FormBuilderValidators.compose(
                      [FormBuilderValidators.required()])),
              textField(
                  name: 'password',
                  labelName: 'yeni parola',
                  obscure: true,
                  validator: FormBuilderValidators.compose([
                    FormBuilderValidators.required(),
                    FormBuilderValidators.maxLength(24)
                  ])),
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
        textField(
            name: 'user_id',
            labelName: 'kullanıcı id',
            validator: FormBuilderValidators.compose([
              FormBuilderValidators.required(),
              FormBuilderValidators.integer()
            ])),
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
