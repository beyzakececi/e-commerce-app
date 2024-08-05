import 'package:e_commerce/feature/home/presentation/pages/widgets/auto_page_slider.dart';
import 'package:e_commerce/feature/home/presentation/pages/widgets/horizantal_product_cart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../app/presentation/view/widgets/base_appbar.dart';

import '../bloc/meals_bloc.dart';


class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  void initState() {
    super.initState();
    context.read<MealsBloc>().add(LookupRandomMeal());
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: BaseAppBar(),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AutoPageSlider(),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Exclusive Offer', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
                    TextButton(
                      onPressed: () {},
                      child: Text('See all', style: TextStyle(color: Colors.green)),
                    ),
                  ],
                ),
              ),
              BlocBuilder<MealsBloc, MealsState>(
                builder: (context, state) {
                  if (state is MealsLoading) {
                    return Center(child: CircularProgressIndicator());
                  } else if (state is MealsLoaded) {
                    return SizedBox(
                      height: 250, // Adjust height to avoid overflow
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: state.meals.length,
                        itemBuilder: (context, index) {
                          final meal = state.meals[index];
                          return HorizontalProductCart(meal: meal);
                        },
                      ),
                    );
                  } else if (state is MealsError) {
                    return Center(child: Text(state.message));
                  }
                  return Container();
                },
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Best Selling', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
                    TextButton(
                      onPressed: () {},
                      child: Text('See all', style: TextStyle(color: Colors.green)),
                    ),
                  ],
                ),
              ),
              BlocBuilder<MealsBloc, MealsState>(
                builder: (context, state) {
                  if (state is MealsLoading) {
                    return Center(child: CircularProgressIndicator());
                  } else if (state is MealsLoaded) {
                    return SizedBox(
                      height: 250, // Adjust height to avoid overflow
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: state.meals.length,
                        itemBuilder: (context, index) {
                          final meal = state.meals[index];
                          return HorizontalProductCart(meal: meal);
                        },
                      ),
                    );
                  } else if (state is MealsError) {
                    return Center(child: Text(state.message));
                  }
                  return Container();
                },
              ),

            ],
          ),
        ),
      ),
    );
  }
}
