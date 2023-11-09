class ProductProductDB {
    ProductProductDB({
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

    factory ProductProductDB.fromJson(Map<String, dynamic> json) => ProductProductDB(
        nombreProducto: json["adult"] ?? false,
        codEan: json["backdrop_path"] ?? '',
        pvp: json["backdrop_path"] ?? '',
        pvpAfiliado: json["id"],
        descuento: json["original_language"],
        numEvento: json["original_title"],
        nomEvento: json["overview"] ?? '',      
        status: json["overview"] ?? '',
        codMaterial: json["overview"] ?? '',
        image: json["overview"] ?? ''        
    );

    Map<String, dynamic> toJson() => {
        "nombreProducto": image,
        "codEan": codEan,
        "pvp": pvp,
        "pvpAfiliado": pvpAfiliado,
        "descuento": descuento,
        "numEvento": numEvento,
        "nomEvento": nomEvento,  
        "status": status,  
        "codMaterial": codMaterial,
        "image": image,
    };
}