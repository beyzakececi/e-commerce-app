import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../product/enums/app_png.dart';
import '../../app/presentation/view/widgets/custom_image.dart';


class AccountView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Account'),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.symmetric(vertical: 20, horizontal: 16),
              child: Row(
                children: [
                  CustomImageWidget(
                    image: AppPng.account.toPng,
                    width: 80,
                    height: 80,
                    fit: BoxFit.cover,
                  ),
                  SizedBox(width: 16),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Afsar Hossen',
                        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 4),
                      Text(
                        'lmshuvo97@gmail.com',
                        style: TextStyle(fontSize: 16, color: Colors.grey),
                      ),
                    ],
                  ),
                  Spacer(),
                  IconButton(
                    icon: Icon(Icons.edit, color: Colors.green),
                    onPressed: () {
                      // Edit profile action
                    },
                  ),
                ],
              ),
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.shopping_bag),
              title: Text('Orders'),
              trailing: Icon(Icons.chevron_right),
              onTap: () {
                // Navigate to Orders
              },
            ),
            ListTile(
              leading: Icon(Icons.person),
              title: Text('My Details'),
              trailing: Icon(Icons.chevron_right),
              onTap: () {
                // Navigate to My Details
              },
            ),
            ListTile(
              leading: Icon(Icons.location_on),
              title: Text('Delivery Address'),
              trailing: Icon(Icons.chevron_right),
              onTap: () {
                // Navigate to Delivery Address
              },
            ),
            ListTile(
              leading: Icon(Icons.payment),
              title: Text('Payment Methods'),
              trailing: Icon(Icons.chevron_right),
              onTap: () {
                // Navigate to Payment Methods
              },
            ),
            ListTile(
              leading: Icon(Icons.card_giftcard),
              title: Text('Promo Code'),
              trailing: Icon(Icons.chevron_right),
              onTap: () {
                // Navigate to Promo Code
              },
            ),
            ListTile(
              leading: Icon(Icons.notifications),
              title: Text('Notifications'),
              trailing: Icon(Icons.chevron_right),
              onTap: () {
                // Navigate to Notifications
              },
            ),
            ListTile(
              leading: Icon(Icons.help),
              title: Text('Help'),
              trailing: Icon(Icons.chevron_right),
              onTap: () {
                // Navigate to Help
              },
            ),
            ListTile(
              leading: Icon(Icons.info),
              title: Text('About'),
              trailing: Icon(Icons.chevron_right),
              onTap: () {
                // Navigate to About
              },
            ),
            Divider(),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: ElevatedButton.icon(
                onPressed: () {
                  // Log out app
                  SystemNavigator.pop(); // Close the app
                },
                icon: Icon(Icons.logout, color: Colors.green),
                label: Text(
                  'Log Out',
                  style: TextStyle(color: Colors.green, fontSize: 16),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.grey.shade200,
                  padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 24.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
