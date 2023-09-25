import 'package:backoffice/pages/form/form_controller.dart';
import 'package:backoffice/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';
import '../../../widgets/radio_group_buttons.dart';
import '../../../widgets/text_area_field.dart';
import '../../../widgets/text_field.dart';

class FormProductsView extends StatelessWidget {
  FormProductsView({super.key});
  final formKey = GlobalKey<FormBuilderState>();
  FormController controller = Get.put(FormController());

  @override
  Widget build(BuildContext context) {
    const postApiUrl = "newProduct";
    const postUpdateUrl = "updateProduct";
    const deleteApiUrl = "deleteProduct";

    return FormBuilder(
      key: formKey,
      child: controller.headersTabBar.value == 0
          ? productPostForm(postApiUrl)
          : controller.headersTabBar.value == 1
              ? productEditedForm(postUpdateUrl)
              : productRemoveForm(deleteApiUrl),
    );
  }

  Widget productPostForm(postApiUrl) {
    return ListView(
      children: [
        textField(name: 'product_name', labelName: 'Ürün adı'),
        textField(name: 'product_image', labelName: 'Görsel Url Ekleyin'),
        textField(name: 'product_price', labelName: 'Fiyat'),
        textAreaField(name: 'product_info', hintText: 'Mesajınız'),
        radioGroupButtons(name: 'menu_id'),
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

  Widget productEditedForm(postUpdateUrl) {
    return ListView(
      children: [
        textField(name: 'product_id', labelName: 'Ürün id '),
        textField(name: 'product_name', labelName: 'Ürün adı'),
        textField(name: 'product_image', labelName: 'Görsel Url Ekleyin'),
        textField(name: 'product_price', labelName: 'Fiyat'),
        textAreaField(name: 'product_info', hintText: 'Mesajınız'),
        radioGroupButtons(name: 'menu_id'),
        customButton(
            btnName: 'Gönder',
            onClick: () {
              formKey.currentState?.saveAndValidate();
              controller.updateForm(
                  formKey.currentState?.value, formKey, postUpdateUrl);
            })
      ],
    );
  }

  Widget productRemoveForm(deleteApiUrl) {
    return ListView(
      children: [
        textField(name: 'product_id', labelName: 'Ürün id'),
        customButton(
            btnName: 'Gönder',
            onClick: () {
              formKey.currentState?.saveAndValidate();
              controller.deleteForm(
                  formKey.currentState?.value, formKey, deleteApiUrl);
            })
      ],
    );
  }
}
