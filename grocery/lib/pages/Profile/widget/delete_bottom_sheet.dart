import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grocery/pages/Profile/profile_controller.dart';

Future<dynamic> deleteBottomSheet() {
  final ProfileController controller = Get.find();
  return Get.bottomSheet(Container(
    height: Get.height / 2,
    color: Colors.white,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        const Text(
          textAlign: TextAlign.center,
          'Are you sure you want to delete this account?',
          style: TextStyle(color: Colors.black, fontSize: 24),
        ),
        const Text(
            textAlign: TextAlign.center,
            'After confirming this action, your account will be permanently deleted.'),
        Column(
          children: [
            TextButton(
                onPressed: () {
                  var values = {"user_id": 13.toString()};
                  controller.handleDeleteAccount(values);
                },
                child: const Text('Delete Account')),
            const Icon(CupertinoIcons.delete)
          ],
        )
      ],
    ),
  ));
}
