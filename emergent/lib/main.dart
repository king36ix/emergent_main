import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';
import 'package:emergent/screens/authenticate/register.dart';
import 'package:emergent/screens/authenticate/sign_in.dart';
import 'package:emergent/wrapper.dart';
import 'package:provider/provider.dart';

import 'package:emergent/models/user.dart';
import 'package:emergent/services/auth.dart';

void main() => runApp(MyApp());

AssetImage emergent = AssetImage('images/Emergent.png');
AssetImage movrs = AssetImage('images/Ambulance.png');

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return StreamProvider<User>.value(
      value: AuthService().user,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Wrapper(),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[100],
      body: ListView(
        children: <Widget>[
          Column(children: <Widget>[
            AnimatedOpacity(
                duration: Duration(seconds: 7),
                opacity: (1),
                child: getImageAsset(),),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 120.0,vertical:100.0),
              child: Row(children: <Widget>[

                Padding(//Log in Button Starts Here
                  padding: EdgeInsets.symmetric(),
                  child: RaisedButton(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return SignIn();
                      }));
                    },
                    child: Text('LOG IN'),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(2.0),
                  child: RaisedButton(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return Register();
                      }));
                    },
                    child: Text('REGISTER'),
                  ),
                ),
              ]),
            ),
          ])
        ],
      ),
    );
  }
}

Widget getImageAsset() {
  AssetImage emergent = AssetImage('images/Emergent.png');
  // AssetImage movrs = AssetImage('images/Ambulance.png');
  Image image = Image(
    image: emergent,
    width: 288.0,
    height: 144.0,
  );
  return Container(
    padding: EdgeInsets.fromLTRB(20,40.0,20.0,20.0),
    width: 288.0,
    height: 288.0,
    child: image,
  );
}
