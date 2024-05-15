// ignore: file_names
import 'package:find_food/views/pages/HomePage.dart';
import 'package:find_food/views/pages/Notify.dart';
import 'package:find_food/views/pages/Post.dart';
import 'package:find_food/views/pages/Profile.dart';
import 'package:find_food/core/ui/widgets/nav/BottomNavigationBarWidget.dart';
import 'package:find_food/views/pages/Maps.dart';
import 'package:flutter/material.dart';

class DisplayPages extends StatefulWidget {
  final int pageIndex;
  const DisplayPages({super.key,required this.pageIndex});
  @override
  State<DisplayPages> createState() => DisplayPagesState();
}

class DisplayPagesState extends State<DisplayPages> {
  late int _pageIndex;

  @override
  void initState() {
    super.initState();
    _pageIndex=widget.pageIndex;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _getPage(_pageIndex),
      bottomNavigationBar: BottomNavigationBarWidget(
            currentIndex: _pageIndex, 
            onPageChanged: (index){
              setState(() {
                _pageIndex=index;
              });
            }),
    );
  }
  
  Widget _getPage(int index){
    switch(index){
      case 0:
        return const HomePage();
      case 1:
        return const Maps();
      case 2:
        return const Post();
      case 3:
        return const Notify();
      case 4:
        return  const Profile();
      default:
        return Container();
    }
  }
}
