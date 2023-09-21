import 'package:backoffice/pages/home/home_controller.dart';
import 'package:flutter/material.dart';

Widget navBarWidget(HomeController controller) {
  return Container(
    color: Colors.white,
    child: ListView(
      children: [
        navBarListTile(
            name: 'Users',
            onClick: () {
              controller.menuId.value = 0;
            }),
        navBarListTile(
            name: 'Products',
            icon: Icons.shopping_basket_sharp,
            onClick: () {
              controller.menuId.value = 1;
            }),
        navBarListTile(
            name: 'Menu',
            onClick: () {
              controller.menuId.value = 2;
            })
      ],
    ),
  );
}

Widget navBarListTile(
    {required String name, IconData? icon, Function? onClick}) {
  return Container(
    margin: const EdgeInsets.all(12.0),
    decoration: BoxDecoration(
        color: const Color.fromARGB(255, 243, 242, 242),
        borderRadius: BorderRadius.circular(12.0)),
    child: InkWell(
      mouseCursor: SystemMouseCursors.grab,
      onTap: () => onClick!(),
      child: ListTile(
        leading: Icon(icon ?? Icons.people_alt),
        title: Text(
          name,
          style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w200),
        ),
        trailing: const Icon(Icons.arrow_circle_right_outlined),
      ),
    ),
  );
}
