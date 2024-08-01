import 'package:e_commerce/features/presentation/viewmodel/splash/splash_viewmodel.dart';
import 'package:flutter/cupertino.dart';

import '../../../../core/api/api_response.dart';
import '../../../../di/injection_container.dart';
import '../../../domain/usecases/splash_usecase.dart';

class SplashViewModelImp extends ChangeNotifier implements SplashViewModel {
  ApiResponse<bool> _getInitialScreenResponse = ApiResponse.loading('loading');
  ApiResponse<void> _setInitialScreenResponse = ApiResponse.loading('loading');

  @override
  ApiResponse<bool> get getInitialScreenResponse => _getInitialScreenResponse;

  @override
  ApiResponse<void> get setInitialScreenResponse => _setInitialScreenResponse;

  @override
  set getInitialScreenResponse(ApiResponse<bool> value) {
    _getInitialScreenResponse = value;
    notifyListeners();
  }

  @override
  set setInitialScreenResponse(ApiResponse<void> value) {
    _setInitialScreenResponse = value;
    notifyListeners();
  }

  @override
  Future<void> getInitialScreen() async {
    try {
      bool? initialScreen = await injector<GetInitialScreen>().execute(ParamsForAny());
      getInitialScreenResponse = ApiResponse.completed(initialScreen ?? false);
    } catch (e, stackTrace) {
      //getInitialScreenResponse = ApiResponse.error(e, stackTrace);
    }
  }
  @override
  Future<void> setInitialScreen() async {
    try {
      await injector<SetInitialScreen>().execute(ParamsForAny());
      setInitialScreenResponse = ApiResponse.completed(true);
    } catch (e, stackTrace) {
      //setInitialScreenResponse = ApiResponse.error(e, stackTrace);
    }
  }
}