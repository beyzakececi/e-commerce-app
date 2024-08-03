import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:go_router/go_router.dart';

import '../../../../product/constants/app_colors.dart';
import '../../../../product/router/route_names.dart';

class FavoritesView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Favorite', style: TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.w500)),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(8.0),
          child: Container(
            color: Colors.grey.shade600,
            height: 1.0,
          ),
        ),
      ),

    );
  }
}
