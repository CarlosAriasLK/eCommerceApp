
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
Future<List<Product>> getHotProducts (Ref ref) async{
  final repository = ref.watch( productsRepositoryProvider );
  return await repository.getProductsHot();
}

@riverpod
Future<Product> getProductById (Ref ref, int id) async{
  final repository = ref.watch( productsRepositoryProvider );
  return await repository.getProduct(id);
}


@Riverpod(keepAlive: true)
class cart extends _$cart {
  
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