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
          ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(15.0),
              topRight: Radius.circular(15.0),
            ),
            child: Image.asset(
              imageUrl,
              height: 100.0,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              children: [
                Text(
                  '$rating ',
                  style: TextStyle(
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
                  style: TextStyle(
                    fontSize: 16.0,
                    color: Colors.grey,
                  ),
                ),
                Spacer(),
                Text(
                  '$distance km',
                  style: TextStyle(
                    fontSize: 16.0,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 10.0, right: 10.0, bottom: 10.0),
            child: Text(
              title,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
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
