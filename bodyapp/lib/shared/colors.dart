import 'package:flutter/material.dart';

class AppColors {
  /// The teal primary color and swatch.
  ///
  /// ![](https://flutter.github.io/assets-for-api-docs/assets/material/Colors.teal.png)
  /// ![](https://flutter.github.io/assets-for-api-docs/assets/material/Colors.tealAccent.png)
  ///
  /// ![](https://flutter.github.io/assets-for-api-docs/assets/material/Colors.deepOrange.png)
  /// ![](https://flutter.github.io/assets-for-api-docs/assets/material/Colors.deepOrangeAccent.png)
  ///
  /// ![](https://flutter.github.io/assets-for-api-docs/assets/material/Colors.pink.png)
  /// ![](https://flutter.github.io/assets-for-api-docs/assets/material/Colors.pinkAccent.png)
  ///
  /// {@tool snippet}
  ///
  /// ```dart
  /// Icon(
  ///   Icons.widgets,
  ///   color: Colors.teal[400],
  /// )
  /// ```
  /// {@end-tool}
  ///
  /// See also:
  ///
  ///  * [tealAccent], the corresponding accent colors.
  ///  * [deepOrange] and [pink], similar colors.
  ///  * [Theme.of], which allows you to select colors from the current theme
  ///    rather than hard-coding colors in your build methods.
  static const MaterialColor teal = MaterialColor(
    _tealPrimaryValue,
    <int, Color>{
      50: Color(0xFFE1F0F0),
      100: Color(0xFFB5D9D9),
      200: Color(0xFF83C0C0),
      300: Color(0xFF51A6A6),
      400: Color(0xFF2C9393),
      500: Color(_tealPrimaryValue),
      600: Color(0xFF067878),
      700: Color(0xFF056D6D),
      800: Color(0xFF046363),
      900: Color(0xFF025050),
    },
  );
  static const int _tealPrimaryValue = 0xFF078080;
}
