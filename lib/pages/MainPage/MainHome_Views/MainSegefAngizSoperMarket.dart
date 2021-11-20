import 'package:digiapp/Model/ProductModel.dart';
import 'package:digiapp/Repositoty/ProductRepository.dart';
import 'package:flutter/material.dart';
import 'package:progress_indicators/progress_indicators.dart';


class MainSegefAngizSoperMarket extends StatefulWidget {
  const MainSegefAngizSoperMarket({Key? key}) : super(key: key);

  @override
  _MainSegefAngizSoperMarketState createState() => _MainSegefAngizSoperMarketState();
}

class _MainSegefAngizSoperMarketState extends State<MainSegefAngizSoperMarket> {

  late Future<List<ProductModel>>_GetAllProduct ;
@override
  void initState() {
    // TODO: implement initState
    super.initState();
    _GetAllProduct=GetAllProduct();
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      color: Colors.green,
      child: FutureBuilder<List<ProductModel>>(
        future: _GetAllProduct,
          builder: (context,snapshot)
          {
            if(snapshot.data!=null)
              {
                List<ProductModel>?model=snapshot.data;
               print("Model=${model!.length}");

                return Row(
                   mainAxisAlignment: MainAxisAlignment.spaceBetween,

                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 40.0,right: 10,left: 10),
                      child: Container(

                        width: 100,
                        height: 300,
                        child: Column(
                          children: [
                            Image.asset("Imaged/image3.png")
                          ],
                        ),

                      ),
                    ),

                    SizedBox(width: 20,),
                    Container(
                      height: 300,
                    width: MediaQuery.of(context).size.width-140,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: model!.length,

                          itemBuilder: (context,index)
                              {
                                if(model.length-1!=index)
                                  {
                                    return Card(

                                      shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.all(Radius.circular(8))
                                      ),
                                      child: Container(
                                        width: 180,
                                        padding: const EdgeInsets.only(top: 40.0),
                                        child: Column(

                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.only(left: 30.0,right: 30,top: 20),
                                              child: Image.network(model[index].img,width: 120,height: 80,fit: BoxFit.fill,),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(top: 8.0),
                                              child: Text(model[index].productName.length >20 ?
                                              '${model[index].productName.substring(0,19)}... ':model[index].productName,
                                                style: TextStyle(fontSize: 12,color: Colors.grey[600]),),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(top: 8.0),
                                              child: Text('   تعداد :   ${model[index].Count}',
                                                style: TextStyle(fontSize: 12,color: Colors.grey[600]),),
                                            ),

                                            Padding(
                                                padding: const EdgeInsets.only(left:10,right:10,top: 8.0),
                                                child:Row(

                                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                  children: [
                                                    Text('${model[index].offerPercent.toString()} %',style: TextStyle(fontSize: 12,color: Colors.red),),

                                                    Text('${model[index].price.toString()} تومان ',style: TextStyle(fontSize: 12,color: Colors.green[600])),
                                                  ],

                                                )
                                            ),
                                            Padding(
                                                padding: const EdgeInsets.only(left:10,right:10,top: 50.0),
                                                child:Row(

                                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                  children: [
                                                    SizedBox(width: 100,),
                                                    Text("13:20:45",style: TextStyle(fontSize: 12,color: Colors.grey[400]),),


                                                  ],

                                                )
                                            ),

                                          ],
                                        ),
                                      ),
                                    );
                                  }
                                else {
                                  return Card(

                                  );

                                }

                              }
                      ),
                    )
                  ],
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
    );
  }
}
