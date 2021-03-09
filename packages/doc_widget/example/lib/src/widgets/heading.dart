import 'package:flutter/widgets.dart';
import 'package:doc_widget_annotation/doc_widget_annotation.dart';

///```dart
/// // With title
/// final headingTitle = Heading(title: 'Title');
/// // With subtitle
/// final headingWithSubtitle = Heading(title: 'Title', subtitle: 'Subtitle');
///```
@docWidget
class Heading extends StatelessWidget {
  Heading({required this.title, this.subtitle});

  /// Title description
  final String title;

  /// Subtitle description
  final String? subtitle;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title),
        if (subtitle != null) Text(subtitle!),
      ],
    );
  }
}
