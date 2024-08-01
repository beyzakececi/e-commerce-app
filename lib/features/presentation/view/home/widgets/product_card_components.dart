import 'package:e_commerce/core/extensions/context_padding.dart';
import 'package:e_commerce/core/extensions/context_size.dart';
import 'package:e_commerce/core/extensions/context_text_style.dart';
import 'package:flutter/material.dart';
import '../../../../../core/constants/app_colors.dart';
import '../../../../../core/constants/app_icons.dart';

mixin ProductCardComponents {
  Widget buildRatingBadge(BuildContext context, String price) {
    return Row(
      children: [
        Text(
          '$price',
          style: context.textStyles.bodySmall.copyWith(color: AppColors.blackDark),
        ),
      ],
    );
  }

  /// Item Add Icon
  Widget buildAddIcon(BuildContext context) {
    return Container(
      padding: context.paddings.allMin,
      decoration: BoxDecoration(
        color: AppColors.greenColor, // Use green color for the button
        shape: BoxShape.circle,
      ),
      child: Icon(AppIcons.kAddCircleIcon, color: AppColors.whiteColor, size: context.dynamicWidth(.06)),
    );
  }

  /// Item Title & Description
  Widget buildItemDetails({
    required BuildContext context,
    required String title,
    required String description,
    required String price,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: context.textStyles.titleMedium.copyWith(fontWeight: FontWeight.w600)),
        Text(
          description,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          style: context.textStyles.titleSmall.copyWith(
            color: AppColors.blackDark.withOpacity(.5),
          ),
        ),
        buildRatingBadge(context, price),
      ],
    );
  }

  /// Product Card Widget
  Widget buildProductCard({
    required BuildContext context,
    required String title,
    required String description,
    required String price,
    required Widget image,
  }) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        // Card content
        Container(
          height: context.dynamicHeight(.001), // Adjust card height
          padding: EdgeInsets.all(context.dynamicWidth(.02)), // Adjust padding
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8.0),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                spreadRadius: 1,
                blurRadius: 5,
                offset: Offset(0, 3),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Adjust image size
              SizedBox(
                width: double.infinity,
                height: context.dynamicHeight(.12), // Reduced image height
                child: image,
              ),
              SizedBox(height: context.dynamicHeight(.01)), // Adjust spacing
              buildItemDetails(
                context: context,
                title: title,
                description: description,
                price: price,
              ),
            ],
          ),
        ),
        // Add button positioned at the bottom-right
        Positioned(
          bottom: context.dynamicHeight(.02), // Adjust the distance from the bottom
          right: context.dynamicWidth(.02), // Adjust the distance from the right
          child: buildAddIcon(context),
        ),
      ],
    );
  }
}
