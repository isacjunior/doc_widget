import 'package:doc_widget_builder/src/utils/regex.dart';
import 'package:test/test.dart';

void main() {
  group('removeDocumentationComment', () {
    test('With single quotes', () {
      final snippet = '''
/// ```dart
/// final title = Title5('text');
/// ```
''';
      expect('''```dart
 final title = Title5('text');
 ```''', removeDocumentationComment(snippet));
    });

    test('With double quotes', () {
      final snippet = '''
/// ```dart
/// final title = Title5("Text");
/// ```
''';
      expect('''```dart
 final title = Title5("Text");
 ```''', removeDocumentationComment(snippet));
    });
  });
}
