import 'package:get/get.dart';
import 'package:grocery/pages/auth/login.dart';
import 'package:grocery/pages/auth/register.dart';
import 'package:grocery/pages/home_view.dart';
import 'package:grocery/pages/update/update_view.dart';
import 'package:grocery/utils/app_routes.dart';

routes() => [
      GetPage(name: AppRoutes.login, page: () => const LoginView()),
      GetPage(name: AppRoutes.register, page: () => const RegisterView()),
      GetPage(name: AppRoutes.home, page: () => HomeView()),
      GetPage(name: AppRoutes.update, page: () => UpdateView())
    ];
