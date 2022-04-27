import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SearchPage extends GetView {
  const SearchPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text("Buscar"),
      ),
    );
  }
}
