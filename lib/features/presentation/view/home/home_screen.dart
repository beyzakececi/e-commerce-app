import 'package:e_commerce/features/presentation/view/app/widgets/base_appbar.dart';
import 'package:e_commerce/features/presentation/view/home/widgets/auto_page_slider.dart';
import 'package:e_commerce/features/presentation/view/home/widgets/ingredients_grid.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BaseAppBar(),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: AutoPageSlider(),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'Exclusive Offer',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: IngredientsGrid(),
            ),
          ],
        ),
      ),
    );
  }
}
