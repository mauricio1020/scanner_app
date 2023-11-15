// api_service.dart

import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:scanner_app/infrastructure/models/product/product.dart';



Future<List<Product>> fetchDataFromApi(String barcodeValue) async {
 const baseUrl = 'http://10.238.56.236/mforero/consultaproducto/LiteVersion/makeViewByEanCam2';
  final parameters = {
    'ean': barcodeValue,
    'tienda': '1501',
    'view': 'mobile',
    '_': '1699817058843'
  };

  final url = Uri.parse('$baseUrl${Uri(queryParameters: parameters)}');

  final response = await http.get(url);

  if (response.statusCode == 200) {
    List<dynamic> data = json.decode(response.body);
    List<Product> products = data.map((json) => Product.fromJson(json)).toList();
    return products;
  } else {
    throw Exception('Error al cargar datos desde la API');
  }
}

