import 'package:dartz/dartz.dart';
import '../../../../product/errors/failures.dart';
import '../../../../product/usecases/usecase.dart';
import '../entities/meal_detail_entity.dart';
import '../repositories/meal_detail_repository.dart';

class GetMealDetailUseCase implements UseCase<MealDetailEntity, String> {
  final MealDetailRepository repository;

  GetMealDetailUseCase(this.repository);

  @override
  Future<Either<Failure, MealDetailEntity>> call(String params) async {
    return await repository.getMealDetail(params);
  }
}

