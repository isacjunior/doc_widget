import 'package:doc_widget/src/elements.dart';
import 'package:flutter/widgets.dart';
import 'package:doc_widget/src/widgets/item_deprecation.dart';
import 'package:doc_widget/src/widgets/item_preview.dart';
import 'package:doc_widget/src/widgets/item_properties.dart';
import 'package:doc_widget/src/widgets/item_snippet.dart';

class Item extends StatelessWidget {
  Item(this.element);
  final ElementPreview element;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (element.document.deprecation != null)
          ItemDeprecation(message: element.document.deprecation!),
        ItemProperties(element.document),
        ItemPreview(element.previews),
        if (element.document.snippet.isNotEmpty)
          ItemSnippet(element.document.snippet),
      ],
    );
  }
}
