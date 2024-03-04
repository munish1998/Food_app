// ignore_for_file: camel_case_types, file_names, unnecessary_overrides, unused_local_variable, avoid_print

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
// ignore: depend_on_referenced_packages

class bannerController extends GetxController {
  RxList<String> bannerUrls = RxList<String>([]);

  @override
  void onInit() {
    super.onInit();
    fetchBannersUrls();
    // print(bannerUrls);
  }

  //fetch banners
  Future<void> fetchBannersUrls() async {
    try {
      QuerySnapshot bannersSnapshot =
          await FirebaseFirestore.instance.collection('slider_image').get();
      // print(bannersSnapshot);
      if (bannersSnapshot.docs.isNotEmpty) {
        //  print(' bannervalue:$bannerUrls.value');
        bannerUrls.value = bannersSnapshot.docs
            .map((doc) => doc['imageurl'] as String)
            .toList();
        // print(' bannervalue:$bannerUrls.value');
      }
    } catch (e) {
      print("error: $e");
    }
  }
}
