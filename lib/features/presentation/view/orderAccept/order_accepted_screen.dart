
import 'package:e_commerce/core/extensions/string_extension.dart';
import 'package:e_commerce/features/presentation/view/app/widgets/image/custom_image_widget.dart';
import 'package:flutter/material.dart';

import '../../../../core/enums/app_png.dart';

class OrderAcceptedView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Order Accepted'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            CustomImageWidget(
              image: AppPng.orderaccepted.toPng,
            ),
            SizedBox(height: 16),
            Text(
              'Your Order has been accepted',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              'Your items have been placed and are on their way to being processed',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                // Track order action
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 32.0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
              child: Text('Track Order', style: TextStyle(color: Colors.white, fontSize: 16)),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).popUntil((route) => route.isFirst);
              },
              child: Text('Back to home'),
            ),
          ],
        ),
      ),
    );
  }
}
