import 'package:find_food/core/ui/widgets/appbar/home_appbar.dart';
import 'package:find_food/core/ui/widgets/card/build_sliver_to_box_adapter.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends GetView {
  const HomePage({super.key});
  

  @override
  Widget build(BuildContext context) { 
  

    return Scaffold(
      appBar: const HomeAppbar(),
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
