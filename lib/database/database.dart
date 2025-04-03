import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:peotry_app/Constants.dart';
import 'package:peotry_app/database/network_response.dart';
import '../models/user_model.dart';
import 'collections.dart';

class Database {
  final Collections _collections = Collections();

  Future<NetworkResponse> storeUserData(UserModel user) async {
    try {
      await _collections.users.doc(user.email).set(user.toJson());
      return NetworkResponse(message: "success", data: true, status: 200);
    } catch (e) {
      return NetworkResponse(message: "Failed to store user data: $e", data: false, status: 400);
    }
  }

  Future<NetworkResponse> getUserData(String email) async {
    try {
      DocumentSnapshot doc = await _collections.users.doc(email).get();
      if (doc.exists) {
        return NetworkResponse(
          status: 200,
            message: "success", data: UserModel.fromJson(doc.data() as Map<String, dynamic>));
      } else {
        return NetworkResponse(
            status: 400,
            message: "User not found");
      }
    } catch (e) {
      return NetworkResponse(
          status: 400,
          message: "Failed to get user data: $e");
    }
  }

  Future<NetworkResponse> addCategory(String category) async {
    if(!Constants.isAdmin){
      return notAdminResponse();
    }

    try {
      await _collections.category.doc(category).set({"category": category});
      return NetworkResponse(
          status: 200,
          message: "success", data: true);
    } catch (e) {
      return NetworkResponse(
          status: 400,
          message: "Failed to add category: $e", data: false);
    }
  }

  Future<NetworkResponse> getCategories() async {
    if(!Constants.isAdmin){
      return notAdminResponse();
    }

    try {
      QuerySnapshot snapshot = await _collections.category.get();
      List<String> categories = snapshot.docs.map((doc) => doc.get("category").toString()).toList();
      return NetworkResponse(
          status: 200,
          message: "success", data: categories);
    } catch (e) {
      return NetworkResponse(
          status: 400,
          message: "Failed to get categories: $e");
    }
  }

  // Frequently Used Responses...
  NetworkResponse notAdminResponse(){
      return NetworkResponse(
          status: 400,
          message: "Restricted", data: null);
  }
}