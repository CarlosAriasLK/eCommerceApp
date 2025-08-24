import 'package:e_commerce_app/presentation/widgets/shared/custom_end_drawer.dart';
import 'package:flutter/material.dart';

class CategoryView extends StatelessWidget {
  const CategoryView({super.key});

  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;

    return Scaffold(

      appBar: AppBar(
        title: Center(child: Text('Category')),
      ),

      endDrawer: CustomEndDrawer(),

      body: Row(
        children: [
          SizedBox(
            width: size.width * 0.2,
            child: Column(
              children: [
                _CustomButton(),
                _CustomButton(),
                _CustomButton(),
                _CustomButton(),
                _CustomButton(),
              ],
            ),
          ),


          Expanded(
            child: ListView.builder(
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
                          children: [
                            Text('Name'),
                            Text('Price'),
                            Text('Descripcion'),
                          ],
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
                );
              },
            )
          )
        ],
      ),
    );
  }
}

class _CustomButton extends StatelessWidget {
  const _CustomButton();

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          width: 200,
          height: 90,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all()
          ),
          child: Align( alignment: Alignment.center, child: Text('Chesse'), ),
        ),
      ),
    );
  }
}