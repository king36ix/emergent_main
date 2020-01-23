import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:emergent/screens/home.dart';
import 'package:emergent/services/auth.dart';
//import 'package:emergent/models/user.dart';
import 'package:emergent/shared/constants.dart';
import 'package:emergent/shared/loading.dart';

final TextEditingController emailController = new TextEditingController();
final TextEditingController passwordController = new TextEditingController();
final TextEditingController passwordController2 = new TextEditingController();

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final AuthService _auth = AuthService(); //instance of auth class
  var _formKey = GlobalKey<FormState>();
  bool loading = false;

  String pwd = '';
  String pwd2 = '';
  String email = '';
  String error = '';
  String correct = 'valid credentials...signing in';

  @override
  Widget build(BuildContext context) {
    return loading?Loading():Scaffold(
      backgroundColor: Colors.blueGrey[100],
//      appBar: AppBar(
////        backgroundColor: Colors.blue[400],
//        elevation: 0.0,
//        title: Text('Sign in to Movr'),
//      ),
      body: ListView(children: <Widget>[
        Container(
          padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 30.0),
          child: Form(
            key: _formKey,
            child: Column(children: <Widget>[
              getImageAsset3(),
              Text(
                'Welcome back to Emergent',
                style: TextStyle(fontSize: 24.0),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'please Sign in',
                  style: TextStyle(fontSize: 18.0),
                ),
              ),
              Divider(),
              Text('EMAIL'),
              Padding(
                padding: EdgeInsets.only(bottom: 20.0),
                child: TextFormField(
                  keyboardType: TextInputType.text,
                  controller: emailController,
                  validator: (email) => email.isEmpty ? 'Enter email' : null,
                  onChanged: (mail) {
                    setState(() {
                      email = mail;
                    });
                  },
                  decoration: textInputDecoration,
                ),
              ),
              Divider(),
              Text('PASSWORD'),
              //Password Form field starts here
              Padding(
                padding: EdgeInsets.only(bottom: 20.0),
                child: TextFormField(
                  keyboardType: TextInputType.text,
                  validator: (password) =>
                      password.isEmpty ? 'Enter password' : null,
                  controller: passwordController,
                  onChanged: (password) {
                    setState(() {
                      pwd = password;
                    });
                  },
                  decoration: textInputDecoration,
                ),
              ),
              RaisedButton(
                  child: Text('Sign in to Movr'),
                  onPressed: () async {
                    print('Email is $email');
                    print('Password is $pwd');

                    if (_formKey.currentState.validate()) {
                      setState(() {
                        loading = true;
                      });
                      dynamic result =
                          await _auth.signInWithEmailAndPassword(email, pwd);

                      print('valid');
                      if (result == null) {
                        setState(() {
                          loading = false;
                          error = 'Cannot sign in with the input credentials';
                          print(error);
                        });
                      } else {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return Home();
                        }));
////                       _submit();}

                      }
                    }
                  }),
              SizedBox(height: 20.0),
              Text(
                error,
                style: TextStyle(color: Colors.red, fontSize: 14.0),
              )
            ]),
          ),
        ),
      ]),
    );
  }
}

getImageAsset3() {
  AssetImage movrs = AssetImage('images/Emergent.png');
  Image image = Image(
    image: movrs,
    width: 288.0,
    height: 96.0,
  );

  return Padding(
    padding: const EdgeInsets.only(bottom: 22.0, top: 16.0),
    child: Container(
      padding: EdgeInsets.symmetric(),
      width: 288.0,
      height: 108.0,
      child: image,
    ),
  );
}
