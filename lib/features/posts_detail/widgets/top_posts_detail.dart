<<<<<<< HEAD
import 'dart:ffi';

import 'package:find_food/core/configs/app_colors.dart';
=======
>>>>>>> origin
import 'package:find_food/core/configs/app_dimens.dart';
import 'package:find_food/core/ui/widgets/text/text_widget.dart';
import 'package:flutter/material.dart';

class TopPostsDetail extends StatefulWidget {
  const TopPostsDetail({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _TopPostsDetailState createState() => _TopPostsDetailState();
}

class _TopPostsDetailState extends State<TopPostsDetail> {
  late PageController _mainPageController;
  late List<String> mainImages;
  late List<String> smallImages;
  bool isFavorite = false;
  bool isBookmark = false;

  get actions => null;

  @override
  void initState() {
    super.initState();
    _mainPageController = PageController();
    mainImages = [
      'assets/images/food1.png',
      'assets/images/food2.png',
      'assets/images/food3.png',
      'assets/images/food4.png',
      'assets/images/food5.png',
      'assets/images/food6.png',
    ];

    smallImages = [
      'assets/images/food1.png',
      'assets/images/food2.png',
      'assets/images/food3.png',
      'assets/images/food4.png',
      'assets/images/food5.png',
      'assets/images/food6.png',
    ];
  }

  @override
  void dispose() {
    _mainPageController.dispose();
    super.dispose();
  }

  // Hàm để chuyển về ảnh trước
  void _previousImage() {
    if (_mainPageController.page!.toInt() > 0) {
      _mainPageController.previousPage(
        duration: const Duration(milliseconds: 500),
        curve: Curves.ease,
      );
    }
  }


  // Hàm để chuyển sang ảnh tiếp theo
  void _nextImage() {
    if (_mainPageController.page!.toInt() < mainImages.length - 1) {
      _mainPageController.nextPage(
        duration: const Duration(milliseconds: 500),
        curve: Curves.ease,
      );
    }
  }

  void _showMoreImages() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Tất cả ảnh'),
          content: SizedBox(
            width: double.maxFinite,
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 10.0,
                mainAxisSpacing: 10.0,
              ),
              itemCount: smallImages.length,
              itemBuilder: (context, index) {
                return Image.asset(
                  smallImages[index],
                  fit: BoxFit.cover,
                );
              },
            ),
          ),
          
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Đóng'),
            ),
          ],
        );
      },
    );
  }

  void toggleFavoriteStatus() {
    setState(() {
      isFavorite = !isFavorite;
    });
  }

  void _toggleFavorite() {
    setState(() {
      isBookmark = !isBookmark;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 80,
        leading: const Padding(
          padding: EdgeInsets.all(3.0),
          child: CircleAvatar(
            backgroundImage: AssetImage('assets/images/author.jpg'),
          ),
        ),
        title: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Write title posts this here'),
            Text(
              '2 hours ago - Author posts',
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w400,
                color: Colors.red,
              ),
            ),
          ],
        ),

        actions: [
          IconButton(
            onPressed: _toggleFavorite,
            icon: Icon(
              isBookmark ? Icons.bookmark : Icons.bookmark_border,
              color: isBookmark ? Colors.yellow : null,
            ),
          ),
        ],
      ),

      body: SingleChildScrollView(
        child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
              padding: EdgeInsets.all(10.0),
              child: Text("Writing this post's descrition this here ...."),
            ),

          const SizedBox(height: 10),
          SizedBox(
            height: 300,
            child: Stack(
              children: [
                Positioned.fill(
                  child: Column(
                    children: [
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10.0),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.1),
                                spreadRadius: 2.0,
                                blurRadius: 2.0,
                                offset: const Offset(0, 1),
                              ),
                            ],
                          ),
          
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10.0),
                            child: Column(
                              children: [
                                Expanded(
                                  flex: 2,
                                  child: PageView.builder(
                                    controller: _mainPageController,
                                    itemCount: mainImages.length,
                                    itemBuilder: (context, index) {
                                      return Image.asset(
                                        mainImages[index],
                                        fit: BoxFit.cover,
                                      );
                                    },
                                  ),
                                ),
                                const SizedBox(height: 10),
                                Expanded(
                                  flex: 1,
                                  child: smallImages.isNotEmpty
                                      ? GridView.builder(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 16.0),
                                          gridDelegate:
                                              const SliverGridDelegateWithFixedCrossAxisCount(
                                            crossAxisCount: 4,
                                            crossAxisSpacing: 10.0,
                                            mainAxisSpacing: 10.0,
                                          ),
                                          itemCount: smallImages.length > 4
                                              ? 4
                                              : smallImages.length,
                                          itemBuilder: (context, index) {
                                            if (index == 3 &&
                                                smallImages.length > 4) {
                                              return GestureDetector(
                                                onTap: _showMoreImages,
                                                child: Stack(
                                                  fit: StackFit.expand,
                                                  children: [
                                                    ClipRRect(
                                                      borderRadius:
                                                          BorderRadius
                                                              .circular(10.0),
                                                      child: Image.asset(
                                                        smallImages[index],
                                                        fit: BoxFit.cover,
                                                        color: Colors.grey
                                                            .withOpacity(0.6),
                                                        colorBlendMode:
                                                            BlendMode.darken,
                                                      ),
                                                    ),
                                                    const Center(
                                                      child: Text(
                                                        '+2',
                                                        style: TextStyle(
                                                          color: Colors.white,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontSize: 16,
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              );
                                            } else {
                                              return GestureDetector(
                                                onTap: () {
                                                  _mainPageController
                                                      .animateToPage(
                                                    index,
                                                    duration: const Duration(
                                                        milliseconds: 500),
                                                    curve: Curves.ease,
                                                  );
                                                },
                                                child: ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10.0),
                                                  child: Image.asset(
                                                    smallImages[index],
                                                    fit: BoxFit.cover,
                                                  ),
                                                ),
                                              );
                                            }
                                          },
                                        )
                                      : Container(),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Positioned(
                  left: 10,
                  top: 80,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.5),
                      shape: BoxShape.circle,
                    ),
                    child: IconButton(
                      onPressed: _previousImage,
                      icon: const Icon(Icons.chevron_left,
                          size: 30, color: Colors.grey),
                    ),
                  ),
                ),
                Positioned(
                  right: 10,
                  top: 80,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.5),
                      shape: BoxShape.circle,
                    ),
                    child: IconButton(
                      onPressed: _nextImage,
                      icon: const Icon(Icons.chevron_right,
                          size: 30, color: Colors.grey),
                    ),
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 15),

          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10.0),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  spreadRadius: 1,
                  blurRadius: 2,
                  offset: const Offset(0, 2),
                ),
              ],
            ),


            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "4.5",
                          style: TextStyle(
                            fontSize: 16.0,
                          ),
                        ),
                        const SizedBox(width: 5),
                        const Icon(Icons.star,
                            color: Colors.amber, size: 20.0),
                        const Icon(Icons.star,
                            color: Colors.amber, size: 20.0),
                        const Icon(Icons.star,
                            color: Colors.amber, size: 20.0),
                        const Icon(Icons.star,
                            color: Colors.amber, size: 20.0),
                        const Icon(Icons.star_border,
                            color: Colors.amber, size: 20.0),
                        const Text(
                          "(100)",
                          style: TextStyle(
                            fontSize: 16.0,
                            color: Colors.black,
                          ),
                        ),
                        const SizedBox(width: 10),

                        Expanded(
                          child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              const Column(
                                children: [
                                  Icon(Icons.comment,
                                      color: Color.fromRGBO(0, 0, 0, 1), size: 20.0),
                                  TextWidget(text: "100",size: AppDimens.textSize15),
                                ],
                              ),
                              const SizedBox(width: 20.0,),
                              Column(
                                children: [
                                  InkWell(
                                    child: Icon(
                                      isFavorite
                                          ? Icons.favorite
                                          : Icons.favorite_border,
                                      color: isFavorite ? Colors.red : null,
                                      size: 20.0,
                                    ),
                                    onTap: () {
                                      toggleFavoriteStatus();
                                    },

                                  ),
                                  const TextWidget(text: "100",size:AppDimens.textSize15),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const Row(
                      children: [
                        Icon(Icons.location_on,
                            color: Colors.black, size: 20.0),
                        SizedBox(width: 5),
                        Text(
                          "2.7km",
                          style: TextStyle(
                            fontSize: 15.0,
                          ),
                        ),
                        SizedBox(width: 5),
                        Text(
                          " Đang hoạt động ",
                          style: TextStyle(
                            fontSize: 15.0,
                            color: Colors.green,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),

          

        ],
      ),
      )
    );
  }
}
