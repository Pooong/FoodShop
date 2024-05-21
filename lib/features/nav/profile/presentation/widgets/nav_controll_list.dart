import 'package:find_food/core/configs/app_colors.dart';
import 'package:flutter/material.dart';

class NavControllList extends StatefulWidget {
  final int currentIndex;
  final Function(int) onPageChanged;

  const NavControllList({
    super.key,
    required this.currentIndex,
    required this.onPageChanged,
  });
   
  @override
  // ignore: library_private_types_in_public_api
  _NavControllListState createState() => _NavControllListState();
}

class _NavControllListState extends State<NavControllList> {
  late int _selectedIndex;

  @override
  void initState() {
    super.initState();
    _selectedIndex = widget.currentIndex;
  }

  @override
  void didUpdateWidget(NavControllList oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.currentIndex != widget.currentIndex) {
      setState(() {
        _selectedIndex = widget.currentIndex;
      });
    }
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    widget.onPageChanged(index);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 40),
          decoration: const BoxDecoration(
            border: Border(
              bottom: BorderSide(
                width: 1,
                color: AppColors.gray,
              ),
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Flexible(child: itemNav(icon: Icons.list, index: 0)),
              Flexible(child: itemNav(icon: Icons.favorite_border, index: 1)),
              Flexible(child: itemNav(icon: Icons.bookmark_outline, index: 2)),
              Flexible(child: itemNav(icon: Icons.lock_outline, index: 3)),
            ],
          ),
        ),
        const SizedBox(height: 20.0),
      ],
    );
  }

  Widget itemNav({required IconData icon, required int index}) {
    bool isActive = _selectedIndex == index;

    return GestureDetector(
      onTap: () => _onItemTapped(index),
      child: Container(
        decoration: BoxDecoration(
          border: isActive
              ? const Border(
                  bottom: BorderSide(width: 2, color: AppColors.black))
              : null,
        ),
        padding: const EdgeInsets.only(left: 20, right: 20, bottom: 5),
        margin: const EdgeInsets.symmetric(horizontal: 5),
        child: Icon(
          icon,
          size: 40,
          color: isActive ? AppColors.black : AppColors.gray,
        ),
      ),
    );
  }
}
