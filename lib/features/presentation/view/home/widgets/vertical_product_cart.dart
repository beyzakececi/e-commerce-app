import 'package:e_commerce/core/extensions/context_borders.dart';
import 'package:e_commerce/core/extensions/context_padding.dart';
import 'package:e_commerce/core/extensions/context_size.dart';
import 'package:e_commerce/core/extensions/context_sizedbox.dart';
import 'package:e_commerce/features/presentation/view/home/widgets/product_card_components.dart';
import 'package:flutter/material.dart';

import '../../../../../core/constants/app_colors.dart';
import '../../../../../core/enums/app_png.dart';
import '../../../../domain/entities/product/product_entity.dart';
import '../../app/widgets/image/custom_image_widget.dart';

class VerticalProductCard extends StatefulWidget {
  const VerticalProductCard({
    super.key,
    required this.product,
  });

  final ProductEntity product;

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
                  title: data.title!,
                  description: data.description!,
                  price: data.price!,
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
