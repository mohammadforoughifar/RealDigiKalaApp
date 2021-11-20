class ProductModel{
  late int _productId;
  late String _productName;
  late int _price;
  late String _img;
  late int _discount;
  late int _count;
  late int _catId;
  late int _offerPercent;


  ProductModel(this._productId, this._productName, this._price, this._img,
      this._discount, this._count, this._catId,this._offerPercent); // set productId(int value) {
  //   _productId = value;
  // }

  int get Cat_Id => _catId;

  int get Count => _count;

  int get Discount => _discount;

  String get img => _img;

  int get price => _price;

  String get productName => _productName;

  int get productId => _productId;
  int get offerPercent => _offerPercent;
}
