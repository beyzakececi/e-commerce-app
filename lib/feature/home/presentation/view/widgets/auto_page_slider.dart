import 'package:carousel_slider/carousel_slider.dart';
import 'package:e_commerce/product/extensions/context_borders.dart';
import 'package:e_commerce/product/extensions/context_padding.dart';
import 'package:e_commerce/product/extensions/context_size.dart';

import 'package:flutter/material.dart';

import '../../../../../product/enums/app_png.dart';
import '../../../../app/presentation/view/widgets/custom_image.dart';

class AutoPageSlider extends StatefulWidget {
  AutoPageSlider({super.key});

  @override
  _AutoPageSliderState createState() => _AutoPageSliderState();
}

class _AutoPageSliderState extends State<AutoPageSlider> {
  final List<String> _items = [
    AppPng.img2.toPng,
    AppPng.img_1.toPng,
    AppPng.img_2.toPng,
  ];

  int _currentIndex = 0;
  final CarouselController _controller = CarouselController();

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        CarouselSlider.builder(
          carouselController: _controller,
          itemCount: _items.length,
          itemBuilder: (context, index, realIndex) {
            return Padding(
              padding: context.paddings.allNormal + context.paddings.onlyTopLow,
              child: ClipRRect(
                borderRadius: context.borders.circularBorderRadiusLow,
                child: CustomImageWidget(
                  width: context.dynamicWidth(1),
                  image: _items[index],
                  fit: BoxFit.cover,
                ),
              ),
            );
          },
          options: CarouselOptions(
            autoPlay: true,
            enlargeCenterPage: true,
            aspectRatio: 2 / 1,
            viewportFraction: 1,
            onPageChanged: (index, reason) {
              setState(() {
                _currentIndex = index;
              });
            },
          ),
        ),
        Positioned(
          bottom: 16,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: _items.asMap().entries.map((entry) {
              return GestureDetector(
                onTap: () => _controller.animateToPage(entry.key),
                child: Container(
                  width: 8.0,
                  height: 8.0,
                  margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: (Theme.of(context).brightness == Brightness.dark
                        ? Colors.white
                        : Colors.black)
                        .withOpacity(_currentIndex == entry.key ? 0.9 : 0.4),
                  ),
                ),
              );
            }).toList(),
          ),
        ),
      ],
    );
  }
}
