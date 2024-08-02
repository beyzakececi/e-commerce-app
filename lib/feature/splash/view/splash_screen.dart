import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../product/constants/app_colors.dart';
import '../../../product/enums/app_png.dart';
import '../../../product/router/route_names.dart';
import '../../app/presentation/view/widgets/custom_image.dart';
import '../viewmodel/splash_viewmodel.dart';


class SplashScreen extends ConsumerStatefulWidget {
  const SplashScreen({super.key});

  @override
  ConsumerState createState() => _SplashViewState();
}

class _SplashViewState extends ConsumerState<SplashScreen> {
  late SplashViewModel splashViewModel;

  @override
  void initState() {
    super.initState();
    splashViewModel = ref.read(splashViewModelProvider.notifier);
    init();
  }

  init() async {
    await splashViewModel.getInitialScreen();
    Future.delayed(const Duration(seconds: 2)).then((_) {
      context.goNamed(AppRouteName.onbording.name);
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
              CustomImageWidget(
              image: AppPng.appLogo.toPng,
                width: MediaQuery.of(context).size.width * 0.15,
                height: MediaQuery.of(context).size.height * 0.15,
              ),
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
                  SizedBox(height: 4),
                  Text(
                    textAlign: TextAlign.start,
                    'online groceries',
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
}
