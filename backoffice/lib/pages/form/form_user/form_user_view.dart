import 'package:backoffice/pages/form/form_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';
import '../../../widgets/text_field.dart';

class FormUserView extends StatelessWidget {
  FormUserView({super.key});

  final formKey = GlobalKey<FormBuilderState>();
  FormController controller = Get.put(FormController());

  @override
  Widget build(BuildContext context) {
    return FormBuilder(
      key: formKey,
      child: ListView(
        children: [
          textField(name: 'product_name', labelName: 'User Name'),
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 32.0, vertical: 6.0),
            child: ElevatedButton(
                onPressed: () {
                  formKey.currentState?.saveAndValidate();
                },
                child: const Text('gönder')),
          )
        ],
      ),
    );
  }
}
