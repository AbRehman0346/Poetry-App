import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:peotry_app/database/auth.dart';
import 'package:peotry_app/database/network_response.dart';
import 'package:peotry_app/models/user_model.dart';
import 'package:peotry_app/route_generator.dart';
import 'package:peotry_app/xutils/xdialogs.dart';
import 'package:peotry_app/xutils/xtext.dart';
import 'package:peotry_app/xutils/xtextfield.dart';

class RegisterScreen extends StatelessWidget {
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  RegisterScreen({super.key});

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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  height(MediaQuery.of(context).size.height * 0.2),
                  XText("Register", size: 32, color: Colors.blue, bold: true),
                  XText("Please Enter Details To Register!"),
                  height(50),
                  TextField(
                    controller: nameController,
                    decoration: const InputDecoration(
                      hintText: "Name",
                    ),
                  ),
                  height(20),
                  TextField(
                    controller: emailController,
                    decoration: const InputDecoration(
                      hintText: "Email",
                    ),
                  ),
                  height(20),
                  TextField(
                    controller: passwordController,
                    decoration: const InputDecoration(
                      hintText: "Password",
                    ),
                  ),
                  height(20),
                  TextField(
                    controller: confirmPasswordController,
                    decoration: const InputDecoration(
                      hintText: "Confirm Password",
                    ),
                  ),
                  height(40),
                  GestureDetector(
                    onTap: ()=>register(context),
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: 50,
                      decoration: BoxDecoration(
                          color: Colors.blue,
                        borderRadius: BorderRadius.circular(20)
                      ),
                      child: Center(
                        child: XText("Register", color: Colors.white, size: 22, bold: true),
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  XText("Already Have an Account? "),
                  GestureDetector(
                      onTap: (){
                        Navigator.pop(context);
                      },
                      child: XText("Login", color: Colors.blue, bold: true))
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> register(BuildContext context) async {
    String name = nameController.text.trim();
    String email = emailController.text.trim();
    String password = passwordController.text.trim();
    String confirmPassword = confirmPasswordController.text.trim();

    if(name == ""){
      Fluttertoast.showToast(msg: "Provide Name");
      return;
    }

    if(email == ""){
      Fluttertoast.showToast(msg: "Provide Email");
      return;
    }

    if(!email.contains("@")){
      Fluttertoast.showToast(msg: "Provide valid Email");
      return;
    }

    if(password == ""){
      Fluttertoast.showToast(msg: "Provide Password");
      return;
    }

    if(confirmPassword != password){
      Fluttertoast.showToast(msg: "Passwords do not match");
      return;
    }

    if(password.length < 6){
      Fluttertoast.showToast(msg: "Password must be at least 6 characters");
      return;
    }


    final user = UserModel(
      name: name,
      email: email,
      password: password,
      role: UserRoles().user,
    );

    XDialogs.showProgressBar(context);

    NetworkResponse res =  await Auth().register(context, user);
    bool isRegistered = res.data as bool;

    Navigator.pop(context);


    if(isRegistered){
      Fluttertoast.showToast(msg: "Signup successful");
      Navigator.pushAndRemoveUntil(context, RouteGenerator.generateRoute(const RouteSettings(name: Routes.home)), (predicate)=>false);
    }else{
      Fluttertoast.showToast(msg: res.message);
    }
  }

}
