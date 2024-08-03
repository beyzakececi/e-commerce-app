import 'package:flutter/material.dart';
import 'package:e_commerce/feature/app/presentation/view/widgets/bottom_navbar.dart';

class App extends StatefulWidget {
  const App({super.key, required this.child});

  final Widget child;

  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: widget.child,
      bottomNavigationBar: const BottomNavBar(),
    );
  }
}
