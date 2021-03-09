import 'package:flutter/widgets.dart';
import 'package:doc_widget/src/styles/spaces.dart';
import 'package:doc_widget/src/widgets/highlight.dart';
import 'package:doc_widget/src/widgets/title.dart';

class ItemSnippet extends StatelessWidget {
  ItemSnippet(this.snippet);
  final String snippet;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: Spaces.goldenDream),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextPreview(text: 'Snippet'),
          HighlightSnippet(snippet),
        ],
      ),
    );
  }
}
