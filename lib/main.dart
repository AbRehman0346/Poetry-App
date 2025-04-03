import 'dart:developer';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:peotry_app/database/network_response.dart';
import 'package:peotry_app/screens/home_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'Constants.dart';
import 'database/database.dart';
import 'firebase_options.dart';
import 'login_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, AsyncSnapshot snap) {
          if(snap.hasData){
            User user = snap.data;
            return FutureBuilder(future: Database().getUserData(user.email!), builder: (context, AsyncSnapshot snap){

              if(!snap.hasData){
                return const Scaffold(
                  body: Center(
                    child: CircularProgressIndicator(),
                  ),
                );
              }

              if(snap.hasError){
                log("Error: ${snap.error}");
                return Scaffold(
                  body: Center(
                    child: Text("Error: ${snap.error}"),
                  ),
                );
              }

              NetworkResponse networkResponse = snap.data;

              if(networkResponse.data == null){
                return Scaffold(
                  body: Center(
                    child: Text("Error: ${networkResponse.message}"),
                  ),
                );
              }
              Constants.user = networkResponse.data;
              return const HomeScreen();

            });
            // User is logged in

          }else{
            // User is not logged in
            return const LoginScreen();
          }
        }
      ),
    );
  }
}

