import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';

import 'hive_keys.dart';

class HiveDatabase {

  /*
  static Future<void> init() async {
    final appDocumentDir = await getApplicationDocumentsDirectory();
    Hive.init(appDocumentDir.path);
    //Hive.registerAdapter(MealSummaryModelAdapter());
    //await Hive.openBox<MealSummaryModel>(HiveKeys.favoritesBox);
    // Diğer kutuları burada açın
  }

  static Future<void> addFavorite(MealSummaryModel favorite) async {
    final box = Hive.box<MealSummaryModel>(HiveKeys.favoritesBox);
    await box.put(favorite.idMeal, favorite);
  }

  static List<MealSummaryModel> getFavorites() {
    final box = Hive.box<MealSummaryModel>(HiveKeys.favoritesBox);
    return box.values.toList();
  }

  static Future<void> deleteFavorite(String idMeal) async {
    final box = Hive.box<MealSummaryModel>(HiveKeys.favoritesBox);
    await box.delete(idMeal);
  }

   */

}
