

import 'package:e_commerce_app/domain/datasources/products_datasources.dart';
import 'package:e_commerce_app/domain/entities/product.dart';
import 'package:dio/dio.dart';


class ProductsDatasourcesImpl extends ProductsDatasources  {

  final dio = Dio(BaseOptions( baseUrl: 'https://fakestoreapi.in/api' ));

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
      final List products = response.data["products"];
      final productos = products.map( ( product ) => Product.fromJson(product) ).toList();
      return productos;

    } catch (e) {
      throw Exception("Error: $e");
    }
  }

  @override
  Future<List<Product>> getProductsHot() async{
    try {
      final response = await dio.get('/products/category?type=mobile');
      final List productsHot = response.data["products"];
      return productsHot.map( (productHot) => Product.fromJson(productHot) ).toList();

    }catch (e) {
      throw Exception("Error: $e");
    }
  }
}