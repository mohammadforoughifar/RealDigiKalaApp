import 'package:digiapp/pages/MainPage/MainHome_Views/MainSlider.dart';
import 'package:digiapp/pages/MainPage/MainHome_Views/MenuUnderSlider.dart';
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
             MenuUnderSLider()
          ],
        ),
      );

  }
}
