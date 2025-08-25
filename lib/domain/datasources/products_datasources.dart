



import 'package:e_commerce_app/domain/entities/product.dart';

abstract class ProductsDatasources {

  Future<List<Product>> getProductsRecomended();

  Future<List<Product>> getProductsHot();

  Future<Product> getProduct( int id );

}