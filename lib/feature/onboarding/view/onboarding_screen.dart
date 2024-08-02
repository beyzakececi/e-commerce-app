import 'package:e_commerce/product/enums/app_png.dart';
import 'package:e_commerce/product/extensions/string_extension.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../product/constants/app_colors.dart';
import '../../../product/router/route_names.dart';
import '../../app/presentation/view/widgets/custom_image.dart';

class OnboardScreen extends StatelessWidget {
  const OnboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: CustomImageWidget(
              image: AppPng.img.toPng,
              fit: BoxFit.cover,
            ),
          ),
          Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(height: 350),
                Container(
                  margin: const EdgeInsets.only(bottom: 20),
                  child: CustomImageWidget(
                    image: AppPng.appLogo.toPng,
                    height: 60,
                  ),
                ),
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
                        fontSize: 50,
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
                Container(
                  width: 350,
                  height: 70,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor: AppColors.splashScreenBackground,
                      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
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
