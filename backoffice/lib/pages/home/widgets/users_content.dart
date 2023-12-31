import 'package:backoffice/pages/form/form_controller.dart';
import 'package:backoffice/pages/home/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../form/widgets/show_modal.dart';

class UsersContent extends StatelessWidget {
  UsersContent({super.key});
  final HomeController controller = Get.find();
  final FormController formController = Get.find();
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: controller.userListData.length,
        itemBuilder: (context, index) {
          return Container(
            margin: const EdgeInsets.all(12.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    controller.userListData[index].userImage!.isNotEmpty
                        ? Container(
                            width: 100,
                            height: 100,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                image: DecorationImage(
                                    image: NetworkImage(controller
                                        .userListData[index].userImage
                                        .toString()))),
                          )
                        : Container(),
                    Text(
                      "UserId : ${controller.userListData[index].userId}",
                      style: const TextStyle(color: Colors.black),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "Email : ${controller.userListData[index].email}",
                        style: const TextStyle(color: Colors.black),
                      ),
                    ),
                    Text(
                      "Username : ${controller.userListData[index].username}",
                      style: const TextStyle(color: Colors.black),
                    ),
                  ],
                ),
                IconButton(
                    onPressed: () {
                      formController.headersTabBar.value = 1;
                      showModal(controller.userListData[index]);
                    },
                    icon: const Icon(
                      Icons.edit,
                      color: Colors.blue,
                      size: 14,
                    )),
              ],
            ),
          );
        });
  }
}
