import 'package:flutter/material.dart';

class ReloadButton extends StatelessWidget {
  final VoidCallback onPressed;
  const ReloadButton({
    this.onPressed,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 32,
          vertical: 12,
        ),
        child: Text(
          'Reload',
          style: Theme.of(context).textTheme.headline5,
        ),
      ),
      color: Theme.of(context).accentColor,
      onPressed: onPressed,
    );
  }
}
