import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:symphony/ui/widgets/appbar_widget.dart';

class SearchPage extends GetView {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(
        title: "Buscar",
      ),
      body: const Center(
        child: Text("Buscar"),
      ),
    );
  }
}
