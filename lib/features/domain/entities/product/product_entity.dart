import 'package:equatable/equatable.dart';

class ProductsEntity extends Equatable {
  final List<ProductEntity>? products;

  const ProductsEntity({required this.products});

  @override
  List<Object?> get props => [products];
}

class ProductEntity extends Equatable {
  final String? id;
  final String? title;
  final String? description;
  final String? price;

  const ProductEntity({
    required this.id,
    required this.title,
    required this.description,
    required this.price,
  });

  @override
  List<Object?> get props => [
  id,
  title,
  description,
  price,
  ];
}

