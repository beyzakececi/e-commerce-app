
import 'package:e_commerce/feature/home/presentation/view/widgets/auto_page_slider.dart';
import 'package:e_commerce/feature/home/presentation/view/widgets/vertical_product_cart.dart';
import 'package:e_commerce/feature/product_detail/data/model/meal_summary_model.dart';

import 'package:e_commerce/product/extensions/context_padding.dart';
import 'package:e_commerce/product/extensions/context_size.dart';
import 'package:e_commerce/product/extensions/context_sizedbox.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../app/presentation/view/widgets/base_appbar.dart';
import '../../../app/presentation/view/widgets/section_header.dart';

class HomeView extends StatefulWidget  {
  const HomeView({super.key});

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView>{


  var currentPageIndex = 0;

  @override
  void initState() {
    super.initState();

  }


  @override
  Widget build(BuildContext context) {

    final List<MealSummaryModel> staticProducts = [
      MealSummaryModel(idMeal: "1", strMeal: "", strMealThumb: ""),
      MealSummaryModel(idMeal: "2", strMeal: "", strMealThumb: ""),

    ];

    return SafeArea(
      child: Scaffold(
        appBar:  BaseAppBar(),
        body: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) {
            return [];
          },
          body: _buildBody(context,staticProducts),
        )
      ),
    );
  }

  /// Body
  CustomScrollView _buildBody(BuildContext context,  List<MealSummaryModel> products) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(child: AutoPageSlider()),
        SliverToBoxAdapter(child: buildHorizontalList(context, products)),      ],
    );
  }

  /// Horizontal Product List recently added productsrecently added products
  Widget buildHorizontalList(BuildContext context, List<MealSummaryModel> products) {
    return Column(
      children: [
        const SectionHeaderWidget(title: 'Exclusive Offer'),
        SizedBox(
          height: context.dynamicHeight(.42),
          child: ListView.separated(
            itemCount: products.length,
            scrollDirection: Axis.horizontal,
            separatorBuilder: (context, index) => context.sizedBoxWidthMedium,
            padding: context.paddings.horizontalMedium + context.paddings.verticalMedium,
            itemBuilder: (context, index) {
              var product = products[index];
              return SizedBox(
                width: context.dynamicWidth(.45),
                child: VerticalProductCard(
                  product: product,
                  // Provide any additional parameters as needed
                ),
              );
            },
          ),
        ),
        const SectionHeaderWidget(title: 'Best Selling'),
        SizedBox(
          height: context.dynamicHeight(.42),
          child: ListView.separated(
            itemCount: products.length,
            scrollDirection: Axis.horizontal,
            separatorBuilder: (context, index) => context.sizedBoxWidthMedium,
            padding: context.paddings.horizontalMedium + context.paddings.verticalMedium,
            itemBuilder: (context, index) {
              var product = products[index];
              return SizedBox(
                width: context.dynamicWidth(.45),
                child: VerticalProductCard(
                  product: product,
                  // Provide any additional parameters as needed
                ),
              );
            },
          ),
        ),

      ],
    );
  }
  }
