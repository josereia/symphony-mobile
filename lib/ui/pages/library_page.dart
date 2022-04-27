import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LibraryPage extends GetView {
  const LibraryPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text("Biblioteca"),
      ),
    );
  }
}
