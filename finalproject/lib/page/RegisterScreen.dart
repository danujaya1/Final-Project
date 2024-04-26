import 'package:finalproject/controller/authcontroller.dart';
import 'package:finalproject/routes/route_name.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
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
                    "Selamat datang \nSilahkan Mendaftar",
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
                  )),
              SizedBox(
                height: 50,
              ),
              Row(
                children: [
                  Padding(padding: EdgeInsets.only(left: 20)),
                  Text(
                    "Username",
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
                  controller: authcontroller.usernameController,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10))),
                ),
              ),
              SizedBox(
                height: 10,
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
                height: 10,
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
              Padding(
                padding: EdgeInsets.only(left: 20),
                child: Row(
                  children: [
                    Text(
                      "Sudah punya akun? ",
                      style: TextStyle(color: Color(0xff7D8797)),
                    ),
                    InkWell(
                      onTap: () {
                        Get.toNamed(RouteName.loginscreen);
                      },
                      child: Text(
                        "Login",
                        style: TextStyle(
                          color: Color(0xffFF7A3F),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 150,
              ),
              ElevatedButton(
                onPressed: () {
                  authcontroller.registerSubmit(context);
                },
                child: Text(
                  "Daftar",
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
