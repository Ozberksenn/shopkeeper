import 'package:backoffice/pages/form/form_controller.dart';
import 'package:backoffice/widgets/custom_button.dart';
import 'package:backoffice/widgets/disabled_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:get/get.dart';
import '../../../widgets/text_field.dart';

class FormMenuView extends StatelessWidget {
  FormMenuView({Key? key, required this.parameter}) : super(key: key);
  final dynamic parameter;
  final formKey = GlobalKey<FormBuilderState>();

  @override
  Widget build(BuildContext context) {
    const postApiUrl = "addNewMenu";
    const updateApiUrl = "updateMenu";
    const deletedApiUrl = "deleteMenu";
    FormController controller = Get.put(FormController());
    return Obx(() => FormBuilder(
          key: formKey,
          child: controller.headersTabBar.value == 0
              ? menuPostForm(controller, postApiUrl)
              : controller.headersTabBar.value == 1
                  ? menuEditedForm(controller, updateApiUrl)
                  : menuDeletedForm(controller, deletedApiUrl),
        ));
  }

  Widget menuPostForm(FormController controller, String postApiUrl) {
    return ListView(
      children: [
        textField(
            name: 'menu_name',
            labelName: 'Menu adı',
            validator: FormBuilderValidators.required()),
        customButton(
            btnName: 'Gönder',
            onClick: () {
              formKey.currentState?.saveAndValidate();
              controller.postForm(
                  formKey.currentState?.value, formKey, postApiUrl);
            })
      ],
    );
  }

  Widget menuEditedForm(FormController controller, String updateApiUrl) {
    return ListView(
      children: [
        parameter != null
            ? disabledTextField(
                initialValue: parameter.toString(),
                name: 'menu_id',
                labelName: parameter.toString())
            : textField(
                name: 'menu_id',
                labelName: 'menü id :',
                validator: FormBuilderValidators.required()),
        textField(
            name: 'menu_name',
            labelName: 'Yeni Menü adı :',
            validator: FormBuilderValidators.required()),
        customButton(
            btnName: 'Gönder',
            onClick: () {
              formKey.currentState?.saveAndValidate();
              controller.updateForm(
                  formKey.currentState?.value, formKey, updateApiUrl);
            })
      ],
    );
  }

  Widget menuDeletedForm(FormController controller, String deletedApiUrl) {
    return ListView(
      children: [
        textField(
            name: 'menu_id',
            labelName: 'silinecek menu id',
            validator: FormBuilderValidators.required()),
        customButton(
            btnName: 'Gönder',
            onClick: () {
              formKey.currentState?.saveAndValidate();
              controller.deleteForm(
                  formKey.currentState?.value, formKey, deletedApiUrl);
            })
      ],
    );
  }
}
