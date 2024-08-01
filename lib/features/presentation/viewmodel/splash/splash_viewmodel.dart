import 'package:flutter/cupertino.dart';

import '../../../../core/api/api_response.dart';

abstract class SplashViewModel with ChangeNotifier {
  ApiResponse<bool> get getInitialScreenResponse;
  ApiResponse<void> get setInitialScreenResponse;

  set getInitialScreenResponse(ApiResponse<bool> value);
  set setInitialScreenResponse(ApiResponse<void> value);

  Future<void> getInitialScreen();

  Future<void> setInitialScreen();
}