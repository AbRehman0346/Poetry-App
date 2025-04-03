import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:peotry_app/database/database.dart';
import 'package:peotry_app/database/network_response.dart';
import 'package:peotry_app/route_generator.dart';
import 'package:peotry_app/xutils/xdialogs.dart';
import 'package:peotry_app/xutils/xsnackbar.dart';
import 'package:peotry_app/xutils/xtext.dart';
import '../../xutils/xtextfield.dart';

class CategoriesScreen extends StatefulWidget {
  const CategoriesScreen({super.key});

  @override
  State<CategoriesScreen> createState() => _CategoriesState();
}

class _CategoriesState extends State<CategoriesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: XText("Categories", color: Colors.white),
        leading: GestureDetector(
            onTap: (){
              Navigator.pop(context);
            },
            child: const Icon(Icons.arrow_back, color: Colors.white)),
        actions: [
          TextButton(onPressed: addCategoryDialog, child: XText("Add Category", color: Colors.white))
        ],
      ),
      body: ListView.builder(
        itemCount: 5,
          itemBuilder: (BuildContext context, int index){
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 10),
          child: ListTile(
            onTap: tileOnPressed,
            tileColor: Colors.blue,
            title: XText("Category Name", color: Colors.white, bold: true, size: 18),
          ),
        );
      }),
    );
  }

  void tileOnPressed(){
    Navigator.push(context, RouteGenerator.generateRoute(const RouteSettings(name: Routes.showPoetryScreen, arguments: true)));
  }


  void addCategoryDialog(){
    final categoryNameController = TextEditingController();
    showDialog(context: context, builder: (BuildContext context){
      return SimpleDialog(
        surfaceTintColor: Colors.white,
        backgroundColor: Colors.white,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                XText("Add Category", size: 18, bold: true),
                const SizedBox(height: 10),
                XTextField(
                  controller: categoryNameController,
                  hint: "Category Name",
                  borderRadius: 10,
                  fontSize: 16,
                  elevated: true,
                  borderColor: Colors.white,
                ),
                const SizedBox(height: 20),
                Align(
                  alignment: Alignment.bottomRight,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    onPressed: ()=>addCategory(categoryNameController.text.trim()),
                    child: XText("Add Category"),
                  ),
                ),
              ],
            ),
          )
        ],
      );
    });
  }

  Future<void> addCategory(String categoryName) async {
      if (categoryName.isEmpty){
        XSnackBar(context, "Please Provide Category Name", color: Colors.red);
        return;
      }

      XDialogs.showProgressBar(context);

      NetworkResponse res = await Database().addCategory(categoryName);
      bool result = res.data as bool;

      Navigator.pop(context);
      
      if(result){
        Fluttertoast.showToast(msg: res.message);
        if(mounted){
          Navigator.pop(context);
        }
        return;
      }else{
        XSnackBar(context, res.message, color: Colors.red);
        return;
      }
  }
}
