import 'package:doc_widget/src/styles/text.dart';
import 'package:flutter/widgets.dart';

class TextPreview extends StatelessWidget {
  TextPreview({
    required this.text,
    this.size = 18,
  });
  final String text;
  final double size;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(
        text,
        style: TextDS.heading3,
      ),
    );
  }
}
