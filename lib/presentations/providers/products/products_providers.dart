import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:scanner_app/domain/entities/product.dart';
import 'package:scanner_app/presentations/providers/products/products_repository_provider.dart';


final nowProductsProvider = StateNotifierProvider<ProductsNotifier, List<Product>>((ref) {
  final fetchMoreProducts = ref.watch(productRepositoryProvider).getNowProducts;

  return ProductsNotifier(
    fetchMoreProducts: fetchMoreProducts
  );
});
typedef ProductCallback = Future<List<Product>> Function({int page});


//Clase para consulta producto
class ProductsNotifier extends StateNotifier<List<Product>> {
  int currentPage = 0;
  ProductCallback fetchMoreProducts;

  ProductsNotifier({
    required this.fetchMoreProducts,
  }) : super([]);

  Future<void> loadNextPage() async {
    currentPage++;
    final List<Product> products = await fetchMoreProducts(page: currentPage);
    state =  [...state, ...products];
  }
}
