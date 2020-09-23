String removeDocumentationComment(String element) {
  final regex = RegExp(r'\/{3}');
  return element.replaceAll(regex, '').trim();
}

String getSnippet(String element) {
  final regex = RegExp(r'(.*dart|```.*)');
  final stringWithoutDoubleQuotes = element.replaceAll('"', "'");
  return stringWithoutDoubleQuotes.replaceAll(regex, '').trim();
}
