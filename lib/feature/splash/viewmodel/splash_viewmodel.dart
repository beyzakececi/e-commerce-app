import 'package:flutter_riverpod/flutter_riverpod.dart';

class SplashViewModel extends StateNotifier<void> {
  SplashViewModel() : super(null);

  Future<void> getInitialScreen() async {
    // Simulating a network or database call
    await Future.delayed(const Duration(seconds: 3));
  }
}

final splashViewModelProvider =
StateNotifierProvider<SplashViewModel, void>((ref) => SplashViewModel());
