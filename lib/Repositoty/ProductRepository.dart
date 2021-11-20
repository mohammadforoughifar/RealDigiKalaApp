

import 'package:digiapp/Model/ProductModel.dart';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'Url.dart';

URL U=new URL();
Future<List<ProductModel>>GetAllProduct()async{
  List<ProductModel>model=[];

  var response=await Dio().get(U.urll+"Product/produhct/GetAllProductBy_PishnehadeVizhe");
  print(response.data);
  for(var item in response.data)
    {
      model.add(ProductModel(item["productId"], item["productName"],
          item["price"], item["img_Url"], item["discount"], item["count"], item["cat_Id"], item["offer_Persond"]));

    }

  return model;

}