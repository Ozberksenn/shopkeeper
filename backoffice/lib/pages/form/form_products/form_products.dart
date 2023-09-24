import 'package:backoffice/pages/form/form_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';
import '../../../widgets/radio_group_buttons.dart';
import '../../../widgets/text_area_field.dart';
import '../../../widgets/text_field.dart';

class FormProductsView extends StatelessWidget {
  FormProductsView({super.key});

  final formKey = GlobalKey<FormBuilderState>();
  final postApiUrl = "newProduct";
  FormController controller = Get.put(FormController());

  @override
  Widget build(BuildContext context) {
    return FormBuilder(
      key: formKey,
      child: ListView(
        children: [
          textField(name: 'product_name', labelName: 'Ürün adı'),
          textField(name: 'product_image', labelName: 'Görsel Url Ekleyin'),
          textField(name: 'product_price', labelName: 'Fiyat'),
          textAreaField(name: 'product_info', hintText: 'Mesajınız'),
          radioGroupButtons(name: 'menu_id'),
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 32.0, vertical: 6.0),
            child: ElevatedButton(
                onPressed: () {
                  formKey.currentState?.saveAndValidate();
                  controller.postForm(
                      formKey.currentState?.value, formKey, {postApiUrl});
                },
                child: const Text('gönder')),
          )
        ],
      ),
    );
  }
}
