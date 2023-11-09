import 'package:scanner_app/domain/entities/product.dart';
import 'package:scanner_app/infrastructure/models/productdb/product_productdb.dart';

class ProductMapper {
  static Product productDBToEntity(ProductProductDB productdb) => Product(
      nombreProducto: productdb.nombreProducto,
      codEan: productdb.codEan,
      pvp: productdb.pvp,
      pvpAfiliado: productdb.pvpAfiliado,      
      descuento: productdb.descuento,
      numEvento: productdb.numEvento,
      nomEvento: productdb.nomEvento,
      status: productdb.status,
      codMaterial: productdb.codMaterial,
      image: productdb.image,
  );  
}
