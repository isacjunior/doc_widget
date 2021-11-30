String? removeDocumentationComment(String? element) {
  final regex = RegExp(r'\/{3}');
  return element?.replaceAll(regex, '').trim();
}

String getSnippet(String element) {
  final regex = RegExp(r'\```dart([\s\S]*?)\```');
  final stringWithoutDoubleQuotes = element.replaceAll('"', "'");
  final match = regex.firstMatch(stringWithoutDoubleQuotes);
  return match?.group(1)?.trim() ?? '';
}
