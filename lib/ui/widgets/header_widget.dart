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
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      alignment: Alignment.bottomCenter,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: Theme.of(context).appBarTheme.toolbarTextStyle,
          ),
          Row(
            children: actions ?? [],
          ),
        ],
      ),
    );
  }
}
