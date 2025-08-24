import 'package:e_commerce_app/presentation/widgets/shared/custom_end_drawer.dart';
import 'package:flutter/material.dart';

class MenuView extends StatelessWidget {
  const MenuView({super.key});

  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('Menu'),),
      ),

      endDrawer: CustomEndDrawer(),

      body: SingleChildScrollView(
        child: Column(
          children: [
            Align( 
              alignment: Alignment.centerLeft, 
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text('Recomended', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),),
            )),
        
            SizedBox(
              height: size.height * 0.30,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 5,
                itemBuilder: (context, index) {
                  return _CustomCard();
                },
              ),
            ),
        
            SizedBox( height: 20 ,),
        
            Align( 
              alignment: Alignment.centerLeft, 
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text('Hot', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),),
            )),
        
            SizedBox(
              height: size.height * 0.30,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 5,
                itemBuilder: (context, index) {
                  return _CustomCard();
                },
              ),
            ),
          ],
        ),
      )
    );
  }
}

class _CustomCard extends StatelessWidget {
  const _CustomCard();

  @override
  Widget build(BuildContext context) {
    return Card(
      child: SizedBox(
        width: 400,
        height: 250,
        child: Row(
          children: [
            FadeInImage(
              fit: BoxFit.cover,
              height: 200,
              placeholder: AssetImage('assets/images/no-item.png'), 
              image: AssetImage('assets/images/producto.png')
            ),
            
            Expanded(
              child: Column(
                children: [
                  SizedBox(height: 15,),
                  Text('Title'),

                  Row(
                    children: [
                      Icon(Icons.star),
                      Icon(Icons.star),
                      Icon(Icons.star),
                      Icon(Icons.star),
                      Icon(Icons.star),
                    ],
                  ),

                  Text(
                    'Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum',
                    overflow: TextOverflow.ellipsis,
                    maxLines: 5,
                  )
                ],
              ),
            )

          ],
        ),
      ),
    );
  }
}