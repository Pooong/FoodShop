import 'package:find_food/core/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


const EdgeInsets _padding = EdgeInsets.all(10);
const double _imageHeight = 200;
const double _starIconSize = 16;


Widget buildSliverToBoxAdapter() {

  return SliverPadding(
    padding: _padding,
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
                  borderRadius: BorderRadius.vertical(top: Radius.circular(10)),  

                  child:
                  
                   InkWell(
                    
                    onTap: ()=>Get.toNamed(Routes.postsDetail),

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
                          style: TextStyle(fontSize: _starIconSize, color: Colors.black),
                        ),
                        const SizedBox(width: 5),
                        Row(
                          children: List.generate(5, (index) {
                            if (index < 4) {
                              return const Icon(Icons.star, color: Colors.yellow, size: _starIconSize);
                            } else {
                              return const Icon(Icons.star_border, color: Colors.yellow, size: _starIconSize);
                            }
                          }),
                        ),
                        const SizedBox(width: 5),
                        const Text(
                          '(100)',  
<<<<<<< HEAD
                          style: TextStyle(fontSize: _starIconSize, color: Colors.black),
=======
                          style: TextStyle(fontSize: _starIconSize, color:    Colors.black),
>>>>>>> main
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
