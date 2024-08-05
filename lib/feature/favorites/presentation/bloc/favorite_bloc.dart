import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:hive/hive.dart';
import '../../../cart/data/model/cart_item_model.dart';
import '../../../product_detail/data/model/meal_detail_model.dart';
import '../../../product_detail/domain/entities/meal_detail_entity.dart';
import 'favorite_event.dart';
import 'favorite_state.dart';

class FavoriteBloc extends Bloc<FavoriteEvent, FavoriteState> {
  final Box<MealDetailModel> favoriteBox;
  final Box<CartItem> cartBox;

  FavoriteBloc({required this.favoriteBox, required this.cartBox}) : super(FavoriteInitial()) {
    on<LoadFavorites>(_onLoadFavorites);
    on<AddToFavorite>(_onAddToFavorite);
    on<RemoveFromFavorite>(_onRemoveFromFavorite);
    on<AddAllToCart>(_onAddAllToCart);
  }

  void _onLoadFavorites(LoadFavorites event, Emitter<FavoriteState> emit) {
    final favorites = favoriteBox.values.toList().map((model) => model.toEntity()).toList();
    emit(FavoriteLoaded(favorites));
  }

  void _onAddToFavorite(AddToFavorite event, Emitter<FavoriteState> emit) {
    favoriteBox.put(event.meal.id, MealDetailModel.fromEntity(event.meal));
    add(LoadFavorites());
  }

  void _onRemoveFromFavorite(RemoveFromFavorite event, Emitter<FavoriteState> emit) {
    favoriteBox.delete(event.mealId);
    add(LoadFavorites());
  }

  void _onAddAllToCart(AddAllToCart event, Emitter<FavoriteState> emit) {
    final favorites = favoriteBox.values.toList();
    for (var meal in favorites) {
      cartBox.put(meal.id, CartItem.fromMeal(meal.toEntity()));
    }
    //
  }
}
