# Doc Widget

![Build](https://github.com/isacjunior/doc_widget/workflows/Build/badge.svg)
[![Pub](https://img.shields.io/pub/v/doc_widget)](https://pub.dev/packages/doc_widget)

Do you need to create documentation that contains all information about your widgets? Don't worry, **doc_widget** will make this easier for you.

## Indice
- [Quick start](#quick-start)
- [How to use](#how-to-use)
  - [Install](#install)
  - [How to generate](#how-to-generate)
  - [Features](#features)
    - [Parameters](#parameters)
    - [Snippet](#snippet)
  - [Generated file](#generated-file)
  - [Doc preview](#doc-preview)
    - [How to run](#how-to-run)

# Quick Start
- Install the dependencies.
  - dependencies: `doc_widget`
  - dev_dependencies: `doc_widget_builder`, `build_runner`
- Annotate widgets with `@docWidget`.
```dart
@docWidget
class Button extends StatelessWidget
```
- Run `build_runner` to generate code. This will generate the documentation code.
```shell
flutter pub run build_runner build
```
- Create a `lib/doc_widget.dart` file to use the documentation code. Use `DocPreview` application in `lib/doc_widget.dart` and run this as a target file.
 `flutter run -t lib/doc_widget.dart`

![Doc Widget](https://i.imgur.com/RZ9YO5N.png)

For more details, see [Example](https://github.com/isacjunior/doc_widget/tree/master/packages/doc_widget/example) and see [How to use](#how-to-use) for a complete guide.

# How to use

## Install
To use **doc_widget** you need to install `doc_widget`, `doc_widget_builder` and typical build_runner/code-generator setup.

```yaml
# pubspec.yaml
dependencies:
  doc_widget:

dev_dependencies:
  doc_widget_builder:
  build_runner:
```

- `doc_widget` is a package that contains annotations and the application preview for your widgets.
- `doc_widget_builder`, the code generator to generate the documentation.
- `build_runner`, the tool to run code-generators.

## How to generate

You will need to annotate your Widget with `docWidget` annotation and after generate the code with all information about your widget.

```dart
import 'package:doc_widget/doc_widget.dart';

@docWidget
class Button extends StatelessWidget {
  // ...  
}
```

After this, you need run the `runner_build` using this command bellow:
```shell
flutter pub run build_runner build
```

## Features

### Parameters

The code generator will contain all information about your parameters.

| Name | Description |
| --- | --- |
| Name | Name of the parameter if is named |
| Type | Type of the parameter |
| Required | Whether your parameter is required or not |
| Default value | If has default value, this will show |

### Snippet

You can describe how to use your widget with Snippet. You need to use a Documentation Comment `///` and wrap your snippet inside `dart` special formatter.

Below has an example of how to document your widget.

```dart
import 'package:doc_widget/doc_widget.dart';

/// ```dart
/// final title = Title(title: "Amazing");
/// ```
@docWidget
class Title extends StatelessWidget {
  // ...
}
```

<!-- ### State

State will inform If your widget is a StatefullWidget or not.

*without state:*
```dart
import 'package:doc_widget/doc_widget.dart';

@docWidget
class Dash extends StatelessWidget {
  // ...
}
```

*with state:*
```dart
import 'package:doc_widget/doc_widget.dart';

@docWidget
class Bird extends StatefulWidget {
  // ...
}
``` -->

## Generated file

The generated code should be similar to this but don't worry about this, all this information will be used and rendered for `doc_widget`. All generated file contains a suffix `DocWidget` to help you to differentiate of widget. 

- Widget file: `title.dart`
```dart
import 'package:doc_widget/doc_widget.dart';

/// ```dart
/// final title = Title(title: "Amazing");
/// ```
@docWidget
class Title extends StatelessWidget {
  Title({ this.title = 'Amazing' });

  final String title;
}
```

- Generated file by doc_widget: `title.doc_widget.dart`

```dart
// title.doc_widget.dart

class TitleDocWidget implements Documentation {
  @override
  String get name => 'Title';
  @override
  List<PropertyDoc> get properties => [
        PropertyDoc(
          name: 'title',
          isRequired: false,
          type: 'String',
          defaultValue: 'Amazing',
        ),
      ];
  @override
  String get snippet => '''final title = Title(title: 'Amazing');''';
}
```

## Doc Preview

This is a flutter application that the main responsibility is to read all information generated and show your documentation. This job is manual and you need to insert all generated files in `*.doc_widget.dart`.

We recommend create a file `lib/doc_widget.dart` like a example below.

```dart
// lib/doc_widget.dart

void main() {

  final titleItem = ElementPreview(
    document: TitleDocWidget(), // From generated file
    previews: [
      WidgetPreview( // This will show your widget and a description about.
          widget: Title(title: 'Amazing'),
          description: 'With text Amazing',
      ),
    ],
  );

  runApp(DocPreview(elements: [titleItem])); // Application that will show all elements.
}
```

### How to run

After creating a file that contains your doc files `lib/doc_widget.dart`, you need to run the application with `lib/doc_widget.dart` as a target.

```shell
flutter run -t lib/doc_widget.dart`
```

You use `VSCode`? You can insert `.vscode/launch.json` to automate this job.

```json
{
    "version": "0.2.0",
    "configurations": [
        {
            "name": "doc_widget app",
            "request": "launch",
            "type": "dart",
            "program": "lib/doc_widget.dart",
        },
        {
            "name": "main app",
            "request": "launch",
            "type": "dart",
            "program": "lib/main.dart",
        },
    ]
}
```

