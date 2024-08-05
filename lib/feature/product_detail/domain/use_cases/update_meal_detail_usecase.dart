import 'package:dartz/dartz.dart';
import '../../../../product/errors/failures.dart';
import '../../../../product/usecases/usecase.dart';
import '../entities/meal_detail_entity.dart';
import '../repositories/meal_detail_repository.dart';

class UpdateMealDetailUseCase implements UseCase<void, MealDetailEntity> {
  final MealDetailRepository repository;

  UpdateMealDetailUseCase(this.repository);

  @override
  Future<Either<Failure, void>> call(MealDetailEntity params) async {
    return await repository.updateMealDetail(params);
  }
}
