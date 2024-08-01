import 'package:e_commerce/core/extensions/context_padding.dart';
import 'package:e_commerce/core/extensions/context_size.dart';
import 'package:e_commerce/core/extensions/string_extension.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';

import '../../../../../core/constants/app_assets.dart';
import '../../../../../core/constants/app_colors.dart';
import '../../../../data/models/on_board_model.dart';
import '../../../viewmodel/splash/splash_viewmodel.dart';
import '../../app/widgets/image/custom_image_widget.dart';

class OnboardWidget extends ConsumerStatefulWidget {
  const OnboardWidget({
    required this.onBoardingModel,
    required this.splashViewModel,
  });

  final OnBoardingModel onBoardingModel;
  final SplashViewModel splashViewModel;

  @override
  ConsumerState createState() => _OnboardWidgetState();
}

class _OnboardWidgetState extends ConsumerState<OnboardWidget> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 80),
          child: CustomImageWidget(
            image: widget.onBoardingModel.img,
            height: context.dynamicHeight(.6),
            fit: BoxFit.cover,
          ),
        ),
        Padding(
          padding: context.paddings.onlyBottomUltra,
          child: Center(
            child: CustomImageWidget(
              image: AppAssets.appLogo.toPng,
              color: AppColors.electricViolet,
              width: context.dynamicWidth(.85),
            ),
          ),
        ),
        // Onboard Bottom Widget
      ],
    );
  }
}
