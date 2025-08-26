
import 'package:e_commerce_app/domain/entities/product.dart';
import 'package:e_commerce_app/presentation/providers/products_repository_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'products_provider.g.dart';

@riverpod
Future<List<Product>> getProductsRecomended (Ref ref) async{
  final repository = ref.watch( productsRepositoryProvider );
  return await repository.getProductsRecomended();
}

@riverpod
Future<Product> getProductById (Ref ref, int id) async{
  final repository = ref.watch( productsRepositoryProvider );
  return await repository.getProduct(id);
}


@riverpod
class CategoryProducts extends _$CategoryProducts {

  @override
  Future<List<Product>> build(){
    final repository = ref.watch( productsRepositoryProvider );
    return repository.getProductsByCategory('jewelery');
  }

  void changeCategory( String category ) async{
    state = const AsyncLoading();
    try {
      final repository = ref.watch( productsRepositoryProvider );
      final products = await repository.getProductsByCategory(category);
      state = AsyncData(products);

    } catch (e, str) {
      state = AsyncError(e, str);
    }

  }


}



@Riverpod(keepAlive: true)
class Cart extends _$Cart {
  
  @override
  List<Product> build() {
    return [];
  }

  void addItem( Product producto ) {
    try {
      state = [ ...state, producto ];
    } catch (e) {
      throw Exception("Error: $e");
    }
  }

  void removeItem( int productId ) {
    try {
      state = state.where((product) => product.id != productId ).toList();
    } catch (e) {
      throw Exception("Error: $e");
    }
  }

  void clearAll() {
    try {
      state = [];
    } catch (e) {
      throw Exception("Error: $e");
    }
  }

}