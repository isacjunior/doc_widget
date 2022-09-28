import 'package:doc_widget/src/elements.dart';
import 'package:doc_widget/src/styles/colors.dart';
import 'package:doc_widget/src/styles/text.dart';
import 'package:flutter/material.dart';
import 'package:doc_widget/src/styles/spaces.dart';
import 'package:doc_widget/src/widgets/title.dart';

class ItemProperties extends StatelessWidget {
  ItemProperties(this.documentation);

  final Documentation documentation;

  Widget _builderHeader(String name) => Padding(
        padding: const EdgeInsets.all(Spacing.x4),
        child: Text(name, style: TextDS.bodySmallBold()),
      );

  Widget _builderItem(String name) => Padding(
        padding: const EdgeInsets.all(Spacing.x4),
        child: Text(name, style: TextDS.codeSmall),
      );

  @override
  Widget build(BuildContext context) {
    const borderRadius = BorderRadius.all(Radius.circular(Spacing.x2));

    return Container(
      width: MediaQuery.of(context).size.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          TextPreview(text: 'Properties'),
          const SizedBox(height: Spacing.x4),
          Table(
            border: TableBorder.all(
              color: ColorsDoc.border,
              borderRadius: borderRadius,
            ),
            children: [
              TableRow(
                decoration: const BoxDecoration(
                  color: ColorsDoc.neutral50,
                  borderRadius: borderRadius,
                ),
                children: [
                  _builderHeader('Name'),
                  _builderHeader('Type'),
                  _builderHeader('Required'),
                  _builderHeader('Default'),
                ],
              ),
              ...List.generate(
                documentation.properties.length,
                (index) {
                  final property = documentation.properties[index];
                  return TableRow(
                    children: [
                      _builderItem(property.isNamed ? property.name : '-'),
                      _builderItem(property.type),
                      _builderItem(property.isRequired.toString()),
                      _builderItem(property.defaultValue ?? '-'),
                    ],
                  );
                },
              )
            ],
          ),
        ],
      ),
    );
  }
}
