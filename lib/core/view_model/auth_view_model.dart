import 'package:ecommerce/core/services/firestore_user.dart';
import 'package:ecommerce/model/user_model.dart';
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

  @override
  void onInit() {
    super.onInit();
    _user.bindStream(_firebaseAuth.authStateChanges());
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
      Get.snackbar("Error While Login", e.toString());
    } catch (e) {
      Get.snackbar("Error While Login", e.toString());
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
      Get.snackbar("Error While Login", e.toString());
    } catch (e) {
      Get.snackbar("Error While Login", e.toString());
    }
  }

  void signIn() async {
    try {
      await _firebaseAuth.signInWithEmailAndPassword(
        email: email!,
        password: password!,
      );
      Get.offAll(HomeView());
    } on FirebaseAuthException catch (e) {
      Get.snackbar("Error While Login", e.toString());
    } catch (e) {
      Get.snackbar("Error While Login", e.toString());
    }
  }

  void signUp() async {
    try {
      UserCredential credential =
          await _firebaseAuth.createUserWithEmailAndPassword(
        email: email!,
        password: password!,
      );
      saveUser(credential);
    } on FirebaseAuthException catch (e) {
      Get.snackbar("Error While Login", e.toString());
    } catch (e) {
      Get.snackbar("Error While Login", e.toString());
    }
  }

  void saveUser(UserCredential credential) async {
    await FirestoreUser().addUserToFirestore(
      UserModel(
        userId: credential.user!.uid,
        email: credential.user!.email!,
        name: name == null ? credential.user!.displayName! : name!,
        pic: "",
      ),
    );
    Get.offAll(HomeView());
  }
}
