/// -- TO SVG EXTENSION --
extension AppSvgExtension on String {
  String get toSvg => 'assets/images/svg/$this.svg';
}
/// -- TO PNG EXTENSION --
extension AppPngExtension on String {
  String get toPng => 'assets/images/png/$this.png';
}
