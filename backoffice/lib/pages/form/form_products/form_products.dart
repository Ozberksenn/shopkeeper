import 'package:backoffice/model/product_model.dart';
import 'package:backoffice/pages/form/form_controller.dart';
import 'package:backoffice/widgets/custom_button.dart';
import 'package:backoffice/widgets/disabled_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:get/get.dart';
import '../../../widgets/radio_group_buttons.dart';
import '../../../widgets/text_area_field.dart';
import '../../../widgets/text_field.dart';

class FormProductsView extends StatelessWidget {
  FormProductsView({Key? key, this.parameter}) : super(key: key);
  final ProductsModel? parameter;
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
        textField(
            name: 'product_name',
            labelName: 'Ürün adı',
            validator: FormBuilderValidators.required()),
        textField(
            name: 'product_image',
            labelName: 'Görsel Url Ekleyin',
            validator: FormBuilderValidators.required()),
        textField(
            name: 'product_price',
            labelName: 'Fiyat',
            validator: FormBuilderValidators.required()),
        textAreaField(
          name: 'product_info',
          hintText: 'Mesajınız',
        ),
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
    return parameter == null
        ? ListView(
            children: [
              textField(
                  name: 'product_id',
                  labelName: 'Ürün id ',
                  validator: FormBuilderValidators.compose([
                    FormBuilderValidators.required(),
                    FormBuilderValidators.integer()
                  ])),
              textField(
                  name: 'product_name',
                  labelName: 'Ürün adı',
                  validator: FormBuilderValidators.required()),
              textField(
                  name: 'product_image',
                  labelName: 'Görsel Url Ekleyin',
                  validator: FormBuilderValidators.required()),
              textField(
                  name: 'product_price',
                  labelName: 'Fiyat',
                  validator: FormBuilderValidators.required()),
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
          )
        : ListView(
            children: [
              disabledTextField(
                  name: 'product_id',
                  initialValue: parameter!.productId.toString(),
                  labelName: parameter!.productId.toString()),
              textField(
                  name: 'product_name',
                  labelName: parameter?.productName,
                  validator: FormBuilderValidators.required()),
              textField(
                  name: 'product_image',
                  labelName: parameter?.productImage,
                  validator: FormBuilderValidators.required()),
              textField(
                  name: 'product_price',
                  labelName: parameter?.productPrice,
                  validator: FormBuilderValidators.required()),
              textAreaField(
                  name: 'product_info', hintText: parameter?.productInfo),
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
        textField(
            name: 'product_id',
            labelName: 'Ürün id',
            validator: FormBuilderValidators.compose([
              FormBuilderValidators.required(),
              FormBuilderValidators.integer(),
            ])),
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
