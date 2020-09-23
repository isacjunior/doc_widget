library example;

import 'package:doc_widget_annotation/doc_widget_annotation.dart';
import 'package:flutter/widgets.dart';

@docWidget
class Example extends StatelessWidget {
  Example(this.text);

  final String text;
  @override
  Widget build(BuildContext context) => Text(text);
}
