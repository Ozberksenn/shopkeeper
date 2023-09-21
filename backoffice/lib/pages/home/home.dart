import 'package:backoffice/pages/home/home_controller.dart';
import 'package:backoffice/utils/configuration.dart';
import 'package:backoffice/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../widgets/appBar_widget.dart';
import 'widgets/headers_button.dart';
import 'widgets/nav_bar_widget.dart';

class HomeView extends StatelessWidget {
  HomeView({super.key});
  final HomeController controller = Get.put(HomeController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: appBarWidget(),
        body: Obx(() => controller.isReady.value == true
            ? Column(
                children: [
                  Flexible(
                      child: Row(
                    children: [
                      SizedBox(width: 320, child: navBarWidget(controller)),
                      Expanded(
                        child: Container(
                            color: lightGrey,
                            child: Column(
                              children: [
                                Container(
                                    margin: const EdgeInsets.all(8.0),
                                    width: Get.width,
                                    height: 40,
                                    child: Row(
                                      children: [
                                        headersButton(btnName: 'Düzenle'),
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 8.0),
                                          child: headersButton(
                                              btnName: 'Ekle',
                                              icon: Icons.add,
                                              iconColor: Colors.green),
                                        ),
                                        headersButton(
                                            btnName: 'Sil',
                                            icon: Icons.remove_circle,
                                            iconColor: Colors.red),
                                      ],
                                    )),
                                const Padding(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 8.0),
                                  child: Divider(
                                      thickness: 1, color: Colors.black),
                                ),
                                Expanded(
                                  child: SizedBox(
                                    height: 200,
                                    child:
                                        menuIdControl(controller.menuId.value),
                                  ),
                                ),
                              ],
                            )),
                      )
                    ],
                  ))
                ],
              )
            : const Center(child: CircularProgressIndicator())));
  }
}
