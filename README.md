# ellipsis_overflow_text

Flutter widget that automatically sets the number of lines to be shown on a text with the ellipsis overflow type.

**Show some ❤️ and star the repo to support the project**

### Resources:
- [Documentation](https://pub.dev/documentation/ellipsis_overflow_text/latest/ellipsis_overflow_text/EllipsisOverflowText-class.html)
- [Pub Package](https://pub.dev/packages/ellipsis_overflow_text)
- [GitHub Repository](https://github.com/reiko-dev/ellipsis_overflow_text)
- [Online Demo](https://appetize.io/)

## Contents

- [Usage](#usage)
- [Parameters](#parameters)
- [Performance](#performance)

## Usage

`EllipsisOverflowText` behaves exactly like a `Text`. The only difference is that it automatically sets the number of lines to be shown on a text with the ellipsis overflow type.

```dart
EllipsisOverflowText(
  'The text to display',
  style: TextStyle(fontSize: 20),
)
```

## Parameters

| Parameter | Description |
|---|---|
| `key`* | Controls how one widget replaces another widget in the tree. |
| `style`* | If non-null, the style to use for this text |
| `textAlign`* | How the text should be aligned horizontally. |
| `textDirection`* | The directionality of the text. This decides how `textAlign` values like `TextAlign.start` and `TextAlign.end` are interpreted. |
| `locale`* |  Used to select a font when the same Unicode character can be rendered differently, depending on the locale. |
| `softWrap`* | Whether the text should break at soft line breaks. |
| `wrapWords` | Whether words which don't fit in one line should be wrapped. *Defaults to `true` to behave like `Text`.* |
| `overflow`* | How visual overflow should be handled. |
| `overflowReplacement` | If the text is overflowing and does not fit its bounds, this widget is displayed instead. |
| `textScaleFactor`* | The number of font pixels for each logical pixel. |
| `semanticsLabel`* | An alternative semantics label for this text. |

Parameters marked with \* behave exactly the same as in `Text`


## Performance

`EllipsisOverflowText` is really fast. In fact, you can replace all your `Text` widgets with `EllipsisOverflowText`.<br>


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
