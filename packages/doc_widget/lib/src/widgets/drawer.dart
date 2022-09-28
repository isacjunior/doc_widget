import 'package:doc_widget/src/elements.dart';
import 'package:doc_widget/src/styles/colors.dart';
import 'package:doc_widget/src/styles/spaces.dart';
import 'package:doc_widget/src/styles/text.dart';
import 'package:doc_widget/src/utils/platform.dart';
import 'package:doc_widget/src/widgets/navigation_item.dart';
import 'package:flutter/material.dart';

class DrawerCustom extends StatelessWidget {
  const DrawerCustom({
    required this.sections,
    required this.onTap,
    required this.selectedItem,
    this.title,
  });

  final List<ElementsSection> sections;
  final ValueChanged<ElementPreview> onTap;
  final String? title;
  final ElementPreview selectedItem;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      elevation: 2.0,
      backgroundColor: ColorsDoc.white,
      child: ListView(
        physics: const ClampingScrollPhysics(),
        padding: EdgeInsets.zero,
        children: <Widget>[
          if (isMobile()) const SizedBox(height: kToolbarHeight),
          Padding(
            padding: EdgeInsets.only(
              top: isMobile() ? Spacing.zero : Spacing.x4,
              left: Spacing.x4,
              right: Spacing.x4,
              bottom: Spacing.x4,
            ),
            child: Text(title ?? 'DocWidget', style: TextDS.heading4),
          ),
          ...sections
              .map(
                (section) => DrawerSection(
                  selectedItem: selectedItem,
                  section: section,
                  onTap: onTap,
                ),
              )
              .toList(),
        ],
      ),
    );
  }
}

class DrawerSection extends StatelessWidget {
  const DrawerSection({
    Key? key,
    required this.section,
    required this.onTap,
    required this.selectedItem,
  }) : super(key: key);
  final ElementsSection section;
  final ValueChanged<ElementPreview> onTap;
  final ElementPreview selectedItem;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: Spacing.x6),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(
              vertical: Spacing.x3,
              horizontal: Spacing.x4,
            ),
            child: Text(section.title, style: TextDS.subHeader),
          ),
          ...List.generate(
            section.elements.length,
            (index) => NavigationItem(
              selected: section.elements[index] == selectedItem,
              onTap: () => onTap(section.elements[index]),
              title: section.elements[index].document.name,
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: Spacing.x2),
            child: Divider(
              height: 1,
              color: ColorsDoc.border,
            ),
          ),
        ],
      ),
    );
  }
}
