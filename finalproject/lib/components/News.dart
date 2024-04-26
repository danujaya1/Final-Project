import 'package:flutter/material.dart';
import 'package:finalproject/model/PostModel.dart';

class News extends StatelessWidget {
  final List<Postmodel> posts;
  final bool isLoading;
  News({required this.posts, required this.isLoading});

  @override
  Widget build(BuildContext context) {
    return isLoading
        ? Center(child: CircularProgressIndicator())
        : posts.isEmpty
            ? Center(child: Text('Tidak ada postingan'))
            : Column(
                children:
                    posts.take(2).map((post) => _buildPostItem(post)).toList(),
              );
  }

  Widget _buildPostItem(Postmodel post) {
    return Center(
      child: Container(
        width: 350,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: 130,
              child: Padding(
                padding: EdgeInsets.all(10),
                child: Image.network(
                  post.imageUrl,
                  fit: BoxFit.cover,
                  height: 100,
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      post.title,
                      style: TextStyle(fontWeight: FontWeight.w500),
                    ),
                    SizedBox(height: 35),
                    Text(post.isoDate),
                    Divider(
                      height: 1,
                      thickness: 1,
                      color: Colors.grey,
                    )
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
