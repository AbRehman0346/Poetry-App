import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:peotry_app/AppColors.dart';
import 'package:peotry_app/xutils/xtext.dart';
import 'package:peotry_app/xutils/xtextfield.dart';

class ShowPeotryScreen extends StatefulWidget {
  final bool showAdvanceOptions;
  const ShowPeotryScreen({super.key, this.showAdvanceOptions = false});

  @override
  State<ShowPeotryScreen> createState() => _ShowPeotryScreenState();
}

class _ShowPeotryScreenState extends State<ShowPeotryScreen> {

  Widget _height(double height){
    return SizedBox(height: height);
  }

  Widget _width(double width){
    return SizedBox(width: width);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.white,
      appBar: AppBar(
        title: XText("Poetry Category"),
        actions: [

          if(widget.showAdvanceOptions)
            TextButton(onPressed: addPoetryOnPressed, child: XText("Add Poetry"))
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: List.generate(10, (index){
            return Container(
              margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 8),
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey, width: 3),
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                boxShadow: const [
                  BoxShadow(
                    color: Colors.grey,
                    blurRadius: 5,
                  )
                ]
              ),
              child: Column(
                children: [
                  XText(
                      "haañ dikhā de ai tasavvur phir vo sub.h o shaam tū\ndauḌ pīchhe kī taraf ai gardish-e-ayyām tū",
                      textAlign: TextAlign.center,
                  ),
                  _height(10),
                  XText("Author: Luther", bold: true),
                  _height(10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Row(
                        children: [
                          const Icon(Icons.save, color: Colors.blue),
                          XText("Save", color: Colors.blue, bold: true),
                        ],
                      ),
                      Row(
                        children: [
                          const Icon(Icons.copy, color: Colors.blue),
                          XText("Copy", color: Colors.blue, bold: true),
                        ],
                      ),

                      Row(
                        children: [
                          const Icon(Icons.share, color: Colors.blue),
                          XText("Share", color: Colors.blue, bold: true),
                        ],
                      ),

                      if(widget.showAdvanceOptions)
                        Row(
                          children: [
                            const Icon(Icons.delete, color: Colors.red),
                            XText("Delete", color: Colors.blue, bold: true),
                          ],
                        ),
                    ],
                  ),
                ],
              ),
            );
          }),
        ),
      ),
    );
  }



  Future<void> addPoetryOnPressed() async {
    final poetryController = TextEditingController();
    final authorController = TextEditingController();

    Future<void> addPoetry() async {
      var poetry = poetryController.text.trim();
      var author = authorController.text.trim();

      if(poetry == ""){
        Fluttertoast.showToast(msg: "Provide Poetry");
        return;
      }
      if(author == ""){
        Fluttertoast.showToast(msg: "Provide Author");
        return;
      }
      Fluttertoast.showToast(msg: "Feature still needs to be developed");

    }


      showDialog(context: context, builder: (context){
        return SimpleDialog(
          surfaceTintColor: Colors.white,
          backgroundColor: Colors.white,
          children: [
            Padding(
                padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              child: Column(
                // crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  XText("Add Poetry", size: 20, bold: true),
                  _height(20),
                  XTextField(
                    controller: poetryController,
                      label: "Poetry",
                      minLines: 4,
                    textAlign: TextAlign.center,

                  ),
                  _height(10),
                  XTextField(
                    controller: authorController,
                      label: "Author"
                  ),
                  _height(15),
                  ElevatedButton(onPressed: addPoetry, child: XText("Add Poetry")),
                ],
              ),
            )
          ],
        );
      });
  }
}
