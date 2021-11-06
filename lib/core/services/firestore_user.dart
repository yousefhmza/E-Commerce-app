import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:ecommerce/model/user_model.dart';

class FirestoreUser {
  final CollectionReference _usersCollectionRef =
      FirebaseFirestore.instance.collection("users");

  Future<void> addUserToFirestore(UserModel userModel) async {
    return await _usersCollectionRef
        .doc(userModel.userId)
        .set(userModel.toJson());
  }
}
