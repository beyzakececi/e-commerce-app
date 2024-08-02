
import 'package:e_commerce/feature/explore/domain/entities/meal_summary.dart';
import 'package:e_commerce/feature/home/presentation/view/widgets/product_card_components.dart';
import 'package:e_commerce/product/extensions/context_borders.dart';
import 'package:e_commerce/product/extensions/context_padding.dart';
import 'package:e_commerce/product/extensions/context_size.dart';
import 'package:e_commerce/product/extensions/context_sizedbox.dart';
import 'package:flutter/material.dart';

import '../../../../../product/enums/app_png.dart';
import '../../../../app/presentation/view/widgets/custom_image.dart';
import '../../../../explore/domain/entities/product_entity.dart';


class VerticalProductCard extends StatefulWidget {
  const VerticalProductCard({
    super.key,
    required this.product,
  });

  final MealSummary product;

  @override
  State<VerticalProductCard> createState() => _VerticalProductCardState();
}

class _VerticalProductCardState extends State<VerticalProductCard> with ProductCardComponents {
  @override
  Widget build(BuildContext context) {
    var data = widget.product;
    return Card(
      margin: context.paddings.zero,
      elevation: 4.0, // Optional: Add some elevation to make the card stand out
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0), // Optional: Add some rounded corners to the card
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.vertical(top: context.borders.radiusNormal),
            child: CustomImageWidget(
              image: AppPng.product.toPng,
              width: context.dynamicWidth(.1),
              height: context.dynamicHeight(.15),
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: context.paddings.allNormal,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                context.sizedBoxHeightLow,
                buildItemDetails(
                  context: context,
                  title: data.strMeal,
                  description: '7 pieces, Priceg',
                  price: '4.99',
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              bottom: context.dynamicHeight(.02),
              right: context.dynamicWidth(.02),
            ),
            child: Align(
              alignment: Alignment.bottomRight,
              child: buildAddIcon(context),
            ),
          ),
        ],
      ),
    );
  }
}
