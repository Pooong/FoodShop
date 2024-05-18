import 'package:flutter/material.dart';

class HomeAppbar extends StatelessWidget implements PreferredSizeWidget {
  const HomeAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(
            kToolbarHeight + 2), // Increase height for the red line
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: AppBar(
                title: Image.asset(
                  'assets/images/logo-1.png',
                  width: 100,
                ),
                actions: [
                  IconButton(
                    icon: const Icon(Icons.filter_list),
                    onPressed: () {
                      // Define the action for the filter button here
                      // For example, navigate to a filter page or open a filter dialog
                    },
                  ),
                  const Padding(
                    padding: EdgeInsets.only(right: 10),
                    child: Center(
                      child: Text(
                        "Filter",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 24,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: 1, // Height of the red line
              color: Color.fromARGB(113, 232, 38, 38), // Set the color of the line
            ),
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize =>
      const Size.fromHeight(kToolbarHeight + 2); // Adjust height for the line
}
