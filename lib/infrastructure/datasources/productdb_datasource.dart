import 'package:dio/dio.dart';

//import 'package:scanner_app/config/constants/environment.dart';
import 'package:scanner_app/domain/datasources/products_datasources.dart';
import 'package:scanner_app/domain/entities/product.dart';
import 'package:scanner_app/infrastructure/mappers/product_mapper.dart';
import 'package:scanner_app/infrastructure/models/productdb/productdb_response.dart';

class ProductdbDataSource extends ProductsDataSource {
  final dio = Dio();
  

  @override
  Future<List<Product>> getNowProducts({int page = 1}) async {
    final response = await dio.get(
      'https://10.238.56.236/mforero/consultaproducto/LiteVersion/makeViewByEanCam',
      queryParameters: {'ean': '7702001044467', 'tienda': '1513', 'view': 'mobile'},
    );

    final productDBResponse = ProductDbResponse.fromJson(response.data);

    final List<Product> products = productDBResponse.results
        .where((productdb) => productdb.image != '')
        .map((productdb) => ProductMapper.productDBToEntity(productdb))
        .toList();

    return products;
  }
}
