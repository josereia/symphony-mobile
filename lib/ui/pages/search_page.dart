import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SearchPage extends GetView {
  const SearchPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Buscar",
          style: Theme.of(context).appBarTheme.toolbarTextStyle,
        ),
      ),
      body: const Center(
        child: Text("Buscar"),
      ),
    );
  }
}
