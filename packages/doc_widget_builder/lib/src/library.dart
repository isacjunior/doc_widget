import 'package:analyzer/dart/element/element.dart';
import 'package:code_builder/code_builder.dart';
import 'package:dart_style/dart_style.dart';
import 'package:doc_widget_builder/src/utils/regex.dart';
import 'package:doc_widget_builder/src/utils/types.dart';
import 'package:source_gen/source_gen.dart';

String generateLibrary(ClassElement element) {
  final name = element.name;
  final hasState = hasType(element.allSupertypes, 'StatefulWidget');
  final snippet = getSnippet(
      removeDocumentationComment(element.documentationComment ?? '') ?? '');
  final emitter = DartEmitter();
  final dartFormatter = DartFormatter();

  final getSnippetMethod = Method(
    (m) => m
      ..type = MethodType.getter
      ..returns = refer('String')
      ..lambda = true
      ..annotations.add(refer('override'))
      ..body = Code(formatSnippet(dartFormatter, snippet, element))
      ..name = 'snippet',
  );

  final getNameMethod = Method(
    (m) => m
      ..type = MethodType.getter
      ..returns = refer('String')
      ..lambda = true
      ..annotations.add(refer('override'))
      ..body = Code("'$name'")
      ..name = 'name',
  );

  final getHasStateMethod = Method(
    (m) => m
      ..type = MethodType.getter
      ..returns = refer('bool')
      ..lambda = true
      ..annotations.add(refer('override'))
      ..body = Code('$hasState')
      ..name = 'hasState',
  );

  final getPropertiesMethod = Method(
    (m) => m
      ..type = MethodType.getter
      ..returns = refer('List<PropertyDoc>')
      ..lambda = true
      ..annotations.add(refer('override'))
      ..body = Code('[${_getParametersString(element)}]')
      ..name = 'properties',
  );

  final classDoc = Class(
    (c) => c
      ..name = '${name}DocWidget'
      ..implements.add(refer('Documentation'))
      ..methods.addAll([
        getNameMethod,
        getHasStateMethod,
        getPropertiesMethod,
        getSnippetMethod
      ]),
  );

  final importDocs = "import 'package:doc_widget/doc_widget.dart';";

  return dartFormatter.format('$importDocs ${classDoc.accept(emitter)}');
}

String formatSnippet(
    DartFormatter formatter, String code, ClassElement element) {
  try {
    return "'''${formatter.format(code)}'''";
  } catch (e) {
    throw InvalidGenerationSourceError(
      'Snippet code should be valid dart code',
      element: element,
    );
  }
}

void _generateParametersRequired(StringBuffer buffer, ParameterElement param) {
  final name = param.name;
  final isRequired = param.hasRequired || param.isNotOptional;
  final isNamed = param.isNamed;
  final type = param.type.getDisplayString(withNullability: true);
  buffer.writeln(
    "PropertyDoc(name: '$name', isRequired: $isRequired, isNamed: $isNamed, type: '$type',",
  );
}

String? getDefaultValue(ParameterElement param) {
  final paramToString = param.type.getDisplayString(withNullability: true);
  final paramIsString = paramToString.contains('String');
  final defaultValue = param.defaultValueCode;
  return paramIsString ? defaultValue : "'$defaultValue'";
}

String _getParametersString(ClassElement element) {
  final parameters = element.unnamedConstructor?.parameters ?? [];
  final parametersBuffer = StringBuffer();
  for (final param in parameters) {
    _generateParametersRequired(parametersBuffer, param);
    if (getDescription(param.name, element.fields) != null) {
      parametersBuffer.write(
          "description: '${getDescription(param.name, element.fields)}',");
    }
    if (param.defaultValueCode != null) {
      parametersBuffer.write('defaultValue: ${getDefaultValue(param)},');
    }
    parametersBuffer.write('),');
  }
  return parametersBuffer.toString();
}

String? getDescription(String name, List<FieldElement> fields) {
  final hasField = fields.any((field) => field.name == name);
  if (hasField) {
    final field = fields.firstWhere((element) => element.name == name);
    final hasDocumentation = field.documentationComment != null;
    if (hasDocumentation)
      return hasDocumentation
          ? removeDocumentationComment(field.documentationComment)
          : null;
  } else {
    return null;
  }
}
