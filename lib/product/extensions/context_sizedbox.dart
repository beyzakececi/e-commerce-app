import 'package:flutter/material.dart';

import '../enums/app_size.dart';

/// Uygulamada kullanilan SizedBox Widgeti her defasinde elle degerler girmek yerine
/// sabit degelerler ile tanimlanarak extension ile context uzerinden erisilebilir hale getirildi
extension CustomSizedBoxExtension on BuildContext {
  /// -- WIDTH --
  SizedBox get sizedBoxWidthMin => SizedBox(width: AppSizes.low.value);
  SizedBox get sizedBoxWidthLow => SizedBox(width: AppSizes.low.value);
  SizedBox get sizedBoxWidthNormal => SizedBox(width: AppSizes.low.value);
  SizedBox get sizedBoxWidthMedium => SizedBox(width: AppSizes.medium.value);
  SizedBox get sizedBoxWidthHigh => SizedBox(width: AppSizes.medium.value);
  SizedBox get sizedBoxWidthUltra => SizedBox(width: AppSizes.medium.value);

  /// -- HEIGHT --
  SizedBox get sizedBoxHeightMin => SizedBox(height: AppSizes.low.value);
  SizedBox get sizedBoxHeightLow => SizedBox(height: AppSizes.low.value);
  SizedBox get sizedBoxHeightNormal => SizedBox(height: AppSizes.low.value);
  SizedBox get sizedBoxHeightMedium => SizedBox(height: AppSizes.medium.value);
  SizedBox get sizedBoxHeightHigh => SizedBox(height: AppSizes.medium.value);
  SizedBox get sizedBoxHeightUltra => SizedBox(height: AppSizes.medium.value);
  SizedBox get sizedBoxHeightCustom => SizedBox(height: AppSizes.high.value);
  SizedBox get sizedBoxShrink => const SizedBox.shrink();
}