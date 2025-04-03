import 'package:flutter/material.dart';
import 'package:peotry_app/AppColors.dart';
import 'package:peotry_app/Constants.dart';
import 'package:peotry_app/route_generator.dart';
import 'package:peotry_app/xutils/XNetworkImage.dart';
import 'package:peotry_app/xutils/circularProfilePic.dart';
import 'package:peotry_app/xutils/xtext.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    Widget height(double height){
      return SizedBox(
        height: height,
      );
    }
    Widget width(double width){
      return SizedBox(
        width: width,
      );
    }

    return Scaffold(
      backgroundColor: 	AppColors.primaryBackground,
      body: Stack(
        children: [
          // Appbar...
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.35,
            color: Colors.blue,
            child: SafeArea(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // First half of width
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          //Go back widget
                          // Row(
                          //   children: [
                          //       const Icon(Icons.arrow_back, color: Colors.white, size: 18),
                          //       width(5),
                          //       XText("Go back", color: Colors.white),
                          //   ],
                          // ),
                          height(40),
                          XText("Poetry", size: 28, color: Colors.white, bold: true),
                          XText("Total Poetry: 100", color: Colors.white),
                        ],
                      ),
                      // Second Half of width
                      Column(
                        children: [
                            Row(
                              children: [
                                if(Constants.isAdmin)
                                  TextButton(onPressed: gotoManageScreen, child: XText("Manage", color: Colors.white, bold: true)),
                                width(10),
                                GestureDetector(
                                  onTap: (){
                                    Navigator.push(context, RouteGenerator.generateRoute(const RouteSettings(name: Routes.loginScreen)));
                                  },
                                    child: Constants.isLoggedIn ?
                                        // Profile Name
                                        SizedBox(
                                            width: MediaQuery.of(context).size.width * 0.3,
                                            child: Text("Hello, ${Constants.user!.name}", style: const TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold, overflow: TextOverflow.ellipsis))) :
                                        TextButton(onPressed: gotoLoginScreen, child: const Text("Login", style: const TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),)),
                                ),
                              ],
                            ),
                        ],
                      )
                    ],
                  ),
                ),
            ),
          ),
          Column(
            children: [
              height(MediaQuery.of(context).size.height * 0.23),
              Expanded(
                child: ListView.builder(
                  itemCount: 20,
                    itemBuilder: (BuildContext context, int index){
                  return GestureDetector(
                    onTap: (){
                      Navigator.push(context, RouteGenerator.generateRoute(const RouteSettings(name: Routes.showPoetryScreen)));
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.white,
                        boxShadow: const [
                          BoxShadow(
                            color: Colors.grey,
                            offset: Offset(0, 0),
                            spreadRadius: 0,
                            blurRadius: 5,
                          ),
                        ],
                      ),
                      child: Row(
                        children: [
                          ClipOval(
                            clipBehavior: Clip.antiAliasWithSaveLayer,
                            child: XNetworkImage(
                                url: "https://media.istockphoto.com/id/636379014/photo/hands-forming-a-heart-shape-with-sunset-silhouette.jpg?s=612x612&w=0&k=20&c=CgjWWGEasjgwia2VT7ufXa10azba2HXmUDe96wZG8F0=",
                              width: 50,
                              height: 50,
                              fit: BoxFit.cover,
                            ),
                          ),
                          width(15),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              XText("Category ${index+1}", bold: true),
                              XText("Total Poetry: 100", size: 12),
                            ],
                          )
                        ],
                      ),
                    ),
                  );
                }),
              ),
            ],
          )
        ],
      ),
    );
  }

  void gotoManageScreen(){
    Navigator.push(context, RouteGenerator.generateRoute(const RouteSettings(name: Routes.manageScreen)));
  }

  void gotoLoginScreen(){
    Navigator.push(context, RouteGenerator.generateRoute(const RouteSettings(name: Routes.loginScreen)));
  }
}
