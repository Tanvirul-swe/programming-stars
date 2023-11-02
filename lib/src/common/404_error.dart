// ignore_for_file: file_names

import 'package:flutter/material.dart';

class Error404Screen extends StatelessWidget {
  const Error404Screen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          
          Positioned(
            bottom: MediaQuery.of(context).size.height * 0.15,
            left: MediaQuery.of(context).size.width * 0.3,
            right: MediaQuery.of(context).size.width * 0.3,
            child: TextButton(
              onPressed: () {
                Navigator.of(context).popAndPushNamed('/Login');
              },
              child: Text(
                "Go Home".toUpperCase(),
                style: const TextStyle(color: Colors.white),
              ),
            ),
          )
        ],
      ),
    );
  }
}
