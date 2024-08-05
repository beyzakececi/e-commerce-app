import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';

import '../../../../product/errors/failures.dart';
import '../../../home/data/model/meal_model.dart';
import '../../domain/entities/meal_entity.dart';
import '../../domain/repositories/meal_repository.dart';
import '../datasources/meal_datasource.dart';

class MealRepositoryImpl implements MealRepository {
  final MealDatasource mealDatasource;

  MealRepositoryImpl(this.mealDatasource);

  @override
  Future<Either<Failure, List<MealModel>>> getMealsByQuery(String query) async {
    try {
      final response = await mealDatasource.fetchMealsByQuery(query);
      final meals = (response.data['meals'] as List)
          .map((meal) => MealModel.fromJson(meal))
          .toList();

      return Right(meals);
    } catch (e, s) {
      debugPrintStack(label: e.toString(), stackTrace: s);
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, MealModel>> getMealsById(String id) async {
    try {
      final response = await mealDatasource.fetchMealById(id);
      final meal = MealModel.fromJson(response.data['meals'][0]);

      return Right(meal);
    } catch (e, s) {
      debugPrintStack(label: e.toString(), stackTrace: s);
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, List<MealModel>>> listMealsByFirstLetter(
    String letter,
  ) async {
    try {
      final response = await mealDatasource.fetchMealsByFirstLetter(letter);

      if (response.data['meals'] == null) {
        return Left(EmptyResultFailure());
      }

      final meals = (response.data['meals'] as List)
          .map((meal) => MealModel.fromJson(meal))
          .toList();

      return Right(meals);
    } catch (e, s) {
      debugPrintStack(label: e.toString(), stackTrace: s);
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, MealModel>> lookupRandomMeal() async {
    try {
      final response = await mealDatasource.fetchRandomMeal();

      final meal = MealModel.fromJson(response.data['meals'][0]);

      return Right(meal);
    } catch (e, s) {
      debugPrintStack(label: e.toString(), stackTrace: s);
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, List<MealModel>>> searchMealsByName(
    String name,
  ) async {
    try {
      final response = await mealDatasource.fetchMealsByName(name);

      if (response.data['meals'] == null) {
        return Left(EmptyResultFailure());
      }

      final meals = (response.data['meals'] as List)
          .map((meal) => MealModel.fromJson(meal))
          .toList();

      return Right(meals);
    } catch (e, s) {
      debugPrintStack(label: e.toString(), stackTrace: s);
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, List<MealEntity>>> getMealsByCategory(
      String category) async {
    try {
      final response = await mealDatasource.fetchMealsByCategory(category);
      final meals = (response.data['meals'] as List)
          .map((meal) => MealModel.fromJson(meal))
          .toList();
      return Right(meals);
    } catch (e) {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, List<MealEntity>>> getMealsByArea(String area) async {
    try {
      final response = await mealDatasource.fetchMealsByArea(area);
      final meals = (response.data['meals'] as List)
          .map((meal) => MealModel.fromJson(meal))
          .toList();
      return Right(meals);
    } catch (e) {
      return Left(ServerFailure());
    }
  }
}
