import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:e_commerce/feature/product_detail/domain/entities/meal_detail_entity.dart';
import 'package:e_commerce/feature/product_detail/domain/repositories/meal_detail_repository.dart';
import 'package:e_commerce/product/errors/failures.dart';
import 'package:flutter/foundation.dart';
import 'package:hive/hive.dart';
import '../datasources/meal_detail_datasource.dart';
import '../model/meal_detail_model.dart';

class MealDetailRepositoryImpl implements MealDetailRepository {
  final MealDetailDatasource datasource;
  final Box<MealDetailModel> mealBox;

  MealDetailRepositoryImpl(this.datasource, this.mealBox);

  @override
  Future<Either<Failure, MealDetailEntity>> getMealDetail(String id) async {
    try {
      final response = await datasource.fetchMealDetail(id);
      final meal = MealDetailModel.fromJson(
          response.data['meals'][0]);
      return Right(meal);
    } catch (e, s) {
      debugPrintStack(label: e.toString(), stackTrace: s);
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, void>> updateMealDetail(MealDetailEntity meal) async {
    try {
      await mealBox.put(meal.id, meal as MealDetailModel);
      return Right(null);
    } catch (e, s) {
      debugPrintStack(label: e.toString(), stackTrace: s);
      return Left(CacheFailure());
    }
  }

}
