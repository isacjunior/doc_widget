import 'package:flutter/cupertino.dart';
import 'package:doc_widget/doc_widget.dart';

/// ```dart
/// final button = ButtoniOS('Button');
/// ```
@docWidget
class Button extends StatelessWidget {
  Button(this.text);

  /// String to show in button
  final String text;

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      color: const Color(0xff007aff),
      onPressed: () {},
      child: Text(text),
    );
  }
}
