import 'package:e_commerce/core/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/router/route_names.dart';
import '../../viewmodel/splash/splash_viewmodel.dart';
import '../../viewmodel/splash/splash_viewmodel_imp.dart';

class OnboardView extends ConsumerStatefulWidget {
  const OnboardView({super.key});

  @override
  ConsumerState createState() => _OnboardViewState();
}

class _OnboardViewState extends ConsumerState<OnboardView> {
  late SplashViewModel splashViewModel;

  @override
  void initState() {
    // splashViewModel = ref.read(SplashViewModelImp as ProviderListenable<SplashViewModel>);
    // splashViewModel.setInitialScreen();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // splashViewModel = ref.watch(SplashViewModelImp as ProviderListenable<SplashViewModel>);
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              'assets/images/png/img.png',
              fit: BoxFit.cover,
            ),
          ),
          Center(
            child: Column(
              mainAxisSize: MainAxisSize.min, // Minimize the vertical space
              children: [
                SizedBox(height: 350), // Space between top and logo (optional
                // Logo Widget
                Container(
                  margin: const EdgeInsets.only(bottom: 20), // Space between logo and text
                  child: Image.asset(
                    'assets/images/png/app-logo.png', // Replace with your logo asset path
                    height: 60, // Adjust the height as needed
                  ),
                ),
                // Welcome Text
                Column(
                  children: [
                    Text(
                      'Welcome',
                      style: TextStyle(
                        fontSize: 50,
                        color: Colors.white,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                    SizedBox(height: 0),
                    Text(
                      'to our store',
                      style: TextStyle(
                        fontSize: 50, // Adjust the font size as needed
                        color: Colors.white,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10),
                Text(
                  'Get your groceries in as fast as one hour',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 35),
                // Elevated Button
                Container(
                  width: 350,
                  // Adjust the width as needed
                  height: 70,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white, // Text color
                      backgroundColor: AppColors.splashScreenBackground,
                      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15), // Adjust the radius as needed
                      ),
                    ),
                    onPressed: () {
                      context.goNamed(AppRouteName.homeScreen.name);
                    },
                    child: Text(
                      'Get Started',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ),
                ),

              ],
            ),
          ),
        ],
      ),
    );
  }
}
