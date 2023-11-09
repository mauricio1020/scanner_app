class Product {
  final String nombreProducto;
  final int codEan;
  final double pvp;
  final double pvpAfiliado;
  final int descuento;
  final int numEvento;
  final String nomEvento;
  final int status;
  final int codMaterial;
  final String image;

  Product({
    required this.nombreProducto,
    required this.codEan,
    required this.pvp,
    required this.pvpAfiliado,
    required this.descuento,
    required this.numEvento,
    required this.nomEvento,
    required this.status,
    required this.codMaterial,
    required this.image
  });
}
