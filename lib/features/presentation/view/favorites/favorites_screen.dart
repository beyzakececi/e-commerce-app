import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/router/route_names.dart';
import '../../../data/models/meal_summary_model.dart';
import '../../../domain/entities/meal/meal.dart';

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
      body: ValueListenableBuilder(
        valueListenable: Hive.box<MealSummaryModel>('favorites').listenable(),
        builder: (context, Box<MealSummaryModel> box, _) {
          if (box.values.isEmpty) {
            return Center(
              child: Text('No favorite items.'),
            );
          }

          return Column(
            children: [
              Expanded(
                child: ListView.separated(
                  itemCount: box.length,
                  itemBuilder: (context, index) {
                    final favorite = box.getAt(index);
                    return ListTile(
                      leading: Image.network(favorite!.strMealThumb),
                      title: Text(favorite.strMeal),
                      subtitle: Text('325ml, Price'),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            '\$${favorite.price.toStringAsFixed(2)}',
                            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                          Icon(Icons.chevron_right),
                        ],
                      ),
                      onTap: () {
                        context.pushNamed(
                          AppRouteName.productDetail.name,

                        );
                      },
                    );
                  },
                  separatorBuilder: (context, index) => Divider(),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: _addAllToCart,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.splashScreenBackground,
                      padding: EdgeInsets.symmetric(vertical: 16.0),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                    ),
                    child: Text(
                      'Add All To Cart',
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  void _addAllToCart() {
    final box = Hive.box<MealSummaryModel>('favorites');
    final cartBox = Hive.box<MealSummaryModel>('cart'); // Sepet kutusu, eğer yoksa oluşturun
    for (int i = 0; i < box.length; i++) {
      final favorite = box.getAt(i);
      if (favorite != null) {
        cartBox.put(favorite.idMeal, favorite);
      }
    }
    // Başarılı ekleme işlemi sonrası bir bildirim gösterebilirsiniz.
  }
}
