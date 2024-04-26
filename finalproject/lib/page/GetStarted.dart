import 'package:finalproject/routes/route_name.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GetStarted extends StatefulWidget {
  const GetStarted({super.key});

  @override
  State<GetStarted> createState() => _GetStartedState();
}

class _GetStartedState extends State<GetStarted> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset("assets/img/logo.png"),
            ElevatedButton(
              onPressed: () {
                Get.toNamed(RouteName.registerscreen);
              },
              child: Text(
                "Daftar",
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
              style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xff1F99CC),
                  minimumSize: Size(300, 50)),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              "Atau",
              style: TextStyle(
                  color: Color(0xff1A3665),
                  fontSize: 15,
                  fontWeight: FontWeight.w500),
            ),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () {
                Get.toNamed(RouteName.loginscreen);
              },
              child: Text(
                "Masuk",
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
              style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xff1A3665),
                  minimumSize: Size(300, 50)),
            ),
          ],
        ),
      ),
    );
  }
}
