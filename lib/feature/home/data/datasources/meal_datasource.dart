import 'package:dio/dio.dart';

import '../../../../product/network/network_service.dart';

class MealDatasource {
  final NetworkService networkService;

  MealDatasource(this.networkService);

  Future<Response> fetchMealsByQuery(String query) async {
    final String url = '/filter.php?$query';

    final response = await networkService.getRequest(url);
    return response;
  }

  Future<Response> fetchMealById(String id) async {
    final String url = '/lookup.php?i=$id';

    final response = await networkService.getRequest(url);
    return response;
  }

  Future<Response> fetchMealsByFirstLetter(String letter) async {
    final String url = '/search.php?f=$letter';

    final response = await networkService.getRequest(url);
    return response;
  }

  Future<Response> fetchRandomMeal() async {
    const String url = '/random.php';

    final response = await networkService.getRequest(url);
    return response;
  }

  Future<Response> fetchMealsByName(String name) async {
    final String url = '/search.php?s=$name';

    final response = await networkService.getRequest(url);
    return response;
  }

  Future<Response> fetchMealsByCategory(String category) async {
    final url = '/filter.php?c=$category';
    return await networkService.getRequest(url);
  }

  Future<Response> fetchMealsByArea(String area) async {
    final url = '/filter.php?a=$area';
    return await networkService.getRequest(url);
  }


}