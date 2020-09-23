import 'package:doc_widget_annotation/doc_widget_annotation.dart';
import 'package:doc_widget_builder/src/generator.dart';
import 'package:source_gen_test/source_gen_test.dart';

Future<void> main() async {
  final libraryReader =
      await initializeLibraryReaderForDirectory('test', 'source_gen.dart');
  initializeBuildLogTracking();
  testAnnotatedElements<DocWidget>(libraryReader, DocWidgetGenerator());
}
