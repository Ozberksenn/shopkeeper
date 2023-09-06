import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grocery/pages/Profile/profile_controller.dart';
import 'package:grocery/utils/app_routes.dart';
import 'package:grocery/widgets/appBar_widget.dart';
import 'widget/delete_bottom_sheet.dart';
import 'widget/profileList.dart';

class ProfileView extends StatelessWidget {
  ProfileView({super.key});
  final ProfileController controller = Get.put(ProfileController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarWidget(),
      body: Column(
        children: [
          profileList(
              icon: const Icon(
                Icons.person_2_rounded,
                color: Colors.black,
              ),
              name: 'Update Profile Picture'),
          profileList(
              icon: const Icon(
                Icons.update_sharp,
                color: Colors.black,
              ),
              onClick: () {
                Get.toNamed(AppRoutes.update);
              },
              name: 'Update Account Info'),
          profileList(
              onClick: () {
                deleteBottomSheet();
              },
              icon: const Icon(
                Icons.delete,
                color: Colors.black,
              ),
              name: 'Delete Account'),
          profileList(
              onClick: () {
                controller.handleLogOut();
              },
              icon: const Icon(Icons.login_outlined),
              name: 'Log Out'),
        ],
      ),
    );
  }
}
