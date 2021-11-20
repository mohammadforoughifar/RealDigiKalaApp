import 'package:digiapp/Model/BannerModel.dart';
import 'package:digiapp/Repositoty/Url.dart';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

Future<List<BannerModel>> GetAllBanner() async {
  late List<BannerModel> model = [];
  var response = await Dio().get(URL().urll + "Banner/GetAllBanner");
  for (var item in response.data) {
    model.add(BannerModel(item["title"], item["olaviat"], item["img"]));
    print(item["title"]);
  }
  return model;
}
