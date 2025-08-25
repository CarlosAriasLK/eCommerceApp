import 'package:e_commerce_app/presentation/providers/products_provider.dart';
import 'package:e_commerce_app/presentation/widgets/shared/custom_end_drawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MenuView extends ConsumerWidget {
  const MenuView({super.key});

  @override
  Widget build(BuildContext context, ref) {

    final productsRecomendeded = ref.watch( getProductsRecomendedProvider );
    
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('Menu'),),
      ),

      endDrawer: CustomEndDrawer(),

      body: Column(
        children: [
          
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Align(alignment: Alignment.centerLeft, child: Text('Recomended', style: TextStyle( fontSize: 30, fontWeight: FontWeight.bold ),),),
          ),

          Expanded(
            child: productsRecomendeded.when(
              data: (products) {
                return ListView.builder(
                  scrollDirection: Axis.horizontal,
                    itemCount: products.length,
                    itemBuilder: (context, index) {
                      final product = products[index];
                      
                      return SizedBox(
                        width: 700,
                        height: 500,
                        child: GestureDetector( 
                          onTap: () => showDialog(
                            context: context, 
                            builder: (context) {
                              return _CustomDialog(idProduct: product.id,);
                            },
                          ), 
                          child: _CustomCard( product.image, product.title, product.description )
                        ),
                      );

                    },
                );
              },
              error: (error, __) => Text("$error") ,
              loading: () => Center(child: CircularProgressIndicator(),),
            ),
          ),

        ]
      )
    );
  }
}

class _CustomDialog extends ConsumerWidget {
  final int idProduct;
  const _CustomDialog({required this.idProduct});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final productAsync = ref.watch(getProductByIdProvider(idProduct));
    final size = MediaQuery.of(context).size;

    return productAsync.when(
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (error, stack) => AlertDialog( content: Text('Error: $error'), ),
      data: (product) {
        return AlertDialog(
          
          content: SizedBox(
            width: 600,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  FadeInImage(
                    placeholder: const AssetImage('assets/images/no-item.png'),
                    image: NetworkImage( product.image ),
                    height: size.height * 0.4,
                    fit: BoxFit.cover,
                  ),
              
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(product.title, style: TextStyle( fontSize: 20 ),),
                  ),
              
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(product.description, style: TextStyle( fontSize: 18 ),),
                  ),
              
                  Row(
                    children: [
                      IconButton(onPressed: (){}, icon: Icon(Icons.remove)),
                      Text('10'),
                      IconButton(onPressed: (){}, icon: Icon(Icons.add)),
              
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: OutlinedButton(onPressed: (){
                          ref.read( cartProvider.notifier ).addItem(product);
                        }, 
                        child: Text('Submit')
                        )
                      ),
                    ],
                  ),
              
                ],
              ),
            ),
          ),
        );
      },
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

    /* final size = MediaQuery.of(context).size; */

    return Card(
      margin: EdgeInsets.symmetric(horizontal: 10),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadiusGeometry.circular(20)
      ),
      
      child: SizedBox.expand(
        child: Row(
          children: [
            
            Expanded(
              flex: 3,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: FadeInImage(
                  alignment: Alignment.topCenter,
                  height: 300,
                  fit: BoxFit.contain,
                  image: NetworkImage(image),
                  placeholder: AssetImage('assets/images/no-item.png'),
                ),
              ),
            ),
            
            Expanded(
              flex: 6,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(height: 15,),
                    Text(title, maxLines: 3, style: TextStyle( fontWeight: FontWeight.bold, fontSize: 25 ),),
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
                    
                    Expanded(
                      child: Text(
                        description,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 5,
                        style: TextStyle(
                          fontSize: 18
                        ),
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}