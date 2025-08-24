import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CustomEndDrawer extends StatelessWidget {
  const CustomEndDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Drawer(
      width: size.width * 0.4,
      child: SafeArea(
        child: ListView(
          scrollDirection: Axis.vertical,
          children: [

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                OutlinedButton(
                  onPressed: (){}, child: Text('Clear all')
                ),
                Text('Carrito'),
                OutlinedButton(onPressed: (){ context.pop(); }, child: Text('Close')),
              ],
            ),

            OutlinedButton(
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
            
            _CustomListViewBuilder()
          ],
        ),
      ),
    );
  }
}


class _CustomListViewBuilder extends StatelessWidget {
  const _CustomListViewBuilder();

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.vertical,
      physics: NeverScrollableScrollPhysics(),
      itemCount: 10,
      shrinkWrap: true,
      itemBuilder: (context, index) => _CustomCardItemCart(),
    );
  }
}


class _CustomCardItemCart extends StatelessWidget {
  const _CustomCardItemCart();

  @override
  Widget build(BuildContext context) {
    return Card(
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
            children: [
              Text('Name'),
              Text('Price'),
            ],
          ),

          Column(
            children: [
              OutlinedButton(onPressed: (){}, child: Text('Delete')),
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
    );
  }
}