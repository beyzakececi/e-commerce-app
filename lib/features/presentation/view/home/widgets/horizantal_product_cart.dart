import 'package:e_commerce/core/extensions/context_borders.dart';
import 'package:e_commerce/core/extensions/context_padding.dart';
import 'package:e_commerce/core/extensions/context_size.dart';
import 'package:e_commerce/core/extensions/context_sizedbox.dart';
import 'package:e_commerce/features/presentation/view/home/widgets/product_card_components.dart';
import 'package:flutter/material.dart';

import '../../../../../core/constants/app_colors.dart';
import '../../../../../core/enums/app_png.dart';
import '../../app/widgets/image/custom_image_widget.dart';

class HorizontalProductCart extends StatefulWidget {
  const HorizontalProductCart({super.key});

  @override
  State<HorizontalProductCart> createState() => _HorizontalProductCartState();
}

class _HorizontalProductCartState extends State<HorizontalProductCart> with ProductCardComponents{
  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppColors.whiteColor,
      margin: context.paddings.zero,
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.only(
              topLeft: context.borders.radiusNormal,
              bottomLeft: context.borders.radiusNormal,
            ),
            child: Stack(
              children: [
                CustomImageWidget(
                  image: AppPng.appLogo.toPng,
                  fit: BoxFit.cover,
                  width: context.dynamicWidth(.35),
                  height: context.dynamicHeight(.17),
                ),

              ],
            ),
          ),
          Expanded(
            child: Padding(
              padding: context.paddings.allNormal,
              child: Column(
                children: [
                  context.sizedBoxHeightLow,
                  buildItemDetails(
                    context: context,
                    title: 'Organic Bananas',
                    description: '7 pieces, Priceg',
                    price: '4.99',
                  ),
                  Divider(color: AppColors.electricViolet.withOpacity(.1)),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}