import 'package:find_food/core/ui/widgets/appbar/home_appbar.dart';
import 'package:find_food/core/ui/widgets/card/posts_card.dart';
import 'package:find_food/features/nav/home/home/presentation/controller/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({super.key});
  

  @override
  Widget build(BuildContext context) { 
    return Scaffold(
      appBar: const HomeAppbar(),
      body: CustomScrollView(
        slivers: [
          for(var i=1;i<=10;i++)
            PostsCard()
        ],
      ),
    );
  }
}
