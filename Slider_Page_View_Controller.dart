import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class PageViewController extends GetxController {
  RxList<String> imageUrls = <String>[].obs; // RxList for image URLs
  RxInt currentPage = 0.obs; // RxInt for current page

  @override
  void onInit() {
    super.onInit();
    fetchImageUrls();
  }

  Future<void> fetchImageUrls() async {
    try {
      QuerySnapshot querySnapshot = await FirebaseFirestore.instance
          .collection('Slider_product_Images')
          .get(); // Fetch documents from Firestore
      if (querySnapshot.docs.isNotEmpty) {
        imageUrls.assignAll(querySnapshot.docs
            .map((doc) => doc['images'] as String)
            .toList()); // Assign image URLs from documents to RxList
      }
    } catch (e) {
      print("Error fetching image URLs: $e");
    }
  }
}
