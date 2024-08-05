import 'package:hive/hive.dart';
import '../../../product_detail/domain/entities/meal_detail_entity.dart';

part 'cart_item_model.g.dart';

@HiveType(typeId: 1)
class CartItem {
  @HiveField(0)
  final String id;
  @HiveField(1)
  final String name;
  @HiveField(2)
  final String imageUrl;
  @HiveField(3)
  final num quantity;
  @HiveField(4)
  final num price;

  CartItem({
    required this.id,
    required this.name,
    required this.imageUrl,
    required this.quantity,
    required this.price,
  });

  factory CartItem.fromMeal(MealDetailEntity meal) {
    return CartItem(
      id: meal.id ?? '',
      name: meal.name ?? '',
      imageUrl: meal.thumbnail ?? '',
      quantity: meal.quantity,
      price: 10 // Meal price should be defined somewhere, using a placeholder here
    );
  }

  CartItem copyWith({
    String? id,
    String? name,
    String? imageUrl,
    num? quantity,
    num? price,
  }) {
    return CartItem(
      id: id ?? this.id,
      name: name ?? this.name,
      imageUrl: imageUrl ?? this.imageUrl,
      quantity: quantity ?? this.quantity,
      price: price ?? this.price,
    );
  }
}
