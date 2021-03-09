import 'package:flutter/widgets.dart';
import 'package:doc_widget/src/elements.dart';
import 'package:doc_widget/src/styles/colors.dart';
import 'package:doc_widget/src/styles/spaces.dart';
import 'package:doc_widget/src/widgets/title.dart';

class ItemPreview extends StatelessWidget {
  ItemPreview(this.previews);
  final List<WidgetPreview> previews;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: Spaces.goldenDream),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextPreview(text: 'Preview'),
          ...List.generate(
            previews.length,
            (index) {
              final preview = previews[index];
              return Padding(
                padding: const EdgeInsets.only(
                  left: Spaces.springGreen,
                  bottom: Spaces.goldenDream,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (preview.description != null)
                      TextPreview(
                        text: preview.description!,
                        size: 14,
                        color: ColorsDoc.darkGray,
                      ),
                    preview.widget,
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
