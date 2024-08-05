
import 'package:flutter/material.dart';

class CheckoutButton extends StatelessWidget {
  final double totalPrice;
  final VoidCallback onPressed;

  CheckoutButton({required this.totalPrice, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 1,
            blurRadius: 5,
            offset: Offset(0, -2),
          ),
        ],
      ),
      child: Row(
        children: [
          Expanded(
            child: ElevatedButton(
                onPressed: onPressed,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  padding: EdgeInsets.symmetric(vertical: 16.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Go to Checkout',
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 8.0),
                      decoration: BoxDecoration(
                        color: Colors.black.withOpacity(0.2), // Darker background
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      child: Text(
                        '\$${totalPrice.toStringAsFixed(2)}',
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      ),
                    ),
                  ],
                ),
          ),
          ),
        ],
      ),
    );
  }
}
