import 'package:scanner_app/domain/entities/product.dart';

abstract class ProductsRepository {
  Future<List<Product>> getNowProducts({int page = 1});
}