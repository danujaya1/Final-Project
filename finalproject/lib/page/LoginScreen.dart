import 'package:finalproject/controller/authcontroller.dart';
import 'package:finalproject/routes/route_name.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final AuthController authcontroller = AuthController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          padding: EdgeInsets.only(top: 40),
          child: Column(
            children: [
              Image.asset(
                'assets/img/logo.png',
                height: 50,
                width: 50,
              ),
              SizedBox(
                height: 50,
              ),
              Container(
                  alignment: Alignment.centerLeft,
                  padding: EdgeInsets.only(left: 20),
                  child: Text(
                    "Selamat datang \nKembali",
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
                  )),
              SizedBox(
                height: 50,
              ),
              Row(
                children: [
                  Padding(padding: EdgeInsets.only(left: 20)),
                  Text(
                    "Email",
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        color: Color(0xff7D8797)),
                  ),
                ],
              ),
              Container(
                width: 370,
                height: 70,
                padding: EdgeInsets.all(8),
                child: TextFormField(
                  controller: authcontroller.emailController,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10))),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Padding(padding: EdgeInsets.only(left: 20)),
                  Text(
                    "Password",
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        color: Color(0xff7D8797)),
                  ),
                ],
              ),
              Container(
                width: 370,
                height: 70,
                padding: EdgeInsets.all(8),
                child: TextFormField(
                  controller: authcontroller.passwordController,
                  obscureText: true,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10))),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(padding: EdgeInsets.symmetric(horizontal: 10)),
                  Text(
                    "Belum punya akun? ",
                    style: TextStyle(color: Color(0xff7D8797)),
                  ),
                  InkWell(
                    onTap: () {
                      Get.toNamed(RouteName.registerscreen);
                    },
                    child: Text(
                      "Daftar.",
                      style: TextStyle(
                        color: Color(0xffFF7A3F),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 120,
                  ),
                  InkWell(
                    onTap: () {},
                    child: Text(
                      "Lupa Password ?",
                      style: TextStyle(
                        color: Color(0xffFF7A3F),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 250,
              ),
              ElevatedButton(
                onPressed: () {
                  authcontroller.loginSubmit(context);
                },
                child: Text(
                  "Masuk",
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
                style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xff1F99CC),
                    minimumSize: Size(350, 45)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
