import 'package:e_commerce/feature/app/presentation/view/widgets/bottom_navbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class App extends ConsumerStatefulWidget {
  const App({super.key, required this.child});

  final Widget child;


  @override
  ConsumerState createState() => _AppState();
}

class _AppState extends ConsumerState<App> {

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: widget.child,
      bottomNavigationBar: const BottomNavBar(),
    );
  }

}
