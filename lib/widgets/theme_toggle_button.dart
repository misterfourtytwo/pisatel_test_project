import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class ThemeToggleButton extends StatelessWidget {
  const ThemeToggleButton({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.invert_colors),
      onPressed: () => Hive.box('data_repository').put(
        'theme',
        Brightness.dark == Theme.of(context).brightness
            ? ThemeMode.light.index
            : ThemeMode.dark.index,
      ),
    );
  }
}
