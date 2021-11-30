import 'package:doc_widget_builder/src/utils/regex.dart';
import 'package:test/test.dart';

void main() {
  test('With single quotes', () {
    final snippet = '''
```dart
final title = Title5('text');
```
Other comments
''';
    expect(getSnippet(snippet), "final title = Title5('text');");
  });
}
