import 'package:doc_widget/src/styles/text.dart';
import 'package:flutter/widgets.dart';
import 'package:doc_widget/src/styles/colors.dart';
import 'package:doc_widget/src/styles/spaces.dart';
import 'package:doc_widget/src/styles/theme_snippet.dart';
import 'package:doc_widget/src/widgets/snippet_copy.dart';

import 'package:flutter_highlight/flutter_highlight.dart';

class HighlightSnippet extends StatelessWidget {
  HighlightSnippet(this.snippet);

  final String snippet;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(Spacing.x2),
      child: Container(
        color: ColorsDoc.neutral50,
        child: Stack(
          children: [
            HighlightView(
              snippet,
              textStyle: TextDS.codeSmall,
              language: 'dart',
              theme: docsLightTheme,
              padding: const EdgeInsets.only(
                top: Spacing.x6,
                left: Spacing.x6,
              ),
            ),
            SnippetCopy(snippet),
          ],
        ),
      ),
    );
  }
}
