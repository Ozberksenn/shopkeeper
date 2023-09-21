import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import '../../widgets/radio_group_buttons.dart';
import '../../widgets/text_area_field.dart';
import '../../widgets/text_field.dart';

class FormProductsView extends StatelessWidget {
  FormProductsView({super.key});

  final formKey = GlobalKey<FormBuilderState>();

  @override
  Widget build(BuildContext context) {
    return FormBuilder(
      key: formKey,
      child: ListView(
        children: [
          textField(name: 'product_name', labelName: 'Ürün adı'),
          textField(name: 'product_image', labelName: 'Görsel Url Ekleyin'),
          textField(name: 'product_price', labelName: 'Fiyat'),
          textField(name: 'product_info', labelName: 'Ürün Bilgisi'),
          radioGroupButtons(name: 'Menu : '),
          textAreaField(name: 'product_info', hintText: 'Mesajınız'),
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 32.0, vertical: 6.0),
            child: ElevatedButton(
                onPressed: () {
                  formKey.currentState?.saveAndValidate();
                  print(formKey.currentState?.value.toString());
                },
                child: const Text('gönder')),
          )
        ],
      ),
    );
  }
}
