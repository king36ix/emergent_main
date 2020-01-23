//import 'dart:js';

import 'package:emergent/breakdowns.dart';
import 'package:emergent/screens/authenticate/authenticate.dart';
import 'package:emergent/services/auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

//AssetImage ambulance = AssetImage('images/Ambulance.png');
//AssetImage emergent = AssetImage('images/Emergent.png');
//AssetImage medic = AssetImage('images/MEdic.png');
//AssetImage breakdown = AssetImage('images/BreakDown.png');

class Home extends StatelessWidget {
  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.blueGrey[100],
//        appBar: AppBar(
//          title: Text('Emergent Services',style: TextStyle(color:Colors.indigo[900]),),
//          backgroundColor: Colors.teal[100],
//          elevation: 7.0,
//          actions: <Widget>[
//            FlatButton.icon(
//              label: Text('Logout'),
//              icon: Icon(Icons.person),
//              onPressed: () async {
//                await _auth.signOut();
//                Authenticate();
//              },
//            ),
//          ],
//        ),
        body: Center(
            child: Padding(
          padding:EdgeInsets.fromLTRB(4.0, 16.0, 4.0, 24.0),
          child: Column(children: <Widget>[
            Container(padding:EdgeInsets.symmetric(vertical:40.0,horizontal:30.0),child:getImageAsset(),),
            Card(
              child: ListTile(
                // leading:Image(AssetImage:breakdown),
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return BreakDowns();
                  }));
                },
                leading: breakDownImage(),
                isThreeLine: true,
                title: Text('Breakdown Services'),
                subtitle: Text('You need towing?'),
              ),
            ),
            Card(
              child: ListTile(
                isThreeLine: true,
                leading: ambulanceImage(),
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return BreakDowns();
                  }));
                },
                title: Text('Get an Ambulance'),
                subtitle: Text('Quick!'),
              ),
            ),
            Card(
              child: ListTile(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return BreakDowns();
                  }));
                },
                isThreeLine: true,
                leading: medicImage(),
                title: Text('Locate a Clinic/Hospital'),
                subtitle: Text('Wanna see a Doctor/Medic?'),
              ),
            ),
            Card(
              child: ListTile(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return BreakDowns();
                  }));
                },
                isThreeLine: true,
                leading: medicImage(),
                title: Text('Locate a Clinic/Hospital'),
                subtitle: Text('Wanna see a Doctor/Medic?'),
              ),
            ),
            SizedBox(
              height: 75.0,
            ),
            RaisedButton(
              child: Text('logout'),
//              child: Icon(Icons.person),
              onPressed: () async {
                await _auth.signOut();
                Authenticate();
              },
            ),
          ]),
        )));
  }
}

Widget getImageAsset() {
  AssetImage emergent = AssetImage('images/Emergent.png');
  // AssetImage movrs = AssetImage('images/Ambulance.png');
  Image image = Image(
    image: emergent,
    width: 288.0,
    height: 116.0,
  );
  return Container(
    padding: EdgeInsets.symmetric(),
    width: 288.0,
    height: 120.0,
    child: image,
  );
}

breakDownImage() {
  AssetImage breakdown = AssetImage('images/BreakDown.png');
  Image image = Image(
    image: breakdown,
    width: 72.0,
    height: 72.0,
  );

  return Container(
    padding: EdgeInsets.symmetric(),
    width: 96.0,
    height: 72.0,
    child: image,
  );
}

medicImage() {
  AssetImage medic = AssetImage('images/MEdic.png');
  Image Medic = Image(
    image: medic,
    width: 72.0,
    height: 72.0,
  );

  return Container(
    padding: EdgeInsets.symmetric(),
    width: 72.0,
    height: 72.0,
    child: Medic,
  );
}

ambulanceImage() {
  AssetImage ambulance = AssetImage('images/Ambulance.png');
  Image image = Image(
    image: ambulance,
    width: 72.0,
    height: 72.0,
  );

  return Container(
    padding: EdgeInsets.symmetric(),
    width: 96.0,
    height: 72.0,
    child: image,
  );
}
