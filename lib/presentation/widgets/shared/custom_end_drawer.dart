import 'package:e_commerce_app/domain/entities/product.dart';
import 'package:e_commerce_app/presentation/providers/products_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class CustomEndDrawer extends ConsumerWidget {
  const CustomEndDrawer({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final size = MediaQuery.of(context).size;

    return Drawer(
      width: size.width * 0.4,
      child: SafeArea(
        child: ListView(
          scrollDirection: Axis.vertical,
          children: [

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  OutlinedButton(
                    onPressed: (){ ref.read( cartProvider.notifier ).clearAll(); }, child: Text('Clear all')
                  ),
                  Text('Carrito', style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold
                  ),),
                  OutlinedButton(onPressed: (){ context.pop(); }, child: Text('Close')),
                ],
              ),
            ),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: OutlinedButton(
                onPressed: (){
                  showDialog(
                    context: context, 
                    builder: (context) {
                      return AlertDialog(
                        title: Text('Notice'),
                        content: Text('Whether to submit an order'),
                        actions: [
                          OutlinedButton(onPressed: (){ context.pop(); }, child: Text('No')),
                          OutlinedButton(onPressed: (){ context.pop(); context.push('/checkout'); context.pop(); }, child: Text('Yes')),
                        ],
                      );
                    },
                  );
                },
              
                child: Text('Submit order')
              ),
            ),
            
            _CustomListViewBuilder()
          ],
        ),
      ),
    );
  }
}


class _CustomListViewBuilder extends ConsumerWidget {

  const _CustomListViewBuilder();
  
  @override
  Widget build(BuildContext context, ref) {

    final cartItems = ref.watch( cartProvider );

    if( cartItems.isEmpty ) {
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(child: Text('No hay productos aún'),),
      );
    }

    return ListView.builder(
      scrollDirection: Axis.vertical,
      physics: NeverScrollableScrollPhysics(),
      itemCount: cartItems.length,
      shrinkWrap: true,
      itemBuilder: (context, index) {
        final item = cartItems[index];
        return _CustomCardItemCart( product: item ,);
      },
    );
  }
}


class _CustomCardItemCart extends ConsumerWidget {
  final Product product;
  const _CustomCardItemCart({required this.product});

  @override
  Widget build(BuildContext context, ref) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: Card(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: FadeInImage(
                fit: BoxFit.cover,
                height: 150,
                placeholder: AssetImage('assets/images/no-item.png'), 
                image: NetworkImage(product.image)
              ),
            ),
      
            Expanded(
              child: Column(
                children: [
                  Text(product.title),
                  Text(product.price.toString()),
                ],
              ),
            ),
      
            Column(
              children: [
                OutlinedButton(onPressed: (){
                  ref.read( cartProvider.notifier ).removeItem(product.id);
                }, child: Text('Delete')),
                Row( 
                  children: [
                    IconButton(onPressed: (){}, icon: Icon(Icons.add)),
                    Text('10'),
                    IconButton(onPressed: (){}, icon: Icon(Icons.remove)),
                  ],
                )
              ],
            ),
      
          ],
        ),
      ),
    );
  }
}