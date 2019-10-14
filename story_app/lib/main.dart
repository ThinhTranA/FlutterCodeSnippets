import 'package:flutter/material.dart';
import 'customIcons.dart';
import 'data.dart';

void main() => runApp(MaterialApp(
                          home: MyApp(),
  debugShowCheckedModeBanner: false,
        ));

class MyApp extends StatefulWidget{
  @override
  _MyAppState createState() => new _MyAppState();
}

var cardAspectRatio = 12.0 / 16.0;
var widgetAspectRatio = cardAspectRatio * 1.2;

class _MyAppState extends State<MyApp>{

  var currentPage = images.length - 1.0;

  @override
  Widget build(BuildContext context){

    PageController controller = PageController(initialPage: images.length - 1);
    controller.addListener((){
      setState(() {
        currentPage = controller.page;
      });
    });

    return Scaffold(
      backgroundColor: Color(0xFF2d3447),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(left: 12.0, right: 12.0, top: 30.0, bottom: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  IconButton(
                    icon: Icon(
                      CustomIcons.menu,
                      color: Colors.white,
                      size: 30.0,
                    ),
                    onPressed: (){

                    },
                  ),
                  IconButton(
                    icon: Icon(
                      Icons.search,
                      color: Colors.white,
                      size: 30.0,
                    ),
                    onPressed: (){},
                  )
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text("Trending", style: TextStyle(
                    color: Colors.white,
                    fontSize: 46.0,
                    fontFamily: "Calibre-Semibold",
                    letterSpacing: 1.0,
                  ),)
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left:20.0),
              child: Row(
                children: <Widget>[
                  Container(
                    decoration: BoxDecoration(
                      color: Color(0xFFff6e6e),
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    child: Center(
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 22.0, vertical: 6.0),
                        child: Text("Animated",
                        style: TextStyle(color: Colors.white),),
                      ),
                    ),
                  ),
                  SizedBox(width: 15.0,),
                  Text("25+ Stories", style: TextStyle(color: Colors.blueAccent))
                ],
              ),
            ),
            Stack(
              children: <Widget>[
                CardScrollWidget(currentPage),
                Positioned.fill(child: PageView.builder(
                    itemCount: images.length,
                    controller: controller,
                    reverse: true,
                    itemBuilder: (context, index){
                     return Container();
                    }))
              ],
            )

          ],
        ),
      ),
    );
  }
}

class CardScrollWidget extends StatelessWidget {

  var currentPage;
  var padding = 20.0;

  CardScrollWidget(this.currentPage);
  @override
  Widget build(BuildContext context) {
    return new AspectRatio(
        aspectRatio: widgetAspectRatio,
        child: LayoutBuilder(builder: (context, contraints) {
          var width = contraints.maxWidth;
          var heith = contraints.maxHeight;

          var safeWidth = width - 2 * padding;
          var safeHeight = heith - 2 * padding;

          var heightOfPrimaryCard = safeHeight;
          var widthOfPrimaryCard = heightOfPrimaryCard * cardAspectRatio;

          var primaryCardLeft = safeWidth - widthOfPrimaryCard;
        }),
    );
  }
}
