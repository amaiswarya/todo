import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:todoapp/res/constants/string_constants.dart';
import 'package:todoapp/res/enums/enums.dart';
import 'package:todoapp/utils/helpers/auto_dispose_view_model.dart';
import 'package:todoapp/utils/helpers/common_functions.dart';

class AuthViewModel extends AutoDisposeViewModel with AuthLoader {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  //*-------------------SIGN IN--------------------

  Future<User?> signInWithEmailandPassword(
      String email, String password) async {
    try {
      UserCredential result = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      User? user = result.user;
      return user;
    } on FirebaseAuthException catch (e) {
      if (e.code == Strings.invalidEmailCode) {
        showToast(msg: Strings.invalidEmail, isError: true);
      } else if (e.code == Strings.wrongPasswordCode) {
        showToast(msg: Strings.wrongPassword, isError: true);
      } else if (e.code == Strings.userNotFoundCode) {
        showToast(msg: Strings.userNotFound, isError: true);
      } else {
        showToast(msg: e.toString(), isError: true);
      }
    } catch (e) {
      debugPrint(e.toString());
      return null;
    }
    return null;
  }

  //-------------------SIGN IN---------------------

  //*-------------------SIGN UP--------------------

  Future<User?> registerWithEmailandPassword(
      String email, String password) async {
    try {
      UserCredential result = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      User? user = result.user;
      return user;
    } on FirebaseAuthException catch (e) {
      if (e.code == Strings.weakPasswordCode) {
        showToast(msg: Strings.weakPassword, isError: true);
      } else if (e.code == Strings.emailAlreadyInUseCode) {
        showToast(msg: Strings.emailAlreadyInUse, isError: true);
      } else {
        showToast(msg: e.toString(), isError: true);
      }
    } catch (e) {
      debugPrint(e.toString());
      return null;
    }
    return null;
  }

  //-------------------SIGN UP---------------------

  //*-------------------SIGN OUT--------------------

  Future<void> signOut() async {
    try {
      return await _auth.signOut();
    } catch (e) {
      debugPrint(e.toString());
      return null;
    }
  }

  //-------------------SIGN OUT---------------------

  @override
  updateEmailLoginLoader(LoaderState state) {
    emailLoginLoader = state;
    notifyListeners();
  }
}

mixin AuthLoader {
  LoaderState emailLoginLoader = LoaderState.loaded;
  updateEmailLoginLoader(LoaderState state);
}
