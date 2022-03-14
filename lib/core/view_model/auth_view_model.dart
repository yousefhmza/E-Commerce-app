import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce/core/services/firestore_user.dart';
import 'package:ecommerce/helper/local_storage_data.dart';
import 'package:ecommerce/model/user_model.dart';
import 'package:ecommerce/view/control_view.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

import 'package:ecommerce/view/home_view.dart';

class AuthViewModel extends GetxController {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  String? email, password, name;

  final Rxn<User> _user = Rxn<User>();

  String? get user => _user.value?.email!;

  final LocalStorageData localStorageData = Get.find();

  @override
  void onInit() {
    super.onInit();
    _user.bindStream(_firebaseAuth.authStateChanges());

    if (_firebaseAuth.currentUser != null) {
      getCurrentUserData(_firebaseAuth.currentUser!.uid);
    }
  }

  void googleSignIn() async {
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
      final GoogleSignInAuthentication? googleAuth =
          await googleUser!.authentication;
      final credentials = GoogleAuthProvider.credential(
        accessToken: googleAuth!.accessToken,
        idToken: googleAuth.idToken,
      );
      UserCredential credential =
          await _firebaseAuth.signInWithCredential(credentials);
      saveUser(credential);
    } on FirebaseAuthException catch (e) {
      Get.snackbar("حدث خطأ ما", e.toString());
    } catch (e) {
      Get.snackbar("حدث خطأ ما", e.toString());
    }
  }

  void facebookSignIn() async {
    try {
      final LoginResult loginResult = await FacebookAuth.instance.login();
      if (loginResult.status == LoginStatus.success) {
        final OAuthCredential faceBookCredentials =
            FacebookAuthProvider.credential(loginResult.accessToken!.token);
        UserCredential credential =
            await _firebaseAuth.signInWithCredential(faceBookCredentials);

        saveUser(credential);
      }
    } on FirebaseAuthException catch (e) {
      Get.snackbar("حدث خطأ ما", e.toString());
    } catch (e) {
      Get.snackbar("حدث خطأ ما", e.toString());
    }
  }

  void signIn() async {
    try {
      UserCredential? user = await _firebaseAuth
          .signInWithEmailAndPassword(
        email: email!.toLowerCase().trim(),
        password: password!,
      )
          .then((value) {
        getCurrentUserData(value.user!.uid);
      });
      Get.offAll(() => const ControlView());
    } on FirebaseAuthException catch (e) {
      print(e);
      Get.snackbar("حدث خطأ ما", e.toString());
    } catch (e) {
      print(e);
      Get.snackbar("حدث خطأ ما", e.toString());
    }
  }

  void signUp() async {
    try {
      UserCredential credential =
          await _firebaseAuth.createUserWithEmailAndPassword(
        email: email!.toLowerCase().trim(),
        password: password!,
      );
      saveUser(credential);
    } on FirebaseAuthException catch (e) {
      Get.snackbar("حدث خطأ ما", e.toString());
    } catch (e) {
      Get.snackbar("حدث خطأ ما", e.toString());
    }
  }

  void getCurrentUserData(String uid) async {
    await FirestoreUser().getCurrentUser(uid).then((value) {
      setUser(UserModel.fromJson(value.data()));
    });
  }

  void saveUser(UserCredential credential) async {
    UserModel userModel = UserModel(
      userId: credential.user!.uid,
      email: credential.user!.email!.toLowerCase(),
      name: name == null ? credential.user!.displayName! : name!,
      pic: "",
    );
    await FirestoreUser().addUserToFirestore(userModel);
    setUser(userModel);
    Get.offAll(() => const ControlView());
  }

  void setUser(UserModel userModel) async {
    await localStorageData.setUser(userModel);
  }
}
