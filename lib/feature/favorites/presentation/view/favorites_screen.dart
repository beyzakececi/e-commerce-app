import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

import '../../../../product/constants/app_colors.dart';
import '../../../../product/di/injector.dart';
import '../bloc/favorite_bloc.dart';
import '../bloc/favorite_event.dart';
import '../bloc/favorite_state.dart';

class FavoritePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<FavoriteBloc>()..add(LoadFavorites()),
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Favorite',
            style: TextStyle(color: Colors.black),
          ),
          backgroundColor: Colors.white,
          elevation: 0,
          centerTitle: true,
        ),
        body: Column(
          children: [
            Expanded(
              child: BlocBuilder<FavoriteBloc, FavoriteState>(
                builder: (context, state) {
                  if (state is FavoriteLoading) {
                    return Center(child: CircularProgressIndicator());
                  } else if (state is FavoriteLoaded) {
                    return ListView.separated(
                      itemCount: state.favorites.length,
                      separatorBuilder: (context, index) => Divider(
                        color: Colors.grey,
                        thickness: 1,
                        indent: 16,
                        endIndent: 16,
                      ),
                      itemBuilder: (context, index) {
                        final meal = state.favorites[index];
                        return ListTile(
                          leading: Image.network(meal.thumbnail ?? '', width: 50, height: 50),
                          title: Text(
                            meal.name ?? '',
                            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                          subtitle: Text('1kg, Price'),
                          trailing: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                '\$10.00',
                                style: TextStyle(fontSize: 18, fontWeight: FontWeight.normal),
                              ),
                              IconButton(
                                icon: Icon(Icons.arrow_forward_ios, size: 16),
                                onPressed: () {
                                  // Handle navigation or other actions here
                                },
                              ),
                            ],
                          ),
                        );
                      },
                    );
                  } else if (state is FavoriteError) {
                    return Center(child: Text(state.message));
                  }
                  return Container();
                },
              ),
            ),
            BlocBuilder<FavoriteBloc, FavoriteState>(
              builder: (context, state) {
                if (state is FavoriteLoaded) {
                  return Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: ElevatedButton(
                      onPressed: () {
                        context.read<FavoriteBloc>().add(AddAllToCart());
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.splashScreenBackground,
                        padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 140.0),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                      ),
                      child: Text(
                        'Add All To Cart',
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      ),
                    ),
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
