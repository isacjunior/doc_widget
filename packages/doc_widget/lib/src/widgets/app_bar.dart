import 'package:doc_widget/src/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../styles/text.dart';

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
              Icons.menu_outlined,
              color: ColorsDoc.neutral300,
            ),
            onPressed: Scaffold.of(context).openDrawer,
          );
        },
      ),
      centerTitle: false,
      title: Text(
        title,
        style: TextDS.heading4,
      ),
      backgroundColor: ColorsDoc.white,
      elevation: 1,
      systemOverlayStyle: SystemUiOverlayStyle.light,
      shadowColor: ColorsDoc.white,
    );
  }
}
