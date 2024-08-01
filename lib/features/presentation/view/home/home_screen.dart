import 'package:e_commerce/core/extensions/context_padding.dart';
import 'package:e_commerce/core/extensions/context_size.dart';
import 'package:e_commerce/core/extensions/context_sizedbox.dart';
import 'package:e_commerce/features/data/models/product/product_model.dart';
import 'package:e_commerce/features/presentation/view/app/widgets/base_appbar.dart';
import 'package:e_commerce/features/presentation/view/home/widgets/auto_page_slider.dart';
import 'package:e_commerce/features/presentation/view/home/widgets/horizantal_product_cart.dart';
import 'package:e_commerce/features/presentation/view/home/widgets/vertical_product_cart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../viewmodel/product/product_viewmodel.dart';
import '../../viewmodel/product/product_viewmodel_imp.dart';
import '../../widgets/text/section_header_widget.dart';

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

    final List<ProductModel> staticProducts = [
      ProductModel(id: '1', title: 'Product 1', description: 'Description 1', price: '10.00'),
      ProductModel(id: '2', title: 'Product 2', description: 'Description 2', price: '20.00'),
      ProductModel(id: '3', title: 'Product 3', description: 'Description 3', price: '30.00'),
      // Add more products as needed
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
  CustomScrollView _buildBody(BuildContext context,  List<ProductModel> products) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(child: AutoPageSlider()),
        SliverToBoxAdapter(child: buildHorizontalList(context, products)),      ],
    );
  }

  /// Horizontal Product List recently added productsrecently added products
  Widget buildHorizontalList(BuildContext context, List<ProductModel> products) {
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
