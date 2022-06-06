# ellipsis_overflow_text

[![Version](https://img.shields.io/badge/pub-v1.0.0-blue.svg)](https://pub.dev/packages/auto_size_text) ![GitHub license](https://img.shields.io/badge/license-MIT-blue.svg?style=flat)

Flutter widget that automatically sets the number of lines to be shown on a text with the ellipsis overflow type.

**Show some 💙 and star the repo to support the project**

_Inspired and based on the [AutoSizeText](https://pub.dev/packages/auto_size_text) package._

### Resources:
- [Documentation](https://pub.dev/documentation/ellipsis_overflow_text/latest/ellipsis_overflow_text/EllipsisOverflowText-class.html)
- [Pub Package](https://pub.dev/packages/ellipsis_overflow_text)
- [GitHub Repository](https://github.com/reiko-dev/ellipsis_overflow_text)

## Contents

- [Usage](#usage)
- [Parameters](#parameters)
- [Performance](#performance)
- [Troubleshooting](#troubleshooting)
- [License](#mit-license)

## Usage

`EllipsisOverflowText` behaves exactly like a `Text`. The only difference is that it automatically sets the number of lines to be shown on a text with the ellipsis overflow type.

```dart
EllipsisOverflowText(
  'Some text here',
  style: TextStyle(fontSize: 16),
)
```

## Parameters

| Parameter | Description |
|---|---|
| `data`* | The String text to be shown. |
| `key`* | Controls how one widget replaces another widget in the tree. |
| `textKey` | The inner Text Widget key. |
| `locale`* |  Used to select a font when the same Unicode character can be rendered differently, depending on the locale. |
| `maxLines` |  An optional maximum number of lines for the text to span. |
| `semanticsLabel`* | An alternative semantics label for this text. |
| `selectionColor`* | The color to use when painting the selection. |
| `softWrap`* | Whether the text should break at soft line breaks. |
| `strutStyle`* | Defines the strut, which sets the minimum height a line can be relative to the baseline. |
| `style`* | If non-null, the style to use for this text |
| `textAlign`* | How the text should be aligned horizontally. |
| `textDirection`* | The directionality of the text. This decides how `textAlign` values like `TextAlign.start` and `TextAlign.end` are interpreted. |
| `textHeightBehavior`* | Defines how to apply [TextStyle.height] over and under text. |
| `textScaleFactor`* | The number of font pixels for each logical pixel. |
| `textWidthBasis`* | The different ways of measuring the width of one or more lines of text. |

Parameters marked with \* behave exactly the same as in `Text`


## Performance

`EllipsisOverflowText` is really fast. In fact, you can replace all your `Text` widgets with `EllipsisOverflowText`.<br>

## Troubleshooting

### Missing bounds

If `EllipsisOverflowText` overflows or does not replace the text with ellipsis characters, you should check if it has constrained width and height.

**Wrong** code:
```dart
Row(
  children: <Widget>[
    EllipsisOverflowText(
      'Here is a very long text, which will use ellipsis in case the text overflows',
    ),
  ],
)
```
Because `Row` and other widgets like `Container`, `Column` or `ListView` do not constrain their children, the text will overflow.  
You can fix this by constraining the `EllipsisOverflowText`. Wrap it with `Expanded` in case of `Row` and `Column` or use a `SizedBox` or another widget with fixed width (and height).

**Correct** code:
```dart
Row(
  children: <Widget>[
    Expanded( // Constrains EllipsisOverflowText to the width of the Row (You could use Flexible instead).
      child: EllipsisOverflowText(
        'Here is a very long text, which will use ellipsis in case the text overflows',
      )
    ),
  ],
)
}
```

Further explanation can be found [here](https://stackoverflow.com/a/53908204), the question is about the AutoSizeText package, but the answer is the same for this package.</b>
If you still have problems, please [open an issue](https://github.com/reiko-dev/ellipsis_overflow_text/issues/new).

## MIT License
```
Copyright (c) 2022 Vitor Lucas (Reiko-Dev)

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the 'Software'), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED 'AS IS', WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
```
