import 'package:scanner_app/domain/datasources/products_datasources.dart';
import 'package:scanner_app/domain/entities/product.dart';
import 'package:scanner_app/domain/repositories/product_repository.dart';

class ProductRepositoryImpl extends ProductsRepository {
  final ProductsDataSource dataSource;
  ProductRepositoryImpl(this.dataSource);

  @override
  Future<List<Product>> getNowProducts({int page = 1}) {
    return dataSource.getNowProducts(page: page);
  }
}
