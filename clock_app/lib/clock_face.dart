import 'package:flutter/material.dart';
import 'clock_dial_painter.dart';

class ClockFace extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: new Container(
        width: double.infinity,
        decoration: new BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.white,
        ),

        child: new Stack(
          children: <Widget>[
            //dia and numbers go here

            //centerpoint
            new Center(

              child: new Container(
                width: 15.0,
                height: 15.0,
                decoration: new BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.black,
                ),
              ),
            ),

            //dial and numbers go here
            new Container(
              width: double.infinity,
              height: double.infinity,
              padding: const EdgeInsets.all(10.0),
              child: new CustomPaint(
                painter: new ClockDialPainter(clockText: ClockText.roman),
              ),
            )

            //clock hands go here

          ],
        ),
      ),
    );
  }
}
