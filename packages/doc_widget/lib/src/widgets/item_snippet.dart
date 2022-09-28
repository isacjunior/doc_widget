import 'package:flutter/widgets.dart';
import 'package:doc_widget/src/styles/spaces.dart';
import 'package:doc_widget/src/widgets/highlight.dart';
import 'package:doc_widget/src/widgets/title.dart';

class ItemSnippet extends StatelessWidget {
  ItemSnippet(this.snippet);
  final String snippet;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: Spacing.x8),
        TextPreview(text: 'How to use'),
        const SizedBox(height: Spacing.x4),
        HighlightSnippet(snippet),
        const SizedBox(height: Spacing.x8),
      ],
    );
  }
}
