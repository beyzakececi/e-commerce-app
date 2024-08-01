
import '../../../core/usecases/base_usecase.dart';
import '../repostories/splash_repository.dart';

class ParamsForAny{
  ParamsForAny();
}

/// -- GET INITIAL SCREEN --
class GetInitialScreen extends BaseUseCase<Future<bool?>, ParamsForAny> {
  final SplashRepository splashRepository;

  GetInitialScreen({required this.splashRepository});

  @override
  Future<bool?> execute(ParamsForAny params) async {
    return await splashRepository.getInitialScreen();
  }

}

/// -- SET INITIAL SCREEN --
class SetInitialScreen extends BaseUseCase<Future<void>, ParamsForAny> {
  final SplashRepository splashRepository;

  SetInitialScreen({required this.splashRepository});

  @override
  Future<void> execute(ParamsForAny params) async {
    await splashRepository.setInitialScreen();
  }
}