



import 'package:e_commerce_app/domain/entities/product.dart';

abstract class ProductsDatasources {

  Future<List<Product>> getProductsRecomended();

  Future<Product> getProduct( int id );

  Future<List<Product>> getProductsByCategory( String category );
}