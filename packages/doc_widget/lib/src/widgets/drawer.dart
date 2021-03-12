import 'package:doc_widget/src/elements.dart';
import 'package:doc_widget/src/styles/colors.dart';
import 'package:doc_widget/src/widgets/title.dart';
import 'package:flutter/material.dart';

class DrawerCustom extends StatelessWidget {
  const DrawerCustom({required this.elements, required this.onTap, this.title});

  final List<ElementPreview> elements;
  final ValueChanged<ElementPreview> onTap;
  final String? title;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: ColorsDoc.ghostWhite,
        child: ListView(
          physics: const ClampingScrollPhysics(),
          padding: EdgeInsets.zero,
          children: <Widget>[
            Container(
              height: 110,
              child: DrawerHeader(
                child: TextPreview(text: title ?? 'doc_widget'),
                decoration: const BoxDecoration(
                  color: ColorsDoc.white,
                ),
              ),
            ),
            ...List.generate(
              elements.length,
              (index) => Column(
                children: [
                  ListTile(
                    onTap: () => onTap(elements[index]),
                    title: Text(elements[index].document.name),
                  ),
                  const Divider(),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
