import 'package:flutter/widgets.dart';
import 'package:doc_widget/src/styles/colors.dart';
import 'package:doc_widget/src/styles/spaces.dart';
import 'package:doc_widget/src/styles/theme_snippet.dart';
import 'package:doc_widget/src/widgets/snippet_copy.dart';

import 'package:flutter_highlight/flutter_highlight.dart';
import 'package:google_fonts/google_fonts.dart';

class HighlightSnippet extends StatelessWidget {
  HighlightSnippet(this.snippet) : assert(snippet != null);

  final String snippet;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: ColorsDoc.ghostWhite,
      child: Stack(
        children: [
          HighlightView(
            snippet,
            language: 'dart',
            theme: docsLightTheme,
            padding: const EdgeInsets.only(
              top: Spaces.dodgerBlue,
              left: Spaces.dodgerBlue,
            ),
            textStyle: GoogleFonts.notoSans(),
          ),
          SnippetCopy(snippet),
        ],
      ),
    );
  }
}
