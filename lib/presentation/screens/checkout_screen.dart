import 'package:e_commerce_app/presentation/providers/products_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class CheckoutScreen extends ConsumerWidget {
  const CheckoutScreen({super.key});

  @override
  Widget build(BuildContext context, ref) {

    final cartItems = ref.watch( cartProvider );
    final calculateTotal = ref.watch( calculateTotalProvider( cartItems ) );

    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('Checkout')),
      ),

      body: Stack(
        children: [
          ListView.builder(
            itemCount: cartItems.length,
            itemBuilder: (context, index) {
              final cartItem = cartItems[index];

              if( cartItems.isEmpty ) {
                return Center(child: Text('No hay items aún'),);
              }

              return Card(
                margin: EdgeInsets.symmetric(vertical: 7, horizontal: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: FadeInImage(
                        fit: BoxFit.cover,
                        height: 150,
                        placeholder: AssetImage('assets/images/no-item.png'), 
                        image: NetworkImage(cartItem.image)
                      ),
                    ),
                
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(cartItem.title),
                        Text(cartItem.price.toString()),
                      ],
                    ),
                
                    Text('Status: Order placed'),
                
                    Row( 
                      children: [
                        IconButton(onPressed: (){
                          ref.read( cartProvider.notifier ).decreaseItem(cartItem.id);
                        }, icon: Icon(Icons.remove)),
                        Text(cartItem.quantity.toString()),
                        IconButton(onPressed: (){
                          ref.read( cartProvider.notifier ).increaseItem(cartItem.id);
                        }, icon: Icon(Icons.add)),
                      ],
                    )
                
                  ],
                ),
              );
            },
          ),

          Align(
            alignment: Alignment.bottomRight,
            child: SizedBox(
              width: 420,
              height: 150,

              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                  side: const BorderSide(color: Colors.black, width: 2),
                ),
                child: Row(
                  children: [

                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(12),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text( 'Total:', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16), ),
                            Spacer(),

                            Text(
                              "$calculateTotal Є",
                              style: TextStyle(fontSize: 22), ),
                          ],
                        ),
                      ),
                    ),

                    Expanded(
                      child: Column(
                        children: [

                          Expanded(
                            child: InkWell(
                              onTap: () => context.pop(),
                              child: Container(
                                decoration: const BoxDecoration(
                                  border: Border(
                                    bottom: BorderSide(color: Colors.black, width: 1),
                                    left: BorderSide(color: Colors.black, width: 1),
                                  ),
                                ),
                                child: const Center(child: Text('Add dish')),
                              ),
                            ),
                          ),

                          Expanded(
                            child: InkWell(
                              onTap: () {
                                showDialog(
                                  context: context,
                                  builder: (context) {
                                    return AlertDialog(
                                      title: const Text('Notice'),
                                      content: const Text('Whether to check out'),
                                      actions: [

                                        OutlinedButton(
                                          onPressed: () => context.pop(),
                                          child: const Text('No'),
                                        ),
                                        OutlinedButton(
                                          onPressed: () {
                                            context.pop();
                                            context.push('/successful');
                                            ref.read( cartProvider.notifier ).clearAll();
                                          },
                                          child: const Text('Yes'),
                                        ),

                                      ],
                                    );
                                  },
                                );
                              },

                              child: Container(
                                decoration: BoxDecoration(
                                  border: Border(
                                    left: BorderSide( color: Colors.black, width: 1 )
                                  )
                                ),
                                child: const Center(
                                  child: Text('Checkout')
                                )
                              ),
                            ),
                          ),

                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          )

        ]
      ),
    );
  }
}