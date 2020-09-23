import 'package:doc_widget_builder/src/utils/regex.dart';
import 'package:test/test.dart';

void main() {
  test('With single quotes', () {
    final snippet = '''
```dart
final title = Title5('text');
```
''';
    expect("final title = Title5('text');", getSnippet(snippet));
  });
}
