import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/instance_manager.dart';
import 'package:grocery/controller/bottom_controller.dart';
import 'package:grocery/pages/Basket/basket_view.dart';
import 'package:grocery/pages/Home/home.dart';
import 'package:grocery/pages/Profile/profile_view.dart';
import 'Product/product_view.dart';

class HomeView extends StatelessWidget {
  HomeView({super.key});
  BottomController get bottomController => Get.put(BottomController());

  final List<Widget> bottomPages = [
    const HomePage(),
    ProductView(),
    BasketView(),
    ProfileView()
  ];

  @override
  Widget build(BuildContext context) {
    return Obx(() => Scaffold(
          body: IndexedStack(
            index: bottomController.bottomIndex.value,
            children: bottomPages,
          ),
          floatingActionButton: FloatingActionButton(
              onPressed: () {},
              child: const Icon(
                Icons.chat,
                color: Colors.white,
              )),
          bottomNavigationBar: Container(
              decoration: BoxDecoration(boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 2,
                  blurRadius: 8,
                  offset: const Offset(0, 3), // x, y offset
                ),
              ], borderRadius: BorderRadius.circular(30)),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(30),
                child: BottomNavigationBar(
                    currentIndex: bottomController.bottomIndex.value,
                    onTap: (value) {
                      bottomController.bottomIndex.value = value;
                    },
                    iconSize: 26,
                    items: const [
                      BottomNavigationBarItem(
                          icon: Icon(CupertinoIcons.home), label: 'Home'),
                      BottomNavigationBarItem(
                          icon: Icon(CupertinoIcons.tags), label: 'Product'),
                      BottomNavigationBarItem(
                          icon: Icon(CupertinoIcons.shopping_cart),
                          label: 'Basket'),
                      BottomNavigationBarItem(
                          icon: Icon(CupertinoIcons.profile_circled),
                          label: 'Profile')
                    ]),
              )),
        ));
  }
}
