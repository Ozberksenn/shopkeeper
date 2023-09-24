import 'package:backoffice/pages/form/form_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';
import '../../../widgets/text_field.dart';

class FormMenuView extends StatelessWidget {
  FormMenuView({super.key});
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
        textField(name: 'menu_name', labelName: 'Menu adı'),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32.0, vertical: 6.0),
          child: ElevatedButton(
              onPressed: () {
                formKey.currentState?.saveAndValidate();
                controller.postForm(
                    formKey.currentState?.value, formKey, postApiUrl);
              },
              child: const Text('Gönder')),
        )
      ],
    );
  }

  Widget menuEditedForm(FormController controller, String updateApiUrl) {
    return ListView(
      children: [
        textField(name: 'menu_id', labelName: 'Değişecek Menu id :'),
        textField(name: 'menu_name', labelName: 'Yeni Menü adı :'),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32.0, vertical: 6.0),
          child: ElevatedButton(
              onPressed: () {
                formKey.currentState?.saveAndValidate();
                controller.updateForm(
                    formKey.currentState?.value, formKey, updateApiUrl);
              },
              child: const Text('Gönder')),
        )
      ],
    );
  }

  Widget menuDeletedForm(FormController controller, String deletedApiUrl) {
    return ListView(
      children: [
        textField(name: 'menu_id', labelName: 'Silinecek Menu Id'),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32.0, vertical: 6.0),
          child: ElevatedButton(
              onPressed: () {
                formKey.currentState?.saveAndValidate();
                controller.deleteForm(
                    formKey.currentState?.value, formKey, deletedApiUrl);
              },
              child: const Text('Gönder')),
        )
      ],
    );
  }
}
