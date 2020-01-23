import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:emergent/screens/home.dart';
import 'package:emergent/services/auth.dart';
import 'package:emergent/shared/constants.dart';
//import 'package:emergent/models/user.dart';
import 'package:emergent/shared/loading.dart';

String email = '';

TextEditingController emailController = TextEditingController();
TextEditingController passwordController = TextEditingController();
TextEditingController passwordController2 = TextEditingController();
String pwd = '';
String pwd2 = '';
String error = '';
bool loading = false;

class Register extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return loading ? Loading() : _RegisterState();
  }
}

class _RegisterState extends State<Register> {
  final AuthService _auth = AuthService(); //instance of auth class
  var _formKey = GlobalKey<FormState>();
  int count = 0;

  String ifInvalid = 'Please enter valid email address';
  String ifInvalidPwd = 'Enter valid password';

  Form accountView() {
    return Form(
        key: _formKey,
        child: Padding(
          padding: EdgeInsets.fromLTRB(30.0, 30.0, 30.0, 0.0),
          child: ListView(children: <Widget>[
            getImageAsset2(),
            Divider(),
            Padding(
              padding: EdgeInsets.only(bottom: 96),
              child: Column(
                children: <Widget>[
                  Center(
                      child: Padding(
                    padding: EdgeInsets.only(bottom: 12.0),
                    child: Text('Sign Up',
                        style: TextStyle(
                          fontSize: 24.0,
                          color: Colors.black54,
                        )),
                  )),
                  Padding(
                    padding: EdgeInsets.only(bottom: 20.0),
                    child: TextFormField(
                      keyboardType: TextInputType.text,
                      controller: emailController,
                      //if validator evaluates to true it will return the string entare an email
                      validator: (val) => val.isEmpty ? 'Enter email' : null,
                      //if it evaluates to false i.e is Valid it will return null
                      onChanged: (mail) {
                        setState(() {
                          email = mail;
                        });
                      },
                      decoration: textInputDecoration.copyWith(
                          hintText: 'Enter valid email'),
                    ),
                  ),
                  TextFormField(
                    keyboardType: TextInputType.text,
                    controller: passwordController,
                    //if validator evaluates to true it will return the string below
                    validator: (val) => val.length < 5
                        ? 'Invalid.Enter password with more than six or more characters'
                        : null,
                    //if it evaluates to false i.e is Valid it will return null'
                    onChanged: (val) {
                      setState(() {
                        pwd = val;
                      });
                    },
                    decoration: textInputDecoration.copyWith(
                        hintText: 'Enter password 6 or more characters'),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 16.0),
                    child: TextFormField(
                      keyboardType: TextInputType.text,
                      controller: passwordController2,
                      onChanged: (val) {
                        setState(() {
                          pwd2 = val;
                        });
                      },
                      //if validator evaluates to true it will return the string entare an email
                      validator: (val) => !val.contains(pwd)
                          ? 'Does not match input above'
                          : null,
                      //if it evaluates to false i.e is Valid it will return null
                      decoration: textInputDecoration.copyWith(
                          hintText: 'Repeat password input'),
                    ),
                  ),
                  RaisedButton(
                    child: Text('Register'),
                    onPressed: () async {
                      //form validation with _formKey and validator properties in textFields
                      if (_formKey.currentState.validate()) {
                        setState(() {
                          loading = true;//see loading widget before firebase validation
                        });
                        //form is valid only if every validator returns a null value
                        dynamic result =
                            await _auth.registerWithEmailAndPassword(
                                email, pwd); //method on auth service
                            // _submit();
                        if (result == null) {
                          setState(() {
                            loading = false;
                            error = 'Supply valid email address';
                            print(error);
                          });
                        } else {
                          print('email is $email');
                          print('password is $pwd');
                          print('password confirm is $pwd2');
                          _submit();
                        }
                      }
                    },
                  ),
                  SizedBox(
                    height: 32.0,
                  ),
                  Text(
                    error,
                    style: TextStyle(color: Colors.red, fontSize: 14.0),
                  )
                ],
              ),
            ),
          ]),
        ));
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
//      appBar: AppBar(
//        title: Text('Notes'),
//       // backgroundColor: Colors.black38,
//      ),
      backgroundColor: Colors.blueGrey[100],
      body: accountView(),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.black45,
        onPressed: () {
          debugPrint('FAB clicked');
//          navigateToDetail('Add Note');
        },
        tooltip: 'Add note',
        child: Icon(Icons.add),
      ),
    );
  }

  void _submit() {
    

    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return Home();
    }));
  }
}

getImageAsset2() {
  AssetImage movrs = AssetImage('images/Emergent.png');
  Image image = Image(
    image: movrs,
    width: 144.0,
    height: 144.0,
  );

  return Padding(
    padding: const EdgeInsets.only(bottom: 16.0, top: 22.0),
    child: Container(
      padding: EdgeInsets.symmetric(),
      width: 144.0,
      height: 144.0,
      child: image,
    ),
  );
}
