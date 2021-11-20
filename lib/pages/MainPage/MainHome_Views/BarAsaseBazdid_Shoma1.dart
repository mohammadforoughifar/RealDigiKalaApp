import 'package:digiapp/Model/ProductModel.dart';
import 'package:digiapp/Repositoty/ProductRepository.dart';
import 'package:flutter/material.dart';
import 'package:progress_indicators/progress_indicators.dart';



class BarAsaseBazdid_Shoma1 extends StatefulWidget {
  const BarAsaseBazdid_Shoma1({Key? key}) : super(key: key);

  @override
  _BarAsaseBazdid_Shoma1 createState() => _BarAsaseBazdid_Shoma1();
}

class _BarAsaseBazdid_Shoma1 extends State<BarAsaseBazdid_Shoma1> {

  late Future<List<ProductModel>>model;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    model=GetAllProduct();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [

            Padding(
              padding: const EdgeInsets.only(top:10,right: 8.0),
              child: Row(

                children: [
                  Text("محصولات",style: TextStyle(fontSize: 16),),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: Row(
                children: [
                  Text("بر اساس جستحویشما",style: TextStyle(fontSize: 10,color: Colors.grey[600],)),
                ],
              ),
            ),



        FutureBuilder<List<ProductModel>>(
            future: model,
            builder: (context,snapshot)
            {
              if(snapshot.data!=null)
              {
                List<ProductModel>? modell=snapshot.data;


                return Container(
                  color: Colors.grey[200],
                  height: 200,
                  child: GridView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: modell!.length,
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,

                        crossAxisSpacing: 4,
                        mainAxisSpacing:4,


                      ),

                      itemBuilder: (BuildContext context, int index) {
                        return Card(
                            elevation:0,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)
                            ),
                            //color: Colors.amber,
                            child: Padding(
                              padding: const EdgeInsets.only(top: 8.0,bottom: 8),
                              child: Image.network(modell![index].img,fit: BoxFit.fill,),
                            )
                        );

                      }
                  ),
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
    );
  }
}
