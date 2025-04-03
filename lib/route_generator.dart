import 'package:flutter/material.dart';
import 'package:peotry_app/login_screen.dart';
import 'package:peotry_app/screens/home_screen.dart';
import 'package:peotry_app/screens/manage/categories.dart';
import 'package:peotry_app/screens/manage/manage.dart';
import 'package:peotry_app/screens/register_screen.dart';
import 'package:peotry_app/screens/show_peotry_screen.dart';

class Routes {
  static const String home = "/";
  static const String showPoetryScreen = "show-poetry-screen";
  static const String loginScreen = "login-screen";
  static const String registerScreen = "register-screen";
  static const String manageScreen = "manage-screen";
  static const String categoriesScreen = "categories-screen";
}

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;

    switch (settings.name) {
      case Routes.home: //HomeScreen
        return MaterialPageRoute(builder: (_) => const HomeScreen());
      case Routes.showPoetryScreen: {
        bool value;
        if(args == null){
          value = false;
        }else{
          value = args as bool;
        }
        return MaterialPageRoute(builder: (_)=> ShowPeotryScreen(showAdvanceOptions: value));
      }
      case Routes.loginScreen:
        return MaterialPageRoute(builder: (_)=> const LoginScreen());
      case Routes.registerScreen:
        return MaterialPageRoute(builder: (_)=> RegisterScreen());
      case Routes.manageScreen:
        return MaterialPageRoute(builder: (_)=> const ManageScreen());
      case Routes.categoriesScreen:
        return MaterialPageRoute(builder: (_)=> const CategoriesScreen());

      default: //Error Screen
        return MaterialPageRoute(builder: (_) => const ErrorScreen());
    }
  }
}

class ErrorScreen extends StatelessWidget {
  const ErrorScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        "Route Couldn't Found!",
        style: TextStyle(fontSize: 20),
        maxLines: 3,
      ),
    );
  }
}
