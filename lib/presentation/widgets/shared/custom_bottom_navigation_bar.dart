

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  final int index;
  const CustomBottomNavigationBar({super.key, required this.index});


  void onTapped( BuildContext context, int index ) {
    switch (index) {
      case 0:
        return context.go('/home/0');
      case 1:
        return context.go('/home/1');
    }
  }



  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: index,
      elevation: 1,
      onTap: (value) => onTapped( context, value ),
      items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.menu_book_rounded),
          label: 'Menu'
        ),

        BottomNavigationBarItem(
          icon: Icon(Icons.category_sharp),
          label: 'Category'
        ),
      ]
    );
  }
}