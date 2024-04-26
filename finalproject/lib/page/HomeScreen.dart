import 'package:finalproject/components/News.dart';
import 'package:finalproject/controller/ApiController.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  final ApiController controller = Get.put(ApiController());
  @override
  Widget build(BuildContext context) {
    FirebaseAuth auth = FirebaseAuth.instance;
    if (auth.currentUser != null) {
      print(auth.currentUser!.email);
    }
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      body: Center(
        child: ListView(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: EdgeInsets.only(left: 17),
                  child: Text.rich(
                    TextSpan(children: <TextSpan>[
                      TextSpan(text: 'Hello, ${auth.currentUser!.email}'),
                    ]),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                    margin: EdgeInsets.only(left: 55),
                    child: Image.asset('assets/img/iklan.png'))
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  child: Column(
                    children: [
                      Image.asset('assets/icon/anggota.png'),
                      Text('Keanggotaan')
                    ],
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Container(
                  child: Column(
                    children: [
                      Image.asset('assets/icon/pedoman.png'),
                      Text(
                        'Pedoman \nPramuka',
                        textAlign: TextAlign.center,
                      )
                    ],
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Container(
                  child: Column(
                    children: [
                      Image.asset('assets/icon/kegiatan.png'),
                      Text(
                        'Kegiatan \nPramuka',
                        textAlign: TextAlign.center,
                      )
                    ],
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Container(
                  child: Column(
                    children: [
                      Image.asset('assets/icon/diskusi.png'),
                      Text(
                        'Forum \nDiskusi',
                        textAlign: TextAlign.center,
                      )
                    ],
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(padding: EdgeInsets.only(left: 5)),
                Container(
                  child: Column(
                    children: [
                      Image.asset('assets/icon/survey.png'),
                      Text(
                        'Survey & \nPolling',
                        textAlign: TextAlign.center,
                      )
                    ],
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Container(
                  child: Column(
                    children: [
                      Image.asset('assets/icon/download.png'),
                      Text(
                        'Download \nDokumen',
                        textAlign: TextAlign.center,
                      )
                    ],
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Container(
                  child: Column(
                    children: [
                      Image.asset('assets/icon/kontak.png'),
                      Text('Kontak')
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 5,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, top: 10, bottom: 10),
              child: Text(
                'Berita',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
              ),
            ),
            Container(
              constraints: BoxConstraints(maxHeight: 300),
              margin: EdgeInsets.symmetric(horizontal: 18, vertical: 10),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.2),
                      blurRadius: 4,
                      offset: Offset(0, 4),
                    )
                  ]),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Olahraga',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.w500),
                        ),
                        Text(
                          'Lihat semua',
                          style: TextStyle(color: Color(0xff9D5E1F)),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Expanded(
                      child: Obx(
                        () => controller.postloading.value
                            ? Center(child: CircularProgressIndicator())
                            : News(
                                posts: controller.getposts,
                                isLoading: controller.postloading.value,
                              ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
