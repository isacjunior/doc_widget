import 'package:doc_widget/src/styles/text.dart';
import 'package:flutter/widgets.dart';
import 'package:doc_widget/src/elements.dart';
import 'package:doc_widget/src/styles/spaces.dart';
import 'package:doc_widget/src/widgets/title.dart';

class ItemPreview extends StatelessWidget {
  ItemPreview(this.previews);
  final List<WidgetPreview> previews;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: Spacing.x8),
        TextPreview(text: 'Preview'),
        const SizedBox(height: Spacing.x4),
        ...List.generate(
          previews.length,
          (index) {
            final preview = previews[index];
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (preview.description != null)
                  Text(
                    preview.description!,
                    style: TextDS.bodyRegular,
                  ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: Spacing.x2),
                  child: preview.widget,
                ),
              ],
            );
          },
        ),
      ],
    );
  }
}
