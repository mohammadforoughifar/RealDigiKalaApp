class PageViewModel{
  late int _sliderId;
  late String _title;
  late String _img;
  late int _Olaviat;
  late int _productId;


  PageViewModel(this._sliderId, this._title, this._Olaviat, this._img);

  int get Olaviat => _Olaviat;

  String get title => _title;
  String get img => _img;

  int get sliderId => _sliderId;
  int get ProductId => _productId;
}