
// Design Custom snakbar widget for use succesfull or error message show in app
// Use Getx for show snakbar in app
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void customSnakbar({required String title,required String message,bool isError = false}){
  Get.snackbar(
    title,
    message,
    snackPosition: SnackPosition.BOTTOM,
    backgroundColor: isError ? Colors.red : Colors.green,
    colorText: Colors.white,
    borderRadius: 10,
    margin: const EdgeInsets.all(10),
    duration: const Duration(seconds: 3),
    isDismissible: true,
    dismissDirection: DismissDirection.horizontal,
    forwardAnimationCurve: Curves.easeOutBack,
    reverseAnimationCurve: Curves.easeInBack,
    icon: const Icon(Icons.info_outline),
    shouldIconPulse: true,
    // mainButton: TextButton(
    //   onPressed: (){},
    //   child: Text("Retry",style: TextStyle(color: Colors.white),),
    // ),
    padding: const EdgeInsets.all(10),
    progressIndicatorBackgroundColor: Colors.blueGrey,
  );
}