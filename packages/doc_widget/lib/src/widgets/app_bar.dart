import 'package:doc_widget/src/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppBarCustom extends StatelessWidget {
  const AppBarCustom({required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: Builder(
        builder: (BuildContext context) {
          return IconButton(
            icon: const Icon(
              Icons.menu,
              color: ColorsDoc.darkGray,
            ),
            onPressed: Scaffold.of(context).openDrawer,
          );
        },
      ),
      centerTitle: false,
      title: Text(
        title,
        style: const TextStyle(color: ColorsDoc.darkSlateGray),
      ),
      backgroundColor: ColorsDoc.white,
      elevation: 2,
      systemOverlayStyle: SystemUiOverlayStyle.light,
      shadowColor: ColorsDoc.ghostWhite,
    );
  }
}
