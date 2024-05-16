import 'package:find_food/features/nav/home/introduce/presentation/controller/introduce_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class IntroducePage extends GetView<IntroduceController> {
  const IntroducePage({super.key});

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
