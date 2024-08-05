class MealDetailEntity {
  final String id;
  final String name;
  final String thumbnail;
  final String instructions;
  final List<String>? ingredients;
  final List<String>? measures;
  final bool isFavorite;
  final int quantity;
  final double rating;

  MealDetailEntity({
    required this.id,
    required this.name,
    required this.thumbnail,
    required this.instructions,
    this.ingredients,
    this.measures,
    this.isFavorite = false,
    this.quantity = 1,
    this.rating = 0.0,
  });

  MealDetailEntity copyWith({
    String? id,
    String? name,
    String? thumbnail,
    String? instructions,
    List<String>? ingredients,
    List<String>? measures,
    bool? isFavorite,
    int? quantity,
    double? rating,
  }) {
    return MealDetailEntity(
      id: id ?? this.id,
      name: name ?? this.name,
      thumbnail: thumbnail ?? this.thumbnail,
      instructions: instructions ?? this.instructions,
      ingredients: ingredients ?? this.ingredients,
      measures: measures ?? this.measures,
      isFavorite: isFavorite ?? this.isFavorite,
      quantity: quantity ?? this.quantity,
      rating: rating ?? this.rating,
    );
  }
}
