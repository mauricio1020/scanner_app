
import 'product_productdb.dart';

class ProductDbResponse {
    ProductDbResponse({        
        required this.results        
    });
  
    final List<ProductProductDB> results;    

    factory ProductDbResponse.fromJson(Map<String, dynamic> json) => ProductDbResponse(        
        results: List<ProductProductDB>.from(json["results"].map((x) => ProductProductDB.fromJson(x))),
      
    );

    Map<String, dynamic> toJson() => {        
        "results": List<dynamic>.from(results.map((x) => x.toJson())),        
    };
}


