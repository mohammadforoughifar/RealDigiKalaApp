import 'package:digiapp/Model/BannerModel.dart';
import 'package:digiapp/Repositoty/Banner.dart';
import 'package:flutter/material.dart';
import 'package:progress_indicators/progress_indicators.dart';


class MainBanner1 extends StatefulWidget {
  const MainBanner1({Key? key}) : super(key: key);

  @override
  _MainBanner1State createState() => _MainBanner1State();
}

class _MainBanner1State extends State<MainBanner1> {

 late Future<List<BannerModel>>model;

 @override
  void initState() {
    // TODO: implement initState
    super.initState();
    model=GetAllBanner();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<BannerModel>>(
      future: model,
        builder: (context,snapshot)
            {
              if(snapshot.data!=null)
                {
                  List<BannerModel>? modell=snapshot.data;


                  return Container(
                    color: Colors.grey[200],
                    height: 200,
                    child: GridView.builder(
                        itemCount: modell!.length,
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
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
    );
  }
}
