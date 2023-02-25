import 'package:flutter/material.dart';
import 'myvariables.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String text;
  const MyAppBar({
    Key? key,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: MyVariables.mainColor,
      title: Text(
        text,
        style: TextStyle(
            fontSize: 28,
            fontFamily: MyVariables.titleFont,
            fontWeight: FontWeight.bold),
      ),
      centerTitle: true,
      // la hauteur de l'AppBar est définie à 80
      // vous pouvez modifier cette valeur selon vos besoins
      // preferredSize: Size.fromHeight(80),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(55);
}
