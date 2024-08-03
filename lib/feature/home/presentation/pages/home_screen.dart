import 'package:e_commerce/feature/home/presentation/pages/widgets/auto_page_slider.dart';
import 'package:e_commerce/product/extensions/context_padding.dart';
import 'package:e_commerce/product/extensions/context_size.dart';
import 'package:e_commerce/product/extensions/context_sizedbox.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../app/presentation/view/widgets/base_appbar.dart';
import '../../../app/presentation/view/widgets/section_header.dart';

class HomeView extends StatefulWidget  {
  const HomeView({super.key});

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {


  var currentPageIndex = 0;

  @override
  void initState() {
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: BaseAppBar(),
      ),
    );
  }

}
