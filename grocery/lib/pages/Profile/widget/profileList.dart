import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../theme/light_theme.dart';

Widget profileList({Icon? icon, String? name, Function? onClick}) {
  return Card(
    child: ListTile(
        contentPadding: const EdgeInsets.all(14.0),
        leading: icon ?? const Icon(Icons.abc),
        title: Text(
          name ?? ' ',
          style: lightTheme.textTheme.titleMedium,
        ),
        trailing: IconButton(
          onPressed: () => onClick!(),
          icon: Icon(
            CupertinoIcons.right_chevron,
            color: lightTheme.colorScheme.primary,
          ),
        )),
  );
}
