import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'dart:math';


void main() => runApp(MaterialApp(
  home: Home(),
  debugShowCheckedModeBanner: false,
  theme: ThemeData(
    appBarTheme: AppBarTheme(
      color: Colors.white
    )
  ),
));

class Home extends StatefulWidget{
  @override
  _HomeState createState() => new _HomeState();
}

class _HomeState extends State<Home>{



  Widget _buildRadialSeekBar(){

  }



  @override
  Widget build(BuildContext context){
    return new Scaffold(
      backgroundColor: Colors.white,
      appBar:  AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: Color(0xFFFE1483),
          ),
          onPressed: (){},
        ),
        title: Text("Music World",
        style: TextStyle(color: Color(0xFFFE1483), fontFamily: "Nexa")),
        centerTitle: true,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.menu, color: Color(0xFFFE1483)),
            onPressed: (){},
          )
        ],
      ),
      body:

      Column(
        children: <Widget>[
          SizedBox(
            height: 25.0,
          ),
          Center(
            child: Container(
              width: 250.0,
              height: 250.0,
              child: Stack(
                children: <Widget>[
                  Container(
                    decoration: BoxDecoration(
                      color: Color(0xFFFE1483).withOpacity(.5),
                      shape: BoxShape.circle),
                      child: _buildRadialSeekBar(),
                  ),
                  Center(
                    child: ClipOval(
                      clipper: MClipper(),
                      child: Container(
                        width: 200,
                        height: 200,
                        child: Image.asset("assets/justine.jpg", fit: BoxFit.cover,),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          SizedBox(height: 25.0),
          Column(
            children: <Widget>[
              Text("Justin Bieber fit. Never say never",
              style: TextStyle(
                color: Color(0xFFFE1483),
                fontSize: 20.0,
                fontFamily: "Nexa"),
              ),
              Text("The weekend",
                style: TextStyle(
                    color: Color(0xFFFE1483),
                    fontSize: 20.0,
                    fontFamily: "NexaLight"),
              ),
              SizedBox(
                height: 8.0,
              )
            ],
          ),
          Container(
            width: 350.0,
            height: 150.0,
            child: Stack(
              children: <Widget>[
                Center(
                  child: Container(
                    height: 65.0,
                    width: 290.0,
                    decoration: BoxDecoration(
                      border:
                        Border.all(color: Color(0xFFed3961), width: 3.0),
                      borderRadius: BorderRadius.circular(40.0)),
                    child: Row(
                      children: <Widget>[
                        Icon(Icons.fast_forward,
                          size: 55.0, color: Color(0xFFed3961)),
                          Expanded(
                            child: Container(),
                          ),
                          Icon(Icons.fast_rewind,
                            size: 55.0, color: Color(0xFFed3961),
                        )
                      ],
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.center,
                  child: Container(
                    width: 92.0,
                    height: 92.0,
                    decoration: BoxDecoration(
                      color: Color(0xFFFE1483), shape: BoxShape.circle),
                      child: IconButton(
                        icon: Icon(
                          Icons.play_arrow,
                          size: 45.0,
                          color: Color(0xFFFE1483),
                        ),
                        onPressed: (){},
                      )
                    ),
                  ),
                )
              ],
            ),
          )


        ],

      ),


    );
  }
}

class MClipper extends CustomClipper<Rect>{
  @override
  Rect getClip(Size size){

    return Rect.fromCircle(
      center: Offset(size.width/2, size.height/2),
      radius: min(size.width, size.height) / 2);

  }

  @override
  bool shouldReclip(CustomClipper<Rect> oldClipper){
    return true;
  }
}