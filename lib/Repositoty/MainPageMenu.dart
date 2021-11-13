import 'package:digiapp/Model/MainPageMenu.dart';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart' ;


Future<List<MainPageMenu>>GetAllPageMenu()async{
  
  List<MainPageMenu>model=[];
  var response=await Dio().get("http://170.10.0.192:61011/api/MainPageMenu/GetAllMainPageMenu");

  for(var item in response.data)
    {
      model.add(MainPageMenu(item["minPageMemuId"], item["title"], item["img"]));
      print(item["title"]);
    }

  return model;
}
