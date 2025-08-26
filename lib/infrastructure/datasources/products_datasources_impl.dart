

import 'package:e_commerce_app/domain/datasources/products_datasources.dart';
import 'package:e_commerce_app/domain/entities/product.dart';
import 'package:dio/dio.dart';


class ProductsDatasourcesImpl extends ProductsDatasources  {

  final dio = Dio(BaseOptions( baseUrl: 'https://fakestoreapi.com'));

  @override
  Future<Product> getProduct(int id) async{
    try {
      final response = await dio.get('/products/$id');
      return Product.fromJson( response.data );
    } catch (e) {
      throw Exception("Error: $e");
    }
  }

  @override
  Future<List<Product>> getProductsRecomended() async{
    try {
      final response = await dio.get('/products');
      final List products = response.data;
      final productos = products.map( ( product ) => Product.fromJson(product) ).toList();
      return productos;

    } catch (e) {
      throw Exception("Error: $e");
    }
  }
  
  @override
  Future<List<Product>> getProductsByCategory(String category) async{
    try {
      
      final response = await dio.get('/products/category/$category');
      final List productsByCategory = response.data;
      return productsByCategory.map( (product) => Product.fromJson( product ) ).toList();

    } catch (e) {
      throw Exception("Error: $e"); 
    }
  }

}