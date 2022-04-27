// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: prefer_single_quotes

// **************************************************************************
// DocWidgetGenerator
// **************************************************************************

import 'package:doc_widget/doc_widget.dart';

class HeadingDocWidget implements Documentation {
  @override
  String get name => 'Heading';
  @override
  bool get hasState => false;
  @override
  String? get deprecation => null;
  @override
  List<PropertyDoc> get properties => [
        PropertyDoc(
          name: 'title',
          isRequired: true,
          isNamed: true,
          type: 'String',
          description: 'Title description',
        ),
        PropertyDoc(
          name: 'subtitle',
          isRequired: false,
          isNamed: true,
          type: 'String?',
          description: 'Subtitle description',
        ),
      ];
  @override
  String get snippet => '''// With title
final headingTitle = Heading(title: 'Title');
// With subtitle
final headingWithSubtitle = Heading(title: 'Title', subtitle: 'Subtitle');
''';
}
