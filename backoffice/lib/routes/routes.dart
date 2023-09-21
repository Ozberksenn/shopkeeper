import 'package:backoffice/pages/home/home.dart';
import 'package:backoffice/utils/app_routes.dart';
import 'package:get/get.dart';

routes() => [
      GetPage(name: AppRoutes.home, page: () => HomeView()),
    ];
