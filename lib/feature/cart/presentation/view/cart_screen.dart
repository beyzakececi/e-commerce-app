import 'package:e_commerce/feature/cart/presentation/view/widgets/checkout_buttom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import '../../../../product/di/injector.dart';
import '../../data/model/cart_item_model.dart';
import '../bloc/cart_bloc.dart';
import 'widgets/checkout_button.dart';

class CartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<CartBloc>()..add(LoadCart()),
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'My Cart',
            style: TextStyle(color: Colors.black),
          ),
          backgroundColor: Colors.white,
          elevation: 0,
          centerTitle: true,
        ),
        body: Column(
          children: [
            Expanded(
              child: BlocBuilder<CartBloc, CartState>(
                builder: (context, state) {
                  if (state is CartLoaded) {
                    return ListView.builder(
                      itemCount: state.items.length,
                      itemBuilder: (context, index) {
                        final item = state.items[index];
                        return CartItemWidget(item: item);
                      },
                    );
                  } else if (state is CartError) {
                    return Center(child: Text(state.message));
                  } else {
                    return Center(child: CircularProgressIndicator());
                  }
                },
              ),
            ),
            BlocBuilder<CartBloc, CartState>(
              builder: (context, state) {
                if (state is CartLoaded) {
                  return CheckoutButton(
                    totalPrice: state.totalPrice,
                    onPressed: () {
                      showModalBottomSheet(
                        context: context,
                        isScrollControlled: true,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.vertical(top: Radius.circular(16.0)),
                        ),
                        builder: (context) => CheckoutBottomSheet(totalPrice: state.totalPrice),
                      );
                    },
                  );
                }
                return Container();
              },
            ),
          ],
        ),
      ),
    );
  }
}

class CartItemWidget extends StatelessWidget {
  final CartItem item;

  CartItemWidget({required this.item});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Padding(
        padding: EdgeInsets.all(8.0),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
        Stack(
        children: [
        Row(
        children: [
            Image.network(item.imageUrl, width: 80, height: 80, fit: BoxFit.cover),
        SizedBox(width: 16),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(item.name, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              Text('1kg, Price'),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  IconButton(
                    iconSize: 30,
                    icon: Icon(Icons.remove_circle_outline),
                    onPressed: () {
                      num newQuantity = item.quantity - 1;
                      if (newQuantity > 0) {
                        context.read<CartBloc>().add(UpdateQuantity(item.id, newQuantity));
                      } else {
                        context.read<CartBloc>().add(RemoveItem(item.id));
                      }
                    },
                  ),
                  Text('${item.quantity}', style: TextStyle(fontSize: 18)),
                  IconButton(
                    iconSize: 30,
                    icon: Icon(Icons.add_circle_outline),
                    onPressed: () {
                      num newQuantity = item.quantity + 1;
                      context.read<CartBloc>().add(UpdateQuantity(item.id, newQuantity));
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
        ],
      ),
      Positioned(
        right: 0,
        top: 0,
        child: IconButton(
          icon: Icon(Icons.close),
          onPressed: () {
            context.read<CartBloc>().add(RemoveItem(item.id));
          },
        ),
      ),
      ],
    ),
              Align(
                alignment: Alignment.bottomRight,
                child: Padding(
                  padding: const EdgeInsets.only(right: 8.0, top: 8.0),
                  child: Text(
                    '\$${(item.price * item.quantity).toStringAsFixed(2)}',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ],
        ),
      ),
    );
  }
}