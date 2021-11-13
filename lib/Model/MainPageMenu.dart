class MainPageMenu{
  late int _MinPageMemuId;
  late String _Title;
  late String _Img;
  late int _ProductId;

  MainPageMenu(this._MinPageMemuId, this._Title, this._Img);

  int get ProductId => _ProductId;

  String get Img => _Img;

  String get Title => _Title;

  int get MinPageMemuId => _MinPageMemuId;
}