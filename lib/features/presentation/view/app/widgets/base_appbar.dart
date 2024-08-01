import 'package:e_commerce/core/constants/app_assets.dart';
import 'package:e_commerce/core/constants/app_icons.dart';
import 'package:e_commerce/core/extensions/context_text_style.dart';
import 'package:e_commerce/core/extensions/string_extension.dart';
import 'package:e_commerce/features/presentation/view/app/widgets/image/custom_image_widget.dart';
import 'package:flutter/material.dart';
import '../../../../../core/constants/app_colors.dart';
import '../../../../../core/constants/app_constants.dart';
import '../../../widgets/search/search_bar.dart';

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
