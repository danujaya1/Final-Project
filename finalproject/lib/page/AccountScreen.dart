import 'package:finalproject/controller/authcontroller.dart';
import 'package:finalproject/routes/route_name.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class AccountScreen extends StatelessWidget {
  final AuthController authcontroller = AuthController();
  @override
  Widget build(BuildContext context) {
    FirebaseAuth auth = FirebaseAuth.instance;
    if (auth.currentUser != null) {
      print(auth.currentUser!.email);
    }
    return Scaffold(
        body: Center(
      child: SingleChildScrollView(
        child: Column(
          children: [
            Padding(padding: EdgeInsets.only(top: 55)),
            Text(
              "About Me",
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
            ),
            SizedBox(
              height: 30,
            ),
            CircleAvatar(
              radius: 50,
              backgroundImage: AssetImage('assets/img/danujaya.jpeg'),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              child: FutureBuilder<String?>(
                future: authcontroller.getCurrentUsername(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return CircularProgressIndicator();
                  } else if (snapshot.hasError) {
                    return Text('Error: ${snapshot.error}');
                  } else {
                    return Column(
                      children: [
                        Text(
                          '${snapshot.data ?? "Tidak ditemukan"}',
                        ),
                        Text('${auth.currentUser!.email}'),
                      ],
                    );
                  }
                },
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  margin: EdgeInsets.all(8.0),
                  height: 130,
                  width: 300,
                  padding: EdgeInsets.all(18),
                  decoration: BoxDecoration(
                      color: Color(0xffE5E5E5),
                      borderRadius: BorderRadius.circular(10)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Portofolio",
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset('assets/img/flutter.png'),
                          SizedBox(
                            width: 70,
                          ),
                          Image.asset('assets/img/react.png'),
                          SizedBox(
                            width: 70,
                          ),
                          Image.asset('assets/img/kotlin.png'),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('Flutter'),
                          SizedBox(
                            width: 65,
                          ),
                          Text('React'),
                          SizedBox(
                            width: 80,
                          ),
                          Text('Kotlin')
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  margin: EdgeInsets.all(8.0),
                  height: 120,
                  width: 300,
                  padding: EdgeInsets.all(18),
                  decoration: BoxDecoration(
                      color: Color(0xffE5E5E5),
                      borderRadius: BorderRadius.circular(10)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Contact",
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Image.asset('assets/img/linkedin.png'),
                          SizedBox(
                            width: 80,
                          ),
                          Image.asset('assets/img/telegram.png'),
                          SizedBox(
                            width: 80,
                          ),
                          Image.asset('assets/img/gmail.png'),
                        ],
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text('LinkedIn'),
                          SizedBox(
                            width: 60,
                          ),
                          Text('Telegram'),
                          SizedBox(
                            width: 73,
                          ),
                          Text('Gmail')
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Container(
                  margin: EdgeInsets.all(8.0),
                  height: 120,
                  width: 300,
                  padding: EdgeInsets.all(18),
                  decoration: BoxDecoration(
                      color: Color(0xffE5E5E5),
                      borderRadius: BorderRadius.circular(10)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Course",
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset('assets/img/sanbercode.png'),
                          SizedBox(
                            width: 50,
                          ),
                          Image.asset(
                            'assets/img/udemy.png',
                            height: 50,
                          ),
                        ],
                      ),
                    ],
                  ),
                )
              ],
            ),
            SizedBox(
              height: 15,
            ),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xff1F99CC),
                    minimumSize: Size(300, 45)),
                onPressed: () {
                  authcontroller.signOut(context);
                  Get.toNamed(RouteName.loginscreen);
                },
                child: Text(
                  'Logout',
                  style: TextStyle(color: Colors.white),
                ))
          ],
        ),
      ),
    ));
  }
}
