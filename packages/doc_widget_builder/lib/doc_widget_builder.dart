library doc_widget_builder;

import 'package:build/build.dart';
import 'package:doc_widget_builder/src/generator.dart';
import 'package:source_gen/source_gen.dart';

Builder docWidgetBuilder(BuilderOptions options) =>
    LibraryBuilder(DocWidgetGenerator(),
        generatedExtension: '.doc_widget.dart', header: '''
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: prefer_single_quotes
    ''');
