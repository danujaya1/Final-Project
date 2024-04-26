import 'dart:async';
import 'dart:convert' as convert;

import 'package:finalproject/model/PostModel.dart';
import 'package:http/http.dart' as http;

class Services {
  Future<List<Postmodel>?> getallpost() async {
    try {
      var response = await http
          .get(Uri.parse(
              'https://berita-indo-api-next.vercel.app/api/cnn-news/olahraga'))
          .timeout(const Duration(seconds: 10), onTimeout: () {
        throw TimeoutException("Connection time out try again");
      });

      if (response.statusCode == 200) {
        final jsonResponse = convert.jsonDecode(response.body);

        if (jsonResponse.containsKey('data')) {
          final List<dynamic> data = jsonResponse['data'];

          if (data != null && data.isNotEmpty) {
            return data.map<Postmodel>((e) => Postmodel.fromJson(e)).toList();
          }
        }
      }

      return null;
    } on TimeoutException catch (_) {
      print("response time out");
      return null;
    } catch (error) {
      print("Error: $error");
      return null;
    }
  }
}
