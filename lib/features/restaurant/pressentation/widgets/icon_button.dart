import 'package:flutter/material.dart';

// ignore: Custom IconButton
class iconButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onPressed;
  const iconButton({
    super.key,
    required this.icon,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        color: Color.fromARGB(157, 255, 255, 255),
      ),
      child: IconButton(
        iconSize: 30,
        icon: Icon(icon),
        onPressed: () => onPressed(),
      ),
    );
  }
}
