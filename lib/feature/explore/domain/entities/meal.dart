class Meal {
  final String idMeal;
  final String strMeal;
  final String strDrinkAlternate;
  final String strCategory;
  final String strArea;
  final String strInstructions;
  final String strMealThumb;
  final String strTags;
  final String strYoutube;
  final String strIngredient1;
  final String strIngredient2;
  final String strIngredient3;
  // Add up to strIngredient20
  final String strMeasure1;
  final String strMeasure2;
  final String strMeasure3;
  // Add up to strMeasure20
  final String strSource;
  final String strImageSource;
  final String strCreativeCommonsConfirmed;
  final String dateModified;

  Meal({
    required this.idMeal,
    required this.strMeal,
    this.strDrinkAlternate = '',
    required this.strCategory,
    required this.strArea,
    required this.strInstructions,
    required this.strMealThumb,
    this.strTags = '',
    required this.strYoutube,
    this.strIngredient1 = '',
    this.strIngredient2 = '',
    this.strIngredient3 = '',
    // Add up to strIngredient20
    this.strMeasure1 = '',
    this.strMeasure2 = '',
    this.strMeasure3 = '',
    // Add up to strMeasure20
    this.strSource = '',
    this.strImageSource = '',
    this.strCreativeCommonsConfirmed = '',
    this.dateModified = '',
  });
}
