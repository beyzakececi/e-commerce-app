import 'package:flutter/cupertino.dart';
import '../../../../core/constants/app_colors.dart';

class CustomCenteredProgressIndicator extends StatelessWidget {
  const CustomCenteredProgressIndicator({
    super.key,
    this.color,
  });
  final Color? color;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: CupertinoActivityIndicator(
        color: color ?? AppColors.whiteColor,
        radius: 14,
      ),
    );
  }}