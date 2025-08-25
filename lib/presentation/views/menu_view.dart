import 'package:e_commerce_app/presentation/providers/products_provider.dart';
import 'package:e_commerce_app/presentation/widgets/shared/custom_end_drawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MenuView extends ConsumerWidget {
  const MenuView({super.key});

  @override
  Widget build(BuildContext context, ref) {

    final productsRecomendeded = ref.watch( getProductsRecomendedProvider );
    final productsHot = ref.watch( getHotProductsProvider );
    
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('Menu'),),
      ),

      endDrawer: CustomEndDrawer(),

      body: Column(
        children: [

          Expanded(
            child: productsRecomendeded.when(
              data: (products) {
                return ListView.builder(
                  scrollDirection: Axis.horizontal,
                    itemCount: products.length,
                    itemBuilder: (context, index) {
                      final product = products[index];
                      return Column(
                        children: [
                          SizedBox(
                            height: 450,
                            child: _CustomCard( product.image, product.title, product.description ),
                          )
                        ],
                      );
                    },
                );
              },
              error: (error, __) => Text("$error") ,
              loading: () => Center(child: CircularProgressIndicator(),),
            ),
          ),

          Expanded(
            child: productsHot.when(
              data: (data) => ListView.builder(
                itemBuilder: (context, index) {
                  final product = data[index];
                  return ListTile(
                    title: Text(product.title),
                  );
                },
              ),
              error: (error, stackTrace) => Text("$error"),
              loading: () => Center(child: CircularProgressIndicator(),),
            ),
          )
        ]
      )
    );
  }
}

class _CustomCard extends StatelessWidget {
  final String image;
  final String title;
  final String description;
  const _CustomCard(this.image, this.title, this.description);

  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;
    return SizedBox(
      width: size.width * 0.8,
      child: Card(
        child: Column(
          children: [

            FadeInImage(
              height: size.height * 0.2,
              fit: BoxFit.cover,
              image: NetworkImage(image),
              placeholder: AssetImage('assets/images/no-item.png'),
            ),

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  SizedBox(height: 15,),
                  Text(title, maxLines: 3, style: TextStyle( fontWeight: FontWeight.bold, fontSize: 15 ),),
                  SizedBox(height: 10,),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.star, color: Colors.amberAccent.shade700,),
                      Icon(Icons.star, color: Colors.amberAccent.shade700,),
                      Icon(Icons.star, color: Colors.amberAccent.shade700,),
                      Icon(Icons.star, color: Colors.amberAccent.shade700,),
                      Icon(Icons.star, color: Colors.amberAccent.shade700,),
                    ],
                  ),
                  SizedBox(height: 10,),

                  Text(
                    description,
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