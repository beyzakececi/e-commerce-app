class RouteNames {
  static const splash = 'splash';
  static const onboard = 'onboard';
  static const homeScreen = 'homeScreen';
  static const productDetail = 'productDetail';
  static const explore = 'explore';
  static const beverages = 'beverages';
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
  productDetail('/productDetail','ProductDetail'),
  explore('/explore','Explore'),
  beverages('/beverages','Beverages'),
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