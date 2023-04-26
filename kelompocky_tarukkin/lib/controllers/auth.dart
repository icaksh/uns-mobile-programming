import 'package:firebase_auth/firebase_auth.dart';
import 'package:kelompocky_tarukkin/controllers/database.dart';
import 'package:kelompocky_tarukkin/helper/login.dart';

class Auth {
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  Future registerUserWithEmailandPassword(
      String username, String fullName, String email, String password) async {
    try {
      User user = (await firebaseAuth.createUserWithEmailAndPassword(
              email: email, password: password))
          .user!;
      if (user != null) {
        await DatabaseService(uid: user.uid)
            .savingUserData(username, fullName, email);
        return true;
      }
    } on FirebaseAuthException catch (e) {
      return e.message;
    }
  }

  Future loginWithEmailandPassword(String email, String password) async {
    try {
      User user = (await firebaseAuth.signInWithEmailAndPassword(
              email: email, password: password))
          .user!;
      if (user != null) {
        return true;
      }
    } on FirebaseAuthException catch (e) {
      return e.message;
    }
  }

  Future signOut() async {
    try {
      await LoginHelper.saveUserLoggedInStatus(false);
      await LoginHelper.saveUserEmailSF("");
      await LoginHelper.saveUserNameSF("");
      await LoginHelper.saveUserFullNameSF("");
      await firebaseAuth.signOut();
    } catch (e) {
      return null;
    }
  }
}
