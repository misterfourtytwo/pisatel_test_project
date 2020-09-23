import 'package:flutter/material.dart';

class ErrorView extends StatelessWidget {
  final String message;
  final Widget reloadButton;
  const ErrorView({
    this.message,
    this.reloadButton,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Flexible(
            child: FittedBox(
              child: Icon(Icons.explicit,
                  size: MediaQuery.of(context).size.width / 3),
            ),
          ),
          Text(
            message,
            // style: Theme.of(context).primaryTextTheme.headline4,
          ),
          if (reloadButton != null) ...[
            SizedBox(height: 16),
            reloadButton,
            SizedBox(height: 24),
          ],
        ],
      ),
    );
  }
}
