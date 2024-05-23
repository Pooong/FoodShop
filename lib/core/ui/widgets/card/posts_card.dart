import 'package:find_food/core/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PostsCard extends StatelessWidget {


  const PostsCard({super.key});

  @override
  Widget build(BuildContext context) {
    const EdgeInsets padding = EdgeInsets.all(10);
    const double starIconSize = 16;

    return SliverPadding(
      padding: padding,
      sliver: SliverToBoxAdapter(
        child: Material(
          borderRadius: BorderRadius.circular(10),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 5,
                  blurRadius: 5,
                  offset: Offset(3, 3),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.vertical(top: Radius.circular(10)),
                  child: InkWell(
                    onTap: () => Get.toNamed(Routes.bottomPostsDetail),
                    child: Image.asset(
                      'assets/images/home.png',
                      height: 200,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.0),
                  child: Text(
                    'Write post title this here...',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.0),
                  child: Text(
                    'Write something descriptive for your post here',
                    style: TextStyle(color: Colors.black),
                    textAlign: TextAlign.center,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Text(
                            '4',
                            style: TextStyle(
                                fontSize: starIconSize, color: Colors.black),
                          ),
                          const SizedBox(width: 5),
                          Row(
                            children: List.generate(5, (index) {
                              if (index < 4) {
                                return const Icon(Icons.star,
                                    color: Colors.yellow, size: starIconSize);
                              } else {
                                return const Icon(Icons.star_border,
                                    color: Colors.yellow, size: starIconSize);
                              }
                            }),
                          ),
                          const SizedBox(width: 5),
                          const Text(
                            '(100)',
                            style: TextStyle(
                                fontSize: starIconSize, color: Colors.black),
                          ),
                          const SizedBox(width: 5),
                          const Text(
                            '2.7km',
                            style: TextStyle(color: Colors.black),
                          ),
                        ],
                      ),
                      const Text(
                        "Đang hoạt động",
                        style: TextStyle(color: Colors.green),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
