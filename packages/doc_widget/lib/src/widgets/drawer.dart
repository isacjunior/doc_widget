import 'package:doc_widget/src/elements.dart';
import 'package:doc_widget/src/styles/colors.dart';
import 'package:doc_widget/src/widgets/title.dart';
import 'package:flutter/material.dart';

class DrawerCustom extends StatelessWidget {
  const DrawerCustom({required this.sections, required this.onTap, this.title});

  final List<ElementsSection> sections;
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
            ...sections
                .map((section) => DrawerSection(
                      section: section,
                      onTap: onTap,
                    ))
                .toList(),
          ],
        ),
      ),
    );
  }
}

class DrawerSection extends StatelessWidget {
  const DrawerSection({
    Key? key,
    required this.section,
    required this.onTap,
  }) : super(key: key);
  final ElementsSection section;
  final ValueChanged<ElementPreview> onTap;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisSize: MainAxisSize.min,
      children: [
        if (section.header != null)
          Container(
            child: Text(section.header!,
                style: Theme.of(context)
                    .textTheme
                    .labelMedium
                    ?.copyWith(color: ColorsDoc.ghostWhite)),
            color: ColorsDoc.darkGray,
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
          ),
        ...List.generate(
          section.elements.length,
          (index) => Column(
            children: [
              ListTile(
                onTap: () => onTap(section.elements[index]),
                title: Text(section.elements[index].document.name),
              ),
              const Divider(height: 1, thickness: 1),
            ],
          ),
        ),
      ],
    );
  }
}
