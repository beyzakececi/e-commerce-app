import 'package:e_commerce/feature/app/presentation/view/widgets/search_bar.dart';
import 'package:e_commerce/product/extensions/string_extension.dart';
import 'package:flutter/material.dart';
import '../../../../../product/constants/app_assets.dart';
import '../../../../../product/constants/app_colors.dart';
import '../../../../../product/constants/app_icons.dart';
import 'custom_image.dart';

class BaseAppBar extends StatelessWidget implements PreferredSizeWidget {
  const BaseAppBar();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(height: 20),
          CustomImageWidget(
            image: AppAssets.appLogo.toPng,
            height: 30,
            color: Colors.orange,
          ),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                AppIcons.kLocationIcon,
                color: AppColors.blackColor,
                size: 15,
              ),
              SizedBox(width: 8),
              Text('Dhaka, Banassree', style: TextStyle(fontSize: 15, color: Colors.grey[800])),
            ],
          ),
          SizedBox(height: 10),
          SearchBarWidget(),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(150);
}
