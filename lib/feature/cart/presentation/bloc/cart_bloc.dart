import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:hive/hive.dart';
import '../../../product_detail/presentation/bloc/meal_detail_event.dart';
import '../../data/model/cart_item_model.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  final Box<CartItem> cartBox;

  CartBloc({required this.cartBox}) : super(CartInitial()) {
    on<LoadCart>(_onLoadCart);
    on<AddItem>(_onAddItem);
    on<RemoveItem>(_onRemoveItem);
    on<UpdateQuantity>(_onUpdateQuantity);
  }

  void _onLoadCart(LoadCart event, Emitter<CartState> emit) {
    final items = cartBox.values.toList();
    emit(CartLoaded(items: items, totalPrice: _calculateTotalPrice(items)));
  }

  void _onAddItem(AddItem event, Emitter<CartState> emit) {
    cartBox.put(event.item.id, event.item);
    add(LoadCart());
  }

  void _onRemoveItem(RemoveItem event, Emitter<CartState> emit) {
    cartBox.delete(event.itemId);
    add(LoadCart());
  }

  void _onUpdateQuantity(UpdateQuantity event, Emitter<CartState> emit) {
    final item = cartBox.get(event.itemId);
    if (item != null) {
      final updatedItem = item.copyWith(quantity: event.quantity);
      cartBox.put(updatedItem.id, updatedItem);
      add(LoadCart());
    }
  }

  double _calculateTotalPrice(List<CartItem> items) {
    return items.fold(0, (sum, item) => sum + (item.price * item.quantity));
  }
}
