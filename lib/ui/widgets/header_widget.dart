import 'package:flutter/material.dart';

class HeaderWidget extends StatelessWidget with PreferredSizeWidget {
  @override
  final Size preferredSize;

  final String title;
  final List<Widget>? actions;

  HeaderWidget({
    Key? key,
    required this.title,
    this.actions,
  })  : preferredSize = const Size.fromHeight(100),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        title,
        style: Theme.of(context).appBarTheme.toolbarTextStyle,
      ),
      actions: [
        Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              children: actions ?? [],
            ))
      ],
    );
  }
}
