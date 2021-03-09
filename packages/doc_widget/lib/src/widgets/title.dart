import 'package:flutter/widgets.dart';
import 'package:doc_widget/src/styles/colors.dart';
import 'package:doc_widget/src/styles/spaces.dart';

class TextPreview extends StatelessWidget {
  TextPreview({
    required this.text,
    this.size = 18,
    this.color = ColorsDoc.darkSlateGray,
  });
  final String text;
  final double size;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: Spaces.springGreen),
      child: Text(
        text,
        style: TextStyle(
          color: color,
          fontSize: size,
        ),
      ),
    );
  }
}
