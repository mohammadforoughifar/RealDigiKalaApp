import 'package:digiapp/Model/ProductModel.dart';
import 'package:digiapp/Repositoty/ProductRepository.dart';
import 'package:flutter/material.dart';
import 'package:progress_indicators/progress_indicators.dart';


class PishnehadeVizhe extends StatefulWidget {
  const PishnehadeVizhe({Key? key}) : super(key: key);

  @override
  _PishnehadeVizheState createState() => _PishnehadeVizheState();
}

class _PishnehadeVizheState extends State<PishnehadeVizhe> {
 late Future<List<ProductModel>>model;

@override
  void initState() {
    // TODO: implement initState
    super.initState();
    model=GetAllProduct() as Future<List<ProductModel>>;
    print(model);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(right: 8,left: 8),
      height: 260,
      color: Colors.red,
      
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
             Text("پیشنهاد ویژه",style: TextStyle(color: Colors.white,),),
              Text("نمایش همه",style: TextStyle(color: Colors.white,),),
            ],
          ),
          FutureBuilder(
            future: model,
              builder: (context,snapshot){
                if(snapshot.data!=null)
                  {
                    List<ProductModel>?_allProduct=snapshot.data as List<ProductModel>;

                   return Container(
                      padding: EdgeInsets.only(top: 10,bottom: 10),
                      height: 230,
                      color: Colors.red,
                      width: MediaQuery.of(context).size.width,

                         child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: _allProduct!.length,
                              itemBuilder: (context,index)
                              {
                                return Padding(
                                  padding: const EdgeInsets.only(left: 8.0),
                                  child: Column(
                                    children: [
                                      Image.network(_allProduct[index].img,width: 120,height: 150,fit: BoxFit.fill,),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(_allProduct[index].productName.length >10 ?'${_allProduct[index].productName.substring(0,9)}...':_allProduct[index].productName
                                          ,style:TextStyle(color: Colors.white) ,),
                                      ),


                                    ],
                                  ),
                                );
                              }),

                      );


                  }
                else{
                  return Center(
                    child: JumpingDotsProgressIndicator(
                      dotSpacing: 5,
                      fontSize: 60,
                    ),
                  );
                }
              }
          ),
        ],
      ),
    );
  }
}
