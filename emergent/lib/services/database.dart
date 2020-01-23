import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {
//collection reference

  final String uid;

  DatabaseService({this.uid});

  final CollectionReference movrsCollection =
      Firestore.instance.collection('Movrs');

  //used when registering or when editing profile pictures
  Future updateUserData(
    String dlNumber,
    String location,
    String name,
    String vehicleType,
    String vehicleID,
  ) async {
    return await movrsCollection.document(uid).setData({
      'VicenseNo': dlNumber,
      'Name': name,
      'VehicleType': vehicleType,
      'VehicleID': vehicleID,
      'Location': location
    }); //upon sign up document will be created with this uid and set the above named properties
  }

//gets reference to the document and update the data

}
