class BannerModel{
  late int _bannerId;
  late String _title;
  late String _img;
  late int _olaviat;

  BannerModel(this._title, this._olaviat,this._img);


  set bannerId(int value) {
    _bannerId = value;
  }

  int get olaviat => _olaviat;

  String get img => _img;

  String get title => _title;
}