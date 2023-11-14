class Product {  
  final String id;
  final String nombreProducto;
  final String codEan;
  final String pvp;
  final String pvpAfiliado;
  final String descuento;
  final String numEvento;
  final String nomEvento;
  final bool status;
  final String codMaterial;
  final String color;
  final String img;

  Product({    
    required this.id,
    required this.nombreProducto,
    required this.codEan,
    required this.pvp,
    required this.pvpAfiliado,
    required this.descuento,
    required this.numEvento,
    required this.nomEvento,
    required this.status,
    required this.codMaterial,
    required this.color,
    required this.img
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(     
      id: json['id'],
      nombreProducto: json['nombre_producto'],
      codEan: json['cod_ean'],
      pvp: json['pvp'],
      pvpAfiliado: json['pvp_afiliado'],
      descuento: json['descuento'],
      numEvento: json['num_evento'],
      nomEvento: json['nom_evento'],
      status: json['status'],
      codMaterial: json['cod_material'],
      color: json['color'],
      img: json['data']['images']['img']
    );
  }
}
