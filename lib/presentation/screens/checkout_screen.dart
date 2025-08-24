import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('Checkout')),
      ),

      body: Stack(
        children: [  
        
          ListView.builder(
            itemCount: 10,
            itemBuilder: (context, index) {
              return Padding(
                padding: EdgeInsetsGeometry.all(10),
                child: Card(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                  
                      FadeInImage(
                        fit: BoxFit.cover,
                        height: 150,
                        placeholder: AssetImage('assets/images/no-item.png'), 
                        image: AssetImage('assets/images/producto.png')
                      ),
                  
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Name'),
                          Text('Price'),
                          Text('Count'),
                        ],
                      ),
                  
                      Text('Status: Order placed'),
                  
                      Row( 
                        children: [
                          IconButton(onPressed: (){}, icon: Icon(Icons.add)),
                          Text('10'),
                          IconButton(onPressed: (){}, icon: Icon(Icons.remove)),
                        ],
                      )
                  
                    ],
                  ),
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
                          children: const [
                            Text( 'Total:', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16), ),
                            Spacer(),

                            Text( '30', style: TextStyle(fontSize: 22), ),
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