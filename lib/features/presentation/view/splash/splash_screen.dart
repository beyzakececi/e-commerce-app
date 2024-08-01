import 'package:e_commerce/core/extensions/context_size.dart';
import 'package:e_commerce/core/extensions/string_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/constants/app_assets.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/router/route_names.dart';
import '../../viewmodel/splash/splash_viewmodel.dart';
import '../../viewmodel/splash/splash_viewmodel_imp.dart';
import '../app/widgets/image/custom_image_widget.dart';

// Provider tanımı
final splashViewModelProvider = Provider<SplashViewModel>((ref) {
  return SplashViewModelImp(); // Uygun implementasyonu buraya ekleyin
});

class SplashView extends ConsumerStatefulWidget {
  const SplashView({super.key});

  @override
  ConsumerState createState() => _SplashViewState();
}

class _SplashViewState extends ConsumerState<SplashView> {
  late SplashViewModel splashViewModel;

  @override
  void initState() {
    super.initState();
    splashViewModel = ref.read(splashViewModelProvider);
    init();
  }

  init() async {
    splashViewModel.getInitialScreen().then((value) {
      Future.delayed(const Duration(seconds: 2)).then((value) {
        context.goNamed(AppRouteName.onbording.name);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.splashScreenBackground,
      body: SafeArea(
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              _getAppLogo(context),
              SizedBox(width: 16), // Logo ve metin arasındaki boşluğu ayarlar
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    textAlign: TextAlign.start,
                    'nectar',
                    style: TextStyle(
                      letterSpacing: 6,
                      fontSize: 50,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Poppins',
                    ),
                  ),
                  //space is small
                  SizedBox(height: 0.001),
                  Text(
                    textAlign: TextAlign.start,
                    'online groceriet',
                    style: TextStyle(
                      letterSpacing: 4,
                      fontSize: 20,
                      color: Colors.white,
                      fontWeight: FontWeight.w300,
                      fontFamily: 'Poppins',
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _getAppLogo(BuildContext context) {
    return CustomImageWidget(
      image: AppAssets.appLogo.toPng,
      width: context.dynamicWidth(0.15),
      height: context.dynamicHeight(0.15),
    );
  }
}
