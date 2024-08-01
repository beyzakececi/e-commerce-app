
import 'package:e_commerce/core/extensions/string_extension.dart';

import '../../../core/constants/app_assets.dart';

class OnBoardingModel {
  final String title;
  final String subTitle;
  final String desc;
  final String img;

  OnBoardingModel({
    required this.title,
    required this.subTitle,
    required this.desc,
    required this.img,
  });
}

class OnBoardingItems {
  late final List<OnBoardingModel> onBoarditems;

  OnBoardingItems() {
    onBoarditems = [
      OnBoardingModel(
        img: AppAssets.appLogo.toPng,
        title: 'title',
        subTitle: 'subTitle',
        desc: 'desc',
      ),
    ];
  }
}

class LocaleKeys {
}