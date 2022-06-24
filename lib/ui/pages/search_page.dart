import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:symphony/ui/widgets/header_widget.dart';

class SearchPage extends GetView {
  const SearchPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HeaderWidget(
        title: "Buscar",
      ),
      body: const Center(
        child: Text("Buscar"),
      ),
    );
  }
}
