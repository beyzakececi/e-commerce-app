import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

part 'cart_item_model.g.dart';

@HiveType(typeId: 1)
@JsonSerializable()
class CartItem {
  @HiveField(0)
  final String id;
  @HiveField(1)
  final String name;
  @HiveField(2)
  final String imageUrl;
  @HiveField(3)
  final double price;
  @HiveField(4)
  String quantity;

  CartItem({
    required this.id,
    required this.name,
    required this.imageUrl,
    this.price = 10.0, // Default price set to $10.0
    this.quantity = "1", // Default quantity set to 1
  });

  factory CartItem.fromJson(Map<String, dynamic> json) => _$CartItemFromJson(json);
  Map<String, dynamic> toJson() => _$CartItemToJson(this);
}
