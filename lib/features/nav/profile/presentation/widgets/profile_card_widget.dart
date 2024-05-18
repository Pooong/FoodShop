import 'package:flutter/material.dart';

class GridCard extends StatelessWidget {
  final String imageUrl;
  final double rating;

  GridCard({required this.imageUrl, required this.rating});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          Image.network(imageUrl, fit: BoxFit.cover, height: 120, width: double.infinity),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(5, (index) {
                return Icon(
                  index < rating ? Icons.star : Icons.star_border,
                );
              }),
            ),
          ),
        ],
      ),
    );
  }
}
