import 'package:doc_widget/src/styles/colors.dart';
import 'package:flutter/widgets.dart';

const _fontFamily = 'Helvetica Neue';

class TextDS {
  const TextDS._();

  static const subHeader = TextStyle(
    color: ColorsDoc.neutral300,
    fontFamily: _fontFamily,
    fontWeight: FontWeight.w700,
    fontSize: 12.0,
    fontStyle: FontStyle.normal,
  );

  static TextStyle bodySmall({
    Color color = ColorsDoc.neutral500,
  }) =>
      TextStyle(
        color: color,
        fontFamily: _fontFamily,
        fontWeight: FontWeight.w400,
        fontSize: 14.0,
        fontStyle: FontStyle.normal,
      );

  static const codeSmall = TextStyle(
    color: ColorsDoc.neutral500,
    fontFamily: 'Roboto Mono',
    fontWeight: FontWeight.w400,
    fontSize: 14.0,
    fontStyle: FontStyle.normal,
    letterSpacing: -0.25,
  );

  static const heading3 = TextStyle(
    color: ColorsDoc.neutral500,
    fontFamily: _fontFamily,
    fontWeight: FontWeight.w700,
    fontSize: 32.0,
    fontStyle: FontStyle.normal,
  );

  static const heading4 = TextStyle(
    color: ColorsDoc.neutral500,
    fontFamily: _fontFamily,
    fontWeight: FontWeight.w700,
    fontSize: 24.0,
    fontStyle: FontStyle.normal,
  );

  static TextStyle bodySmallBold({
    Color color = ColorsDoc.neutral500,
  }) =>
      TextStyle(
        color: color,
        fontFamily: _fontFamily,
        fontWeight: FontWeight.w700,
        fontSize: 14.0,
        fontStyle: FontStyle.normal,
      );

  static const bodyRegular = TextStyle(
    color: ColorsDoc.neutral300,
    fontFamily: _fontFamily,
    fontWeight: FontWeight.w400,
    fontSize: 16.0,
    fontStyle: FontStyle.normal,
  );
}
