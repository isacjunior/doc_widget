import 'package:analyzer/dart/element/element.dart';
import 'package:build/build.dart';
import 'package:doc_widget_annotation/doc_widget_annotation.dart';
import 'package:doc_widget_builder/src/library.dart';
import 'package:doc_widget_builder/src/utils/types.dart';
import 'package:source_gen/source_gen.dart';

class DocWidgetGenerator extends GeneratorForAnnotation<DocWidget> {
  @override
  String generateForAnnotatedElement(
    Element element,
    ConstantReader annotation,
    BuildStep buildStep,
  ) {
    if (element is ClassElement && isWidget(element.allSupertypes)) {
      return generateLibrary(element);
    } else {
      throw InvalidGenerationSourceError(
        'Error, the decorated element is not a Widget',
        element: element,
      );
    }
  }
}
