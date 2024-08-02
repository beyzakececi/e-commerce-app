/// -- PNG --
enum AppPng {
  appLogo('app-logo'),
  img('img'),
  img2('img2'),
  product('product'),
  orderaccepted('order_accepted'),
  account('account'),
  error('error'),
  img_1('img_1'),
  img_2('img_2'),
  ;

  final String value;

  const AppPng(this.value);

  String get toPng => 'assets/images/png/$value.png';
}