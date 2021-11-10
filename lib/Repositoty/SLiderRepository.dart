import 'package:digiapp/Model/MainSlider.dart';
import 'package:dio/dio.dart';

Future<List<PageViewModel>>GetAllSLider()async{
  List<PageViewModel>model=[];

  var response=await Dio().get("http://170.10.0.192:61011/api/Slider/GetAllSlider");
  for(var item in response.data)
    {
      model.add(PageViewModel(item['sLiderId'], item['title'], item['olaviat'] ,item['image']));
    }
  return model;
}