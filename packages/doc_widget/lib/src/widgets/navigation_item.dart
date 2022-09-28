import 'package:doc_widget/src/styles/colors.dart';
import 'package:flutter/material.dart';
import '../styles/spaces.dart';
import '../styles/text.dart';

class NavigationItem extends StatelessWidget {
  const NavigationItem({
    Key? key,
    required this.onTap,
    required this.title,
    this.selected = false,
  }) : super(key: key);

  final VoidCallback onTap;
  final String title;
  final bool selected;

  @override
  Widget build(BuildContext context) {
    final style = selected
        ? TextDS.bodySmallBold(color: ColorsDoc.primary500)
        : TextDS.bodySmall();

    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: selected ? ColorsDoc.primary50 : Colors.transparent,
          borderRadius: const BorderRadius.all(Radius.circular(Spacing.x2)),
        ),
        padding: const EdgeInsets.symmetric(
          vertical: Spacing.x3,
          horizontal: Spacing.x4,
        ),
        child: Text(title, style: style),
      ),
    );
  }
}
