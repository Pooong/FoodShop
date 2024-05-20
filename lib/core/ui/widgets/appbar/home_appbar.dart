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
                  width: 120,
                ),
                actions: [
                  IconButton(
                    icon: const Icon(Icons.filter_list),
                    onPressed: () {
                      final RenderBox overlay = Overlay.of(context).context.findRenderObject() as RenderBox;
                      final Size overlaySize = overlay.size;
                      final RelativeRect position = RelativeRect.fromLTRB(
                        overlaySize.width - 10, // Right padding
                        85, // Top padding
                        10, // Left padding (from right edge)
                        overlaySize.height - kToolbarHeight - 10, // Bottom padding
                      );

                      showMenu<String>(
                        context: context,
                        position: position,
                        items: [
                          const PopupMenuItem<String>(
                            value: 'Lựa chọn 1',
                            child: Text('Lựa chọn 1'),
                          ),
                          const PopupMenuItem<String>(
                            value: 'Lựa chọn 2',
                            child: Text('Lựa chọn 2'),
                          ),
                          const PopupMenuItem<String>(
                            value: 'Lựa chọn 3',
                            child: Text('Lựa chọn 3'),
                          ),
                        ],color: Colors.white.withOpacity(0.8),
                      ).then((value) {
                        if (value != null) {
                          // Handle the selected value
                          print('Selected: $value');
                        }
                      });
                    },
                  ),
                  const Padding(
                    padding: EdgeInsets.only(right: 10),
                    child: Center(
                      child: Text(
                        "Filter",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 22,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: 1, // Height of the red line
              color: const Color.fromARGB(113, 232, 38, 38), // Set the color of the line
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

