import 'package:flutter/material.dart';

class CardItem extends StatelessWidget {
  const CardItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: Text('Category'),
      ),

      endDrawer: Drawer(
        child: Column(
          children: [
            ListTile(
              title: Text('Carrito'),
            )
          ],
        ),
      ),

    );
  }
}