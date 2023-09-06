import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grocery/routes/routes.dart';
import 'package:grocery/theme/app_theme.dart';
import 'package:grocery/utils/app_routes.dart';
import 'controller/app_controller.dart';

void main() async {
  // await GetStorage.init();
  await Get.putAsync<AppController>(() => AppController().init(),
      permanent: true);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Grocery App',
      getPages: routes(),
      initialRoute: AppRoutes.login,
      theme: Get.isPlatformDarkMode == false
          ? Apptheme().lightT
          : Apptheme().darkT,
      debugShowCheckedModeBanner: false,
    );
  }
}
