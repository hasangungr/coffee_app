extension StringPath on String {
  String get toPng => 'asset/img/$this.png';
  String get viewName => '/$this';
}
