import 'package:e_commerce/features/presentation/view/explore/widgets/category_tile.dart';
import 'package:flutter/material.dart';
import '../../../data/repositories/category_repository_imp.dart';
import '../../../domain/entities/category/category.dart';
import '../../../domain/repostories/category_repository.dart';
import '../../widgets/search/search_bar.dart';
import '../category_meals/category_meals_screen.dart';

class ExplorePage extends StatelessWidget {
  final CategoryRepository categoryRepository = CategoryRepositoryImpl();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(120),
        child: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          flexibleSpace: SafeArea(
            child: Padding(
              padding: const EdgeInsets.only(top: 5.0, left: 16.0, right: 16.0, bottom: 10.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Find Meals by Category',
                    style: TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10),
                  SearchBarWidget(),
                ],
              ),
            ),
          ),
        ),
      ),
      body: FutureBuilder<List<Category>>(
        future: categoryRepository.getCategories(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error loading categories'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text('No categories found'));
          } else {
            return GridView.builder(
              padding: EdgeInsets.all(10),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
              ),
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => CategoryMealsScreen(category: snapshot.data![index].strCategory),
                      ),
                    );
                  },
                  child: CategoryTile(category: snapshot.data![index], index: index),
                );
              },
            );
          }
        },
      ),
    );
  }
}
