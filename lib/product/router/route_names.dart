class RouteNames {
  static const splash = 'splash';
  static const onboard = 'onboard';
  static const homeScreen = 'homeScreen';
  static const mealDetail = 'mealDetail';
  static const explore = 'explore';
  ///category-meals
  static const categoryMeals = 'category-meals';
  static const search = 'search';
  static const myCart = 'myCart';
  static const orderAccepted = 'orderAccepted';
  static const favorites = 'favorites';
  static const account = 'account';


}
enum AppRouteName {
  splash('/','Splash'),
  onbording('/onboard','Onboard'),
  homeScreen('/homeScreen','HomeScreen'),
  mealDetail('/mealDetail','MealDetail'),
  explore('/explore','Explore'),
  categoryMeals('/category-meals','CategoryMeals'),
  search('/search','Search'),
  myCart('/myCart','MyCart'),
  orderAccepted('/orderAccepted','OrderAccepted'),
  favorites('/favorites','Favorites'),
  account('/account','Account')

  ;

  const AppRouteName(this.path,this.name);

  final String path;
  final String name;
}