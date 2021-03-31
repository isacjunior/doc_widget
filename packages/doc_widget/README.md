<img src="https://i.imgur.com/syguI9x.png" />

![Build](https://github.com/isacjunior/doc_widget/workflows/Build/badge.svg)
[![Pub](https://img.shields.io/pub/v/doc_widget)](https://pub.dev/packages/doc_widget)

Do you need to create documentation that contains all information about your widgets? Don't worry, **doc_widget** will make this easier for you.

## Indice

- [What this solve?](#what-this-solve)
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
  - [VSCode launch](#vscode-launch)
  - [Exclude files from Analyzer](#exclude-files-from-analyzer)

# What this solve?

As we don’t have a reflection in Flutter, we cannot access informations about properties of a Widget, like a type and name of a properties for example. Besides that, we don't need to create another application that will show your widgets, doc_widget makes this easier.

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

![Doc Widget](https://i.imgur.com/8cbkl9m.png)

For more details, see [Example](https://github.com/isacjunior/doc_widget/tree/master/packages/doc_widget/example) and see [How to use](#how-to-use) for a complete guide.

# How to use

## Install

To use **doc_widget** you need to install `doc_widget`, `doc_widget_builder` and typical build_runner/code-generator setup.

```yaml
# pubspec.yaml
dependencies:
  doc_widget: doc_widget_version

dev_dependencies:
  doc_widget_builder: doc_widget_version
  build_runner: build_runner_version
```

- `doc_widget_version`: [![Pub](https://img.shields.io/pub/v/doc_widget)](https://pub.dev/packages/doc_widget)
- `build_runner_version`: [![Pub](https://img.shields.io/pub/v/build_runner)](https://pub.dev/packages/build_runner)

- `doc_widget` is a package that contains annotations and the application preview for your widgets.
- `doc_widget_builder`, the code generator to generate the documentation.
- `build_runner`, the tool to run code-generators.

## How to generate

You will need to annotate your Widget with `docWidget` annotation and after generate the code with all information about your widget.

```dart
import 'package:flutter/cupertino.dart';
import 'package:doc_widget/doc_widget.dart';

@docWidget
class Button extends StatelessWidget {
  Button(
    this.text, {
    required this.onPressed,
    this.color = const Color(0xff007aff),
  });

  final String text;
  final void Function() onPressed;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      color: color,
      onPressed: onPressed,
      child: Text(text),
    );
  }
}
```

After this, you need run the `runner_build` using this command bellow:

```shell
flutter pub run build_runner build
```

## Features

### Parameters

The code generator will contain all information about your parameters.

| Name          | Description                               |
| ------------- | ----------------------------------------- |
| Name          | Name of the parameter if is named         |
| Type          | Type of the parameter (null-safety)       |
| Required      | Whether your parameter is required or not |
| Default value | If has default value, this will show      |

### Snippet

You can describe how to use your widget with Snippet. You need to use a Documentation Comment `///` and wrap your snippet inside `dart` special formatter.

Below has an example of how to document your widget.

````dart
import 'package:doc_widget/doc_widget.dart';

/// ```dart
/// final button = Button(
///  'Button',
///  onPressed: () => print('Doc Widget'),
/// );
/// ```
@docWidget
class Button extends StatelessWidget {
  // ...
}
````

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

Don't worry about generated code, all this information will be used and rendered by `doc_widget`. All generated files contains a prefix `*.doc_widget.dart`. The generated class contains a suffix `DocWidget` to help you to differentiate of the widget.

**The only information that you need to know is the class name, in this case, is `ButtonDocWidget`.**

```dart
// button.doc_widget.dart

class ButtonDocWidget implements Documentation {
  // ...
}
```

## Doc Preview

You have many ways that create an application that will read and rendering the documentation. I will list two ways:

- Running your own project with a different target.
- Creating another application inside our project/package. Example: documentation

This is a flutter application that the main responsibility is to read all information generated and show your documentation. This job is manual and you need to insert all generated files in `*.doc_widget.dart`.

We use the first approach here and create a file `lib/doc_widget.dart` like the example below.

```dart
// lib/doc_widget.dart

void main() {

  final button = ElementPreview(
    document: ButtonDocWidget(), // From generated file
    previews: [
      WidgetPreview( // This will show your widget and a description about.
        widget: Button(
          'Button',
          onPressed: () => print('Hello'),
        ),
        description: 'Default button.',
      ),
    ],
  );

  runApp(DocPreview(elements: [button])); // Application that will show all elements.
}
```

### How to run

After creating a file that contains your doc files `lib/doc_widget.dart`, you need to run the application with `lib/doc_widget.dart` as a target.

If you prefer, you can run the doc_widget and host it with flutter web.

```shell
flutter run -d chrome -t lib/doc_widget.dart
```

![Desktop](https://i.imgur.com/AWn2GBW.png)

# VSCode launch

You use `VSCode`? You can insert `.vscode/launch.json` to automate the run job.

```json
{
  "version": "0.2.0",
  "configurations": [
    {
      "name": "doc_widget - Mobile",
      "request": "launch",
      "type": "dart",
      "program": "lib/doc_widget.dart"
    },
    {
      "name": "doc_widget - Web",
      "request": "launch",
      "type": "dart",
      "program": "lib/doc_widget.dart",
      "args": ["-d", "chrome"]
    },
    {
      "name": "main app",
      "request": "launch",
      "type": "dart",
      "program": "lib/main.dart"
    }
  ]
}
```

# Exclude files from Analyzer

In the case of the need to removed generated files from the analyzer, see below how to exclude them.

```yaml
analyzer:
  exclude:
    - "**/*.doc_widget.dart"
```
