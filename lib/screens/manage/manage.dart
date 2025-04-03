import 'package:flutter/material.dart';
import 'package:peotry_app/route_generator.dart';
import 'package:peotry_app/xutils/xtext.dart';
import 'package:peotry_app/xutils/xtextfield.dart';

class ManageScreen extends StatefulWidget {
  const ManageScreen({super.key});

  @override
  State<ManageScreen> createState() => _ManageScreenState();
}

class _ManageScreenState extends State<ManageScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Manage Screen"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
        child: ListView(
          children: [
            ListTile(
              title: XText("Categories", bold: true),
              tileColor: Colors.white,
              onTap: onPressed,
            ),
          ],
        ),
      ),
    );
  }

  void onPressed(){
    Navigator.push(context, RouteGenerator.generateRoute(const RouteSettings(name: Routes.categoriesScreen)));
  }
}
