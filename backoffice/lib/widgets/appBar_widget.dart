import 'package:flutter/material.dart';

AppBar appBarWidget() {
  return AppBar(
    backgroundColor: Colors.blueGrey,
    centerTitle: false,
    title: const Row(
      children: [
        Icon(
          Icons.home_repair_service,
          color: Colors.white,
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 8.0),
          child: Text(
            'Backoffice',
            style: TextStyle(color: Colors.white),
          ),
        ),
      ],
    ),
    actions: [
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Row(
          children: [
            IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.settings,
                  color: Colors.white,
                )),
            const Text(
              'Settings',
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.w200),
            )
          ],
        ),
      )
    ],
  );
}
