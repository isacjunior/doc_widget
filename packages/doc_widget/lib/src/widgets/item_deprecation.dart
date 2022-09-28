import 'package:doc_widget/src/styles/colors.dart';
import 'package:doc_widget/src/styles/spaces.dart';
import 'package:doc_widget/src/styles/text.dart';
import 'package:flutter/material.dart';

class ItemDeprecation extends StatelessWidget {
  final String message;

  const ItemDeprecation({Key? key, required this.message}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: Spacing.x4),
      padding: const EdgeInsets.all(Spacing.x4),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(Spacing.x2),
        color: ColorsDoc.warning50,
      ),
      child: Row(children: [
        const Icon(
          Icons.warning_amber_rounded,
          color: ColorsDoc.warning500,
        ),
        const SizedBox(width: Spacing.x2),
        Text(
          'Deprecated: $message',
          style: TextDS.bodySmall(color: ColorsDoc.warning900),
        )
      ]),
    );
  }
}
