import 'package:flutter/material.dart';

class FoodCard extends StatelessWidget {
  final String imageUrl;
  final double rating;
  final int reviews;
  final double distance;
  final String title;

  const FoodCard({
    super.key,
    required this.imageUrl,
    required this.rating,
    required this.reviews,
    required this.distance,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      elevation: 4.0,
      margin: const EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(15.0),
                topRight: Radius.circular(15.0),
              ),
              child: Image.asset(
                imageUrl,
                height: 200.0,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Expanded(
              child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: [
                Row(
                  children: [
                    Text(
                      '$rating ',
                      style: const TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Icon(
                      Icons.star,
                      color: Colors.yellow[700],
                      size: 16.0,
                    ),
                    SizedBox(width: 4.0),
                    Text(
                      '($reviews)',
                      style: const TextStyle(
                        fontSize: 16.0,
                        color: Colors.grey,
                      ),
                    ),
                    SizedBox(width: 4.0),
                    Expanded(
                      child: Text(
                        '$distance km',
                        style: const TextStyle(
                          fontSize: 16.0,
                          color: Colors.grey,
                          overflow: TextOverflow.ellipsis,
                        ),
                        maxLines: 1,
                      ),
                    ),
                  ],
                ),
                Text(
                                  title,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: const TextStyle(
                fontSize: 14.0,
                fontWeight: FontWeight.bold,
                                  ),
                                )
              ],
            ),
          ))
        ],
      ),
    );
  }
}

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Food Card Example',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Food Card Example'),
        ),
        body: ListView(
          children: [
            FoodCard(
              imageUrl: 'https://via.placeholder.com/400x300',
              rating: 3.5,
              reviews: 100,
              distance: 2.5,
              title: 'Write title this here ....',
            ),
            // Add more FoodCard widgets here
          ],
        ),
      ),
    );
  }
}
