


import 'package:e_commerce_app/infrastructure/datasources/products_datasources_impl.dart';
import 'package:e_commerce_app/infrastructure/repositories/products_repositories_impl.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final productsRepositoryProvider = Provider((ref) {
  
  final datasources = ProductsDatasourcesImpl();
  return ProductsRepositoriesImpl(datasources: datasources);
  
});