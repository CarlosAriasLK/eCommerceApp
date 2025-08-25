


import 'package:e_commerce_app/domain/datasources/products_datasources.dart';
import 'package:e_commerce_app/domain/entities/product.dart';
import 'package:e_commerce_app/domain/repositories/products_repositories.dart';

class ProductsRepositoriesImpl extends ProductsRepositories {

  final ProductsDatasources datasources;
  ProductsRepositoriesImpl({required this.datasources});

  @override
  Future<Product> getProduct(int id) {
    return datasources.getProduct(id);
  }

  @override
  Future<List<Product>> getProductsRecomended() {
    return datasources.getProductsRecomended();
  }

  @override
  Future<List<Product>> getProductsHot() {
    return datasources.getProductsHot();
  }
}