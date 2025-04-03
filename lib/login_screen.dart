import 'package:flutter/material.dart';
import 'package:peotry_app/route_generator.dart';
import 'package:peotry_app/xutils/xtext.dart';
import 'package:peotry_app/xutils/xtextfield.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Image.asset("assets/images/flowers.jpg"),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 0),
            child: Column(
              children: [
                XText("Poetry", size: 28, bold: true),
                height(10),
                const TextField(
                  decoration: InputDecoration(
                    labelText: "Email"
                  ),
                ),
                height(10),
                const TextField(
                  decoration: InputDecoration(
                      labelText: "Password"
                  ),
                ),
                height(30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Flexible(
                        flex: 1,
                        child: XText("Forgot Password", size: 12, color: Colors.grey),
                    ),
                    Flexible(
                        flex: 2,
                        child: ElevatedButton(onPressed: null, child: XText("Login", bold: true),
                        ),
                    ),
                    Flexible(
                        flex: 2,
                        child: GestureDetector(
                            onTap: (){
                              Navigator.push(context, RouteGenerator.generateRoute(RouteSettings(name: Routes.registerScreen)));
                            },
                            child: XText("Register", bold: true)),
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
