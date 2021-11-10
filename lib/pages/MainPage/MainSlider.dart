import 'package:digiapp/Model/MainSlider.dart';
import 'package:digiapp/Repositoty/SLiderRepository.dart';
import 'package:flutter/material.dart';
import 'package:progress_indicators/progress_indicators.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class MainSLider extends StatefulWidget {


  @override
  _MainSLiderState createState() => _MainSLiderState();
}

class _MainSLiderState extends State<MainSLider> {
  PageController pageController=PageController();
  late Future<List<PageViewModel>>modell;


  @override
  void initState() {
    // TODO: implement initState

    modell=GetAllSLider() as Future<List<PageViewModel>>;
  }

  @override
  Widget build(BuildContext context) {

GetAllSLider();


    final PageController controller = PageController(initialPage: 0);
    return Padding(
      padding: const EdgeInsets.only(right: 4,left: 4),
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 150,

        child:FutureBuilder<List<PageViewModel>>(
          future: modell,
          builder: (context,snapshot){
            if(snapshot.data!=null)
              {
                List<PageViewModel>?model1=snapshot.data;
                return Stack(
                  alignment: Alignment.bottomCenter,
                  children:
                  [
                    PageView.builder(
                        controller: pageController,
                        allowImplicitScrolling: true,
                        itemCount: model1?.length,
                        itemBuilder: (context,position)
                        {
                          return PageViewItem(model1![position]);
                        }
                    ),


                    Padding(padding: EdgeInsets.only(bottom: 5),
                      child: SmoothPageIndicator(
                        controller:  pageController,
                        count:  5,
                        // axisDirection: Axis.vertical,
                        effect:  ExpandingDotsEffect(
                            spacing:  10.0,
                            radius:  10.0,
                            dotWidth:  10.0,
                            dotHeight:  10.0,

                            paintStyle:  PaintingStyle.stroke,
                            strokeWidth:  1.5,
                            dotColor:  Colors.grey,
                            activeDotColor:  Colors.red
                        ),
                        onDotClicked: (index){
                          pageController.animateToPage(index, duration: Duration(microseconds: 3000), curve: Curves.easeOut);
                        },
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
        )


      ),
    );
  }


  Widget PageViewItem(PageViewModel slider){
    return Padding(padding: EdgeInsets.only(top: 10,left: 5,right: 5),
      child: Container(
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Image.network(slider.img,fit: BoxFit.fill,),
        ),
      ),
    );
  }


}
