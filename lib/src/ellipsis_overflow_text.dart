import 'package:flutter/material.dart';

///
/// Flutter widget that automatically sets the number of lines to be shown on a text
/// with the ellipsis overflow type.
///
class EllipsisOverflowText extends StatelessWidget {
  const EllipsisOverflowText(
    this.data, {
    Key? key,
    this.textKey,
    this.locale,
    this.maxLines,
    this.semanticsLabel,
    this.selectionColor,
    this.softWrap,
    this.strutStyle,
    this.style,
    this.textAlign,
    this.textDirection,
    this.textHeightBehavior,
    this.textScaleFactor,
    this.textWidthBasis,
  })  : assert(data != '', 'text can\'t be empty.'),
        assert(
          maxLines == null || maxLines > 0,
          'maxLines must be greather than 0.',
        ),
        assert(
          key == null || key != textKey,
          'Key and textKey must not be equal.',
        ),
        super(key: key);

  /// Sets the key for the resulting [Text] widget.
  ///
  /// This allows you to find the actual `Text` widget built by `AutoSizeText`.
  final Key? textKey;

  /// The text to display.
  ///
  /// This will be null if a [textSpan] is provided instead.
  final String data;

  /// If non-null, the style to use for this text.
  ///
  /// If the style's "inherit" property is true, the style will be merged with
  /// the closest enclosing [DefaultTextStyle]. Otherwise, the style will
  /// replace the closest enclosing [DefaultTextStyle].
  final TextStyle? style;

  // The default font size if none is specified.
  static const double _defaultFontSize = 14;

  /// {@macro flutter.painting.textPainter.strutStyle}
  final StrutStyle? strutStyle;

  /// How the text should be aligned horizontally.
  final TextAlign? textAlign;

  /// The directionality of the text.
  ///
  /// This decides how [textAlign] values like [TextAlign.start] and
  /// [TextAlign.end] are interpreted.
  ///
  /// This is also used to disambiguate how to render bidirectional text. For
  /// example, if the [data] is an English phrase followed by a Hebrew phrase,
  /// in a [TextDirection.ltr] context the English phrase will be on the left
  /// and the Hebrew phrase to its right, while in a [TextDirection.rtl]
  /// context, the English phrase will be on the right and the Hebrew phrase on
  /// its left.
  ///
  /// Defaults to the ambient [Directionality], if any.
  final TextDirection? textDirection;

  /// Used to select a font when the same Unicode character can
  /// be rendered differently, depending on the locale.
  ///
  /// It's rarely necessary to set this property. By default its value
  /// is inherited from the enclosing app with `Localizations.localeOf(context)`.
  ///
  /// See [RenderParagraph.locale] for more information.
  final Locale? locale;

  /// Whether the text should break at soft line breaks.
  ///
  /// If false, the glyphs in the text will be positioned as if there was unlimited horizontal space.
  final bool? softWrap;

  /// The number of font pixels for each logical pixel.
  ///
  /// For example, if the text scale factor is 1.5, text will be 50% larger than
  /// the specified font size.
  ///
  /// The value given to the constructor as textScaleFactor. If null, will
  /// use the [MediaQueryData.textScaleFactor] obtained from the ambient
  /// [MediaQuery], or 1.0 if there is no [MediaQuery] in scope.
  final double? textScaleFactor;

  /// {@template flutter.widgets.Text.semanticsLabel}
  /// An alternative semantics label for this text.
  ///
  /// If present, the semantics of this widget will contain this value instead
  /// of the actual text. This will overwrite any of the semantics labels applied
  /// directly to the [TextSpan]s.
  ///
  /// This is useful for replacing abbreviations or shorthands with the full
  /// text value:
  ///
  /// ```dart
  /// Text(r'$$', semanticsLabel: 'Double dollars')
  /// ```
  /// {@endtemplate}
  final String? semanticsLabel;

  /// {@macro flutter.painting.textPainter.textWidthBasis}
  final TextWidthBasis? textWidthBasis;

  /// {@macro dart.ui.textHeightBehavior}
  final TextHeightBehavior? textHeightBehavior;

  /// The color to use when painting the selection.
  final Color? selectionColor;

  /// An optional maximum number of lines for the text to span, wrapping if necessary.
  /// If the text exceeds the given number of lines, it will be truncated using
  /// [TextOverflow.ellipsis].
  ///
  /// If this is 1, text will not wrap. Otherwise, text will be wrapped at the
  /// edge of the box.
  ///
  /// If this is null, a maximum number of lines for the text to span is setted.
  ///
  final int? maxLines;

  int? calculateMaxLines(
      BoxConstraints constraints, TextStyle style, double? textScale) {
    final textPainter = TextPainter(
      text: TextSpan(text: data, style: style),
      textDirection: TextDirection.ltr,
      locale: locale ?? style.locale,
      textScaleFactor: textScale ?? 1,
      textHeightBehavior: textHeightBehavior,
      strutStyle: strutStyle,
    );

    textPainter.layout(maxWidth: constraints.maxWidth);

    final boxes = textPainter.getBoxesForSelection(
        TextSelection(baseOffset: 0, extentOffset: data.length));

    final textHeight = boxes.first.toRect().height;

    if (!constraints.hasBoundedHeight || !constraints.hasBoundedWidth) {
      return null;
    }

    final maxLines = constraints.maxHeight ~/ textHeight;

    if (maxLines < 1) {
      return null;
    }
    return maxLines;
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final defaultTextStyle = DefaultTextStyle.of(context);

        late TextStyle textStyle;
        if (style == null || style!.inherit) {
          textStyle = defaultTextStyle.style.merge(style);
        }
        if (textStyle.fontSize == null) {
          textStyle = textStyle.copyWith(
            fontSize: EllipsisOverflowText._defaultFontSize,
          );
        }

        final textScale =
            textScaleFactor ?? MediaQuery.textScaleFactorOf(context);

        final maxLines = this.maxLines ??
            defaultTextStyle.maxLines ??
            calculateMaxLines(constraints, textStyle, textScaleFactor);
        return Text(
          data,
          key: textKey,
          style: textStyle,
          overflow: TextOverflow.ellipsis,
          textHeightBehavior: textHeightBehavior,
          textAlign: textAlign,
          softWrap: softWrap,
          textDirection: textDirection,
          textWidthBasis: textWidthBasis,
          textScaleFactor: textScale,
          locale: locale,
          selectionColor: selectionColor,
          semanticsLabel: semanticsLabel,
          strutStyle: strutStyle,
          maxLines: maxLines,
        );
      },
    );
  }
}
