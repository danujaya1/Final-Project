import 'package:finalproject/model/PostModel.dart';
import 'package:finalproject/services/services.dart';
import 'package:get/get.dart';

class ApiController extends GetxController {
  var getposts = <Postmodel>[].obs;
  Services services = Services();
  var postloading = true.obs;

  @override
  void onInit() {
    callpostmethod();
    super.onInit();
  }

  Future<void> callpostmethod() async {
    try {
      postloading.value = true;
      var result = await services.getallpost();
      if (result != null) {
        getposts.assignAll(result);
      } else {
        print("null");
      }
    } finally {
      postloading.value = false;
    }
    update();
  }
}
