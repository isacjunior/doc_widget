import 'package:example/src/widgets/button.dart';
import 'package:example/src/widgets/button.doc_widget.dart';
import 'package:example/src/widgets/heading.dart';
import 'package:example/src/widgets/heading.doc_widget.dart';
import 'package:flutter/material.dart';
import 'package:doc_widget/doc_widget.dart';

void main() {
  final heading = ElementPreview(
    document: HeadingDocWidget(),
    previews: [
      WidgetPreview(
        widget: Heading(title: 'Title'),
        description: 'Heading with title',
      ),
      WidgetPreview(
        widget: Heading(
          title: 'Title',
          subtitle: 'Subtitle',
        ),
        description: 'Heading with title and subtitle',
      ),
    ],
  );
  final button = ElementPreview(
    document: ButtonDocWidget(),
    previews: [
      WidgetPreview(
        // ignore: deprecated_member_use_from_same_package
        widget: Button(
          'Button',
          // ignore: avoid_print
          onPressed: () => print('Hello'),
        ),
        description: 'Default button.',
      ),
    ],
  );
  runApp(
    DocPreview(
      title: 'Example',
      sections: [
        ElementsSection(
          title: 'Elements',
          elements: [
            button,
            heading,
          ],
        ),
      ],
    ),
  );
}
