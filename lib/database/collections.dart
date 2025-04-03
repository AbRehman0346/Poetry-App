import 'package:cloud_firestore/cloud_firestore.dart';

class Collections{
  CollectionReference get users => FirebaseFirestore.instance.collection("users");
  CollectionReference get category => FirebaseFirestore.instance.collection("poetry");
  CollectionReference poems(String category) => Collections().category.doc(category).collection("poems");
}
