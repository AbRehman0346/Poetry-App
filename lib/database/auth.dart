import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter/material.dart';
import 'package:peotry_app/database/database.dart';
import 'package:peotry_app/database/network_response.dart';
import 'package:peotry_app/route_generator.dart';
import '../Constants.dart';
import '../models/user_model.dart';

class Auth{
  Future<NetworkResponse> register(BuildContext context, UserModel user) async {
    try {
      NetworkResponse res = await Database().storeUserData(user);
      bool isDataSaved = res.data as bool;
      if(!isDataSaved){
        return NetworkResponse(
            status: 400,
            message: "Error while saving user data", data: false);
      }
      UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: user.email,
        password: user.password,
      );
      Constants.user = user;
      return NetworkResponse(
          status: 200,
          message: "success", data: true);
    } on FirebaseAuthException catch (e) {
      String msg;
      if (e.code == 'weak-password') {
        msg = "The password provided is too weak.";
      } else if (e.code == 'email-already-in-use') {
        msg = "The account already exists for that email.";
      } else {
        msg = "Signup failed: ${e.message}";
      }
      return NetworkResponse(
          status: 400,
          message: msg, data: false);
    } catch (e) {
      return NetworkResponse(
          status: 200,
          message: "An error occurred. Please try again.", data: false);
    }
  }

  Future<void> login(BuildContext context, UserModel user) async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: user.email,
        password: user.password,
      );
      Fluttertoast.showToast(msg: "Signin successful");
      Navigator.pushAndRemoveUntil(context, RouteGenerator.generateRoute(const RouteSettings(name: Routes.home)), (predicate) => false);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        Fluttertoast.showToast(msg: "No user found for that email.");
      } else if (e.code == 'wrong-password') {
        Fluttertoast.showToast(msg: "Wrong password provided.");
      } else {
        Fluttertoast.showToast(msg: "Signin failed: ${e.message}");
      }
    } catch (e) {
      Fluttertoast.showToast(msg: "An error occurred. Please try again.");
    }
  }
}