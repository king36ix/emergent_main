import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(

      color:Colors.teal[50],
      child:Center(
        child:SpinKitDoubleBounce(
          color: Colors.blueGrey[900],
          size: 100.0,
        )

      )
    );
  }


}