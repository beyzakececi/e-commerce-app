import '../../../domain/entities/product/product_entity.dart';

class ProductsModel extends ProductsEntity {
  final List<ProductModel>? products;

  const ProductsModel({required this.products}) : super(products: products);

  ProductsEntity convertToEntity() {
    return ProductsEntity(products: products);
  }

  Map<String, dynamic> toJson() {
    return {
      'products': products?.map((e) => e.toJson()).toList(),
    };
  }

  factory ProductsModel.fromJson(Map<String, dynamic> json) {
    return ProductsModel(
      products: List<ProductModel>.from(
        json['products']?.map((x) => ProductModel.fromJson(x)),
      ),
    );
  }
}
class ProductModel extends ProductEntity {
  final String? id;
  final String? title;
  final String? description;
  final String? price;

  const ProductModel({
    required this.id,
    required this.title,
    required this.description,
    required this.price,
  }) : super(
    id: id,
    title: title,
    description: description,
    price: price,
  );

  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
    id: json["id"],
    title: json["title"],
    description: json["description"],
    price: json["price"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "title": title,
    "description": description,
    "price":price,
  };
}