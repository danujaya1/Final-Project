import 'package:finalproject/controller/ApiController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class NewsScreen extends StatelessWidget {
  final ApiController controller = Get.put(ApiController());
  final DateFormat _dateFormat = DateFormat('EEEE');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('News'),
      ),
      body: Obx(
        () => controller.postloading.value
            ? Center(child: CircularProgressIndicator())
            : controller.getposts.isEmpty
                ? Center(child: Text('No data available'))
                : ListView.builder(
                    itemCount: 1,
                    itemBuilder: (context, index) {
                      var post = controller.getposts.first;
                      String formattedDate =
                          _dateFormat.format(DateTime.parse(post.isoDate));
                      return Padding(
                        padding: const EdgeInsets.all(18),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Container(
                              height: 200,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                image: post.imageUrl.isNotEmpty
                                    ? DecorationImage(
                                        image: NetworkImage(post.imageUrl),
                                        fit: BoxFit.cover,
                                      )
                                    : null,
                              ),
                            ),
                            SizedBox(height: 10),
                            Text(
                              post.isoDate,
                              style: TextStyle(fontSize: 12),
                            ),
                            SizedBox(height: 10),
                            Text(
                              post.title,
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                              textAlign: TextAlign.center,
                            ),
                            SizedBox(height: 10),
                            Text(
                              post.contentSnippet,
                              maxLines: 5,
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.justify,
                            ),
                            SizedBox(
                              height: 50,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Tahukah kamu?',
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w600),
                                ),
                                Text(
                                  'Lihat semua',
                                  style: TextStyle(color: Color(0xff52575C)),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            GridView.builder(
                              shrinkWrap: true,
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                crossAxisSpacing: 10,
                              ),
                              itemCount: 2,
                              itemBuilder: (context, index) {
                                var post = controller.getposts[index];
                                return GestureDetector(
                                  child: Container(
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(10),
                                        boxShadow: [
                                          BoxShadow(
                                              color:
                                                  Colors.black.withOpacity(0.9),
                                              blurRadius: 0.1)
                                        ]),
                                    child: Column(
                                      children: [
                                        Container(
                                          height: 90,
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.vertical(
                                                top: Radius.circular(10)),
                                            image: post.imageUrl.isNotEmpty
                                                ? DecorationImage(
                                                    image: NetworkImage(
                                                        post.imageUrl),
                                                    fit: BoxFit.cover,
                                                  )
                                                : null,
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(5),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                post.title,
                                                textAlign: TextAlign.justify,
                                                style: TextStyle(
                                                  fontWeight: FontWeight.w600,
                                                ),
                                              ),
                                              SizedBox(
                                                height: 5,
                                              ),
                                              Text(
                                                formattedDate,
                                                textAlign: TextAlign.left,
                                                style: TextStyle(
                                                    color: Color(0xff9A9A9B)),
                                              )
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              },
                            )
                          ],
                        ),
                      );
                    },
                  ),
      ),
    );
  }
}
