import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class WatingPage extends StatefulWidget {
  const WatingPage({super.key});

  @override
  State<WatingPage> createState() => _WatingPageState();
}

class _WatingPageState extends State<WatingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
        appBar: AppBar(
          title: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 25,
                backgroundColor: Colors.transparent,
                child: Image.asset("assets/V1.png"),
              ),
              SizedBox(width: 10),
              Text(
                'ZUFS Racing Team',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ],
          ),
          elevation: 0,
          centerTitle: true,
          backgroundColor: Colors.transparent,
        ),
        body: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color(0xFF3366FF),
                  Color(0xFF66CCFF),
                  Color(0xFF3366FF),
                  Color(0xFF66CCFF),
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomCenter,
              ),
            ),
            height: double.infinity,
            width: double.infinity,
            child: Center(child: CircularProgressIndicator(color: Colors.white))));
  }
}
