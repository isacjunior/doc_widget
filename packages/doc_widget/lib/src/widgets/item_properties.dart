import 'package:doc_widget/src/elements.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:doc_widget/src/styles/spaces.dart';
import 'package:doc_widget/src/widgets/title.dart';

class ItemProperties extends StatelessWidget {
  ItemProperties(this.documentation);

  final Documentation documentation;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          TextPreview(text: 'Properties'),
          DataTable(
            columnSpacing: 16,
            dividerThickness: 0.4,
            horizontalMargin: Spaces.dodgerBlue,
            headingRowHeight: 36,
            columns: [
              const DataColumn(label: Text('Name')),
              const DataColumn(label: Text('Type')),
              const DataColumn(label: Text('Required')),
              const DataColumn(label: Text('Default')),
            ],
            rows: List.generate(
              documentation.properties.length,
              (index) {
                final property = documentation.properties[index];
                return DataRow(cells: [
                  DataCell(Text(property.isNamed ? property.name : '')),
                  DataCell(Text(
                    property.type,
                    style: const TextStyle(color: Color(0xffe45649)),
                  )),
                  DataCell(Text(property.isRequired.toString(),
                      style: const TextStyle(color: Color(0xffa626a4)))),
                  DataCell(Text(
                    property.defaultValue ?? '',
                    style: const TextStyle(color: Color(0xff50a14f)),
                  )),
                ]);
              },
            ),
          )
        ],
      ),
    );
  }
}
