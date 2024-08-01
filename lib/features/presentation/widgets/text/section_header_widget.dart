import 'package:e_commerce/core/extensions/context_padding.dart';
import 'package:e_commerce/core/extensions/context_text_style.dart';
import 'package:flutter/material.dart';

import '../../../../core/constants/app_colors.dart';

class SectionHeaderWidget extends StatelessWidget {
  const SectionHeaderWidget({
    super.key,
    required this.title,
    this.actionText,
    this.action,
  });

  final String title;
  final String? actionText;
  final VoidCallback? action;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: context.paddings.horizontalMedium + context.paddings.onlyTopNormal,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: context.textStyles.titleLarge.copyWith(fontWeight: FontWeight.w600),
              ),
              InkWell(
                onTap: action,
                splashFactory: NoSplash.splashFactory,
                highlightColor: AppColors.transparentColor,
                child: Text(
                  actionText ?? 'See all',
                  style: context.textStyles.titleSmall.copyWith(
                    fontWeight: FontWeight.w600,
                    color: AppColors.electricViolet,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}