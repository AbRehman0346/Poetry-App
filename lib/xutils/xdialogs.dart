import 'package:flutter/material.dart';
import 'package:peotry_app/xutils/xtext.dart';

class XDialogs{
  static void showProgressBar(BuildContext context) {
    showDialog(
      barrierDismissible: true,
      context: context,
      builder: (_) => const AlertDialog(
        backgroundColor: Colors.transparent,
        content: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircularProgressIndicator(
                color: Colors.black,
              ),
            ]),
      ),
    );
  }

  static void showDangerDialog(BuildContext context, {
    required String title,
    required String content,
    void Function()? onPressed,
    String buttonText = "OK",
  }){
    showDialog(context: context, builder: (context){
      return SimpleDialog(
        contentPadding: const EdgeInsets.all(15),
        children: [
          XText(title,
            size: 20,
            bold: true,

          ),
          const SizedBox(height: 20),
          Text(content),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              ElevatedButton(onPressed: (){
                if(onPressed == null){
                  Navigator.pop(context);
                  return;
                }
                onPressed();
              }, child: Text(buttonText)),
            ],
          )
        ],
      );
    });
  }

  static void showWarningDialog(BuildContext context, {
    required String title,
    required String content,
    void Function()? onPressed,
    String buttonText = "OK",
  }){
    showDialog(context: context, builder: (context){
      return SimpleDialog(
        contentPadding: const EdgeInsets.all(15),
        children: [
          XText(title,
            size: 20,
            bold: true,

          ),
          const SizedBox(height: 20),
          Text(content),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              ElevatedButton(onPressed: (){
                if(onPressed == null){
                  Navigator.pop(context);
                  return;
                }
                onPressed();
              }, child: Text(buttonText)),
            ],
          )
        ],
      );
    });
  }

  static void showSuccessDialog(BuildContext context, {
    required String title,
    required String content,
    void Function()? onPressed,
    String buttonText = "OK",
  }){
    showDialog(context: context, builder: (context){
      return SimpleDialog(
        contentPadding: const EdgeInsets.all(15),
        children: [
          XText(title,
            size: 20,
            bold: true,

          ),
          const SizedBox(height: 20),
          Text(content),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              ElevatedButton(onPressed: (){
                if(onPressed == null){
                  Navigator.pop(context);
                  return;
                }
                onPressed();
              }, child: Text(buttonText)),
            ],
          )
        ],
      );
    });
  }

  showSnackBar(BuildContext context, {
    required String content,
  }){
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(content)));
  }

  void showQuestionDialog(BuildContext context,
  {
    required String title,
    required String msg,
    String yesButtonText = "Yes",
    String noButtonText = "Nope",
    required void Function() onYesPressed,
    void Function()? onNoPressed,
  }
      ){
    showDialog(context: context, builder: (BuildContext context){
      return SimpleDialog(
        contentPadding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.white,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 10),
              XText(title, size: 20),
              const SizedBox(height: 10),
              XText(msg),
              const SizedBox(height: 10),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TextButton(onPressed: (){
                if(onNoPressed == null){
                  Navigator.pop(context);
                  return;
                }
                onNoPressed();
              }, child: Text(noButtonText)),
              TextButton(onPressed: onYesPressed, child: Text(yesButtonText)),
            ],
          ),
        ],
      );
    });
  }
}