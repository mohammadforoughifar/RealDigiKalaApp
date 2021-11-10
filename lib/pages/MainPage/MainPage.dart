import 'package:digiapp/pages/MainPage/MainBasket.dart';
import 'package:digiapp/pages/MainPage/MainHome.dart';
import 'package:digiapp/pages/MainPage/MainLove.dart';
import 'package:digiapp/pages/MainPage/MainProfile.dart';
import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  @override
  _State createState() => _State();
}

class _State extends State<MainPage> {

  int _bottomIndex=0;
void _onItemTap(int index)
{
setState(() {
  _bottomIndex=index;
  print(_bottomIndex);
});
}


  Widget _body(){

  if(_bottomIndex==0)
  {
  return HomePage();
  }
  else if(_bottomIndex==1)
  {
  return MainProfile();
  }
  else if(_bottomIndex==2)
  {
  return MainBasket();
  }
  else
  {
  return MainLove();
  }
  return Container();
}


  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;




    return Scaffold(
      appBar: AppBar(
        title: Text("دیجی کالا"),
      ),
      body: _body(),

      bottomNavigationBar:
      BottomNavigationBar(

        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home,), label: 'خانه',backgroundColor: Colors.red),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "پروفایل",backgroundColor: Colors.red),
          BottomNavigationBarItem(icon: Icon(Icons.shopping_cart_outlined), label: "سبد خرید",backgroundColor: Colors.red),
          BottomNavigationBarItem(icon: Icon(Icons.favorite_border), label: "علاقه‌مندی‌ها",backgroundColor: Colors.red),
        ],
         backgroundColor: Colors.red,
         currentIndex:_bottomIndex ,
        selectedItemColor: Colors.deepOrangeAccent[600],
        onTap: _onItemTap,
      ),
    );
  }
}
