part of 'cart_bloc.dart';

abstract class CartEvent extends Equatable {
  const CartEvent();

  @override
  List<Object?> get props => [];
}

class LoadCart extends CartEvent {}

class AddItem extends CartEvent {
  final CartItem item;

  const AddItem(this.item);

  @override
  List<Object?> get props => [item];
}

class RemoveItem extends CartEvent {
  final String itemId;

  const RemoveItem(this.itemId);

  @override
  List<Object?> get props => [itemId];
}

class UpdateQuantity extends CartEvent {
  final String itemId;
  final num quantity;

  const UpdateQuantity(this.itemId, this.quantity);

  @override
  List<Object?> get props => [itemId, quantity];
}
