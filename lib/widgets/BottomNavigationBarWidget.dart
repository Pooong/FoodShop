// ignore: file_names
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';

class BottomNavigationBarWidget extends StatelessWidget {
  final int currentIndex;
  final Function(int) onPageChanged;

  const BottomNavigationBarWidget(
    {
      super.key, 
      required this.currentIndex,
      required this.onPageChanged
    });

  @override
  Widget build(BuildContext context) {
    return CurvedNavigationBar(
      color: Colors.blue,
      height: 70,
      backgroundColor: Colors.transparent, // Sử dụng màu trong suốt
      index: currentIndex,
      onTap: (index) {
        onPageChanged(index);
      },
      items: const [
        Icon(
          Icons.home,
          size: 30,
          color: Colors.white,
        ),
        Icon(
          Icons.map,
          size: 30,
          color: Colors.white,
        ),
        Icon(
          Icons.add_box,
          size: 30,
          color: Colors.white,
        ),
        Icon(
          Icons.notifications,
          size: 30,
          color: Colors.white,
        ),
        Icon(
          Icons.person,
          size: 30,
          color: Colors.white,
        ),
      ],
    );
  }
}
