import 'package:doc_widget_annotation/doc_widget_annotation.dart';
import 'package:flutter/material.dart';
import 'package:source_gen_test/annotations.dart';

// Elements that aren't widgets
@ShouldThrow('Error, the decorated element is not a Widget')
@docWidget
void function() {}

@ShouldThrow('Error, the decorated element is not a Widget')
@docWidget
class Clazz {}

// Fake flutter
class StatefullWidget {}

@ShouldThrow('Error, the decorated element is not a Widget')
@docWidget
class Element extends StatefullWidget {}

// Elements that not contain a valid dart code in documentation
@ShouldThrow('Snippet code should be valid dart code')
@docWidget

/// ```dart
/// let = Title('text);
/// ```
class InvalidSnippet extends StatelessWidget {
  @override
  Widget build(BuildContext context) => const Text('Test');
}

// Check widget name
@ShouldGenerate(r'''
  @override
  String get name => 'Name';
''', contains: true)
@docWidget
class Name extends StatelessWidget {
  @override
  Widget build(BuildContext context) => const Text('Test');
}

// Check hasSatate with StatelessWidget
@ShouldGenerate(r'''
  @override
  bool get hasState => false;
''', contains: true)
@docWidget
class NoHasState extends StatelessWidget {
  @override
  Widget build(BuildContext context) => const Text('Test');
}

// Check hasSatate with StatefulWidget
@ShouldGenerate(r'''
  @override
  bool get hasState => true;
''', contains: true)
@docWidget
class HasState extends StatefulWidget {
  @override
  _HasStateState createState() => _HasStateState();
}

class _HasStateState extends State<HasState> {
  @override
  Widget build(BuildContext context) => Container();
}

// Should contain snippet
@ShouldGenerate('final title = Title5()', contains: true)

/// ```dart
/// final title = Title5();
/// ```
@docWidget
class ContainSnippet extends StatelessWidget {
  @override
  Widget build(BuildContext context) => const Text('Test');
}

// Should contain property description
@ShouldGenerate("description: 'Title description'", contains: true)

/// ```dart
/// final description = Description('Text');
/// ```
@docWidget
class Description extends StatelessWidget {
  Description(this.title);

  /// Title description
  final String title;
  @override
  Widget build(BuildContext context) => const Text('Test');
}

// Should contain property default
@ShouldGenerate("defaultValue: 'default value title'", contains: true)
@docWidget
class DefaultValue extends StatelessWidget {
  DefaultValue({this.title = 'default value title'});

  /// Title description
  final String title;
  @override
  Widget build(BuildContext context) => Text(title);
}

// Should contain named parameter
@ShouldGenerate('isNamed: true,', contains: true)
@docWidget
class NamedParameter extends StatelessWidget {
  NamedParameter({this.title});

  /// Title description
  final String? title;
  @override
  Widget build(BuildContext context) => Text(title ?? '');
}

// Shouldn't contain named parameter
@ShouldGenerate('isNamed: false,', contains: true)
@docWidget
class NoIsNamedParameter extends StatelessWidget {
  NoIsNamedParameter(this.title);

  /// Title description
  final String title;
  @override
  Widget build(BuildContext context) => Text(title);
}

// Shouldn't contain required parameter and named true
// Should contain the String nullable
@ShouldGenerate('''PropertyDoc(
          name: 'title',
          isRequired: false,
          isNamed: true,
          type: 'String?',
        ),''', contains: true)
@docWidget
class NoRequiredParameter extends StatelessWidget {
  NoRequiredParameter({this.title});

  final String? title;
  @override
  Widget build(BuildContext context) => Text(title ?? '');
}

// Should contain required parameter with named true
@ShouldGenerate('''PropertyDoc(
          name: 'title',
          isRequired: true,
          isNamed: true,
          type: 'String',
        ),''', contains: true)
@docWidget
class RequiredParameterNamed extends StatelessWidget {
  RequiredParameterNamed({required this.title});

  final String title;
  @override
  Widget build(BuildContext context) => Text(title);
}

// Should contain required parameter and isNamed false
@ShouldGenerate('''PropertyDoc(
          name: 'title',
          isRequired: true,
          isNamed: false,
          type: 'String',
        ),''', contains: true)
@docWidget
class RequiredParameterUnnamed extends StatelessWidget {
  RequiredParameterUnnamed(this.title);

  final String title;
  @override
  Widget build(BuildContext context) => Text(title);
}

// Should contain two properties
@ShouldGenerate('''List<PropertyDoc> get properties => [
        PropertyDoc(
          name: 'title',
          isRequired: true,
          isNamed: false,
          type: 'String',
        ),
        PropertyDoc(
          name: 'subtitle',
          isRequired: true,
          isNamed: false,
          type: 'String',
        ),
      ];''', contains: true)
@docWidget
class MoreProperties extends StatelessWidget {
  MoreProperties(this.title, this.subtitle);

  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) => Text('$title: $subtitle');
}

// Full example generated
@ShouldGenerate(
  'import \'package:doc_widget/doc_widget.dart\';\n'
  '\n'
  'class FullExampleDocWidget implements Documentation {\n'
  '  @override\n'
  '  String get name => \'FullExample\';\n'
  '  @override\n'
  '  bool get hasState => false;\n'
  '  @override\n'
  '  List<PropertyDoc> get properties => [\n'
  '        PropertyDoc(\n'
  '          name: \'title\',\n'
  '          isRequired: true,\n'
  '          isNamed: false,\n'
  '          type: \'String\',\n'
  '          description: \'Title description\',\n'
  '        ),\n'
  '        PropertyDoc(\n'
  '          name: \'subtitle\',\n'
  '          isRequired: false,\n'
  '          isNamed: true,\n'
  '          type: \'String\',\n'
  '          defaultValue: \'subtitle default\',\n'
  '        ),\n'
  '      ];\n'
  '  @override\n'
  '  String get snippet => \'\'\'\n'
  '\'\'\';\n'
  '}\n'
  '',
)
@docWidget
class FullExample extends StatelessWidget {
  FullExample(this.title, {this.subtitle = 'subtitle default'});

  /// Title description
  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) => Text('$title: $subtitle');
}
