import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:scanner_app/infrastructure/datasources/productdb_datasource.dart';
import 'package:scanner_app/infrastructure/repositories/product_repository_impl.dart';

final productRepositoryProvider = Provider((ref) {
  return ProductRepositoryImpl(ProductdbDataSource());
});