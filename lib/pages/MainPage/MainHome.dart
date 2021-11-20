import 'package:digiapp/pages/MainPage/MainHome_Views/BarAsaseBazdid_Shoma1.dart';
import 'package:digiapp/pages/MainPage/MainHome_Views/MainBanner1.dart';
import 'package:digiapp/pages/MainPage/MainHome_Views/MainSegefAngizSoperMarket.dart';
import 'package:digiapp/pages/MainPage/MainHome_Views/MainSlider.dart';
import 'package:digiapp/pages/MainPage/MainHome_Views/MenuUnderSlider.dart';
import 'package:digiapp/pages/MainPage/MainHome_Views/PishnehadeVizhe.dart';
import 'package:flutter/material.dart';


class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Column(
          children: [
             MainSLider(),
             MenuUnderSLider(),
            PishnehadeVizhe(),
            MainBanner1(),
            MainSegefAngizSoperMarket(),
            BarAsaseBazdid_Shoma1()
          ],
        ),
      );

  }
}
