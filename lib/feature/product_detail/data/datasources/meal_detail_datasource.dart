import 'package:dio/dio.dart';
import '../../../../product/network/network_service.dart';

class MealDetailDatasource {
  final NetworkService networkService;

  MealDetailDatasource(this.networkService);

  Future<Response> fetchMealDetail(String id) async {
    final url = '/lookup.php?i=$id';
    return await networkService.getRequest(url);
  }
}
