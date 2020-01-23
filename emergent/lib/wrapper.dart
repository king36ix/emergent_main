import 'package:flutter/material.dart';
import 'package:emergent/screens/authenticate/authenticate.dart';
import 'package:emergent/screens/home.dart';
import 'package:provider/provider.dart';
import 'package:emergent/models/user.dart';
//import 'main.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final user = Provider.of<User>(context);
    print(user);
    // return either the Home or Authenticate widget dependant on user value
    if (user == null){
      return Authenticate();
    } else {
      return Home();
    }

  }
}
