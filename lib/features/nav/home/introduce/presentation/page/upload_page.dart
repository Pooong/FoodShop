import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UploadPage extends GetView {
  const UploadPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(' this is upload page'),
      ),
      body: const Center(
        child: Text("hello now"),
      ),
    );
  }
}
