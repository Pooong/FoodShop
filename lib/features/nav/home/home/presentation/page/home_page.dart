import 'package:find_food/features/nav/home/home/presentation/widgets/build_sliver_to_box_adapter.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends GetView {
  const HomePage({super.key});
  

  @override
  Widget build(BuildContext context) { 
  

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          buildSliverToBoxAdapter(),
          buildSliverToBoxAdapter(),
          buildSliverToBoxAdapter(),
          buildSliverToBoxAdapter(),
          buildSliverToBoxAdapter(),
        ],
      ),
    );
  }
}
