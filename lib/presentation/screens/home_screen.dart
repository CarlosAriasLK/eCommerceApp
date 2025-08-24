import 'package:e_commerce_app/presentation/views/category_view.dart';
import 'package:e_commerce_app/presentation/views/menu_view.dart';
import 'package:e_commerce_app/presentation/widgets/shared/custom_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class HomeScreen extends StatefulWidget {
  final int index;
  const HomeScreen({super.key, required this.index});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  late PageController pageController;

  @override
  void initState() {
    super.initState();
    pageController = PageController(
      keepPage: true
    );
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }


  final views = [
    MenuView(),
    CategoryView(),
  ];


  @override
  Widget build(BuildContext context) {


    if( pageController.hasClients ) {
      pageController.animateToPage(
        widget.index, 
        duration: Duration( milliseconds: 250 ), 
        curve: Curves.easeInOut
      );
    }

    return Scaffold(

      body: PageView(
        controller: pageController,
        physics: NeverScrollableScrollPhysics(),
        children: views,
      ),

      bottomNavigationBar: CustomBottomNavigationBar( index: widget.index ),
    );
  }
}