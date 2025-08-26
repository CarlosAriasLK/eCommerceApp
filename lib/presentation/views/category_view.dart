import 'package:e_commerce_app/presentation/providers/products_provider.dart';
import 'package:e_commerce_app/presentation/widgets/shared/custom_end_drawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CategoryView extends ConsumerWidget {
  const CategoryView({super.key});

  @override
  Widget build(BuildContext context, ref) {

    final size = MediaQuery.of(context).size;
    final productsAsync = ref.watch( categoryProductsProvider );

    return Scaffold(

      appBar: AppBar(
        title: Center(child: Text('Categories', style: TextStyle(
          fontSize: 30,
          fontWeight: FontWeight.bold
        ),),),
      ),

      endDrawer: CustomEndDrawer(),

      body: Row(
        children: [
          SizedBox(
            width: size.width * 0.2,
            child: Column(
              children: [
                _CustomButton(category: 'jewelery',),
                _CustomButton(category: 'men%27s%20clothing',),
                _CustomButton(category: 'women%27s%20clothing',),
              ],
            ),
          ),

          Expanded(
            child: productsAsync.when(
              error: (error, stackTrace) => Text('Error: $error'), 
              loading: () => Center(child: CircularProgressIndicator(),),

              data: ( products ) => ListView.builder(
                itemCount: products.length,
                itemBuilder: (context, index) {
                  final product = products[index];
                  return Padding(
                    padding: EdgeInsetsGeometry.all(10),
                    child: Column(
                      children: [
                        Card(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                        
                              Expanded(
                                child: Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(product.title, style: TextStyle( fontSize: 20),),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text("Price: ${product.price.toString()}", style: TextStyle(
                                        fontSize: 17,
                                        fontWeight: FontWeight.bold
                                      ),),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(10.0),
                                      child: Text(product.description, style: TextStyle(
                                        fontSize: 17
                                      ),),
                                    ),
                                  ],
                                ),
                              ),
                        
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
                      ],
                    ),
                  );
                },
              ), 
            )
          ),

          
        ],
      ),
    );
  }
}

class _CustomButton extends ConsumerWidget {
  final String category;
  const _CustomButton({required this.category});

  @override
  Widget build(BuildContext context, ref) {
    return InkWell(
      onTap: () {
        ref.read( categoryProductsProvider.notifier ).changeCategory(category);
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: Container(
          width: 200,
          height: 80,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all()
          ),
          child: Align( alignment: Alignment.center, child: Text(category == "men%27s%20clothing" ? "Men" :  category == "women%27s%20clothing" ? "Women" : category, style: TextStyle( fontSize: 20 ),), ),
        ),
      ),
    );
  }
}