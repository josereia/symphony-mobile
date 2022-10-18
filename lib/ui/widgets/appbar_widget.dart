import 'package:flutter/material.dart';

class AppBarWidget extends StatelessWidget with PreferredSizeWidget {
  @override
  Size get preferredSize => const Size.fromHeight(100);

  final String title;
  final String? subtitle;
  final List<Widget>? actions;

  AppBarWidget({
    super.key,
    required this.title,
    this.actions,
    this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      alignment: Alignment.bottomCenter,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          subtitle != null
              ? Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      title,
                      style: Theme.of(context).textTheme.titleSmall,
                    ),
                    Text(
                      subtitle ?? "vdffvfvd",
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                  ],
                )
              : Text(
                  title,
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
          Row(
            children: actions ?? [],
          ),
        ],
      ),
    );
  }
}
