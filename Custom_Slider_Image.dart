import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:foods_app/Controllers/Slider_Page_View_Controller.dart';

class CustomPageView extends StatelessWidget {
  final PageViewController controller = Get.put(PageViewController());

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Obx(() => controller.imageUrls.isEmpty
            ? CircularProgressIndicator() // Show a loading indicator while data is being fetched
            : Container(
                width: double.infinity,
                height: 265,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Center(
                    child: Container(
                      width: 390,
                      height: 215,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                      ),
                      child: PageView.builder(
                        onPageChanged: (index) {
                          controller.currentPage.value = index;
                        },
                        itemCount: controller.imageUrls.length,
                        itemBuilder: (context, index) {
                          return Container(
                            margin: EdgeInsets.symmetric(horizontal: 10),
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image:
                                    NetworkImage(controller.imageUrls[index]),
                                fit: BoxFit.cover,
                              ),
                              borderRadius: BorderRadius.circular(25),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ),
              )),
        SizedBox(height: 10),
        Obx(() => Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                controller.imageUrls.length,
                (index) => Container(
                  margin: EdgeInsets.symmetric(horizontal: 5),
                  width: 20,
                  height: 5,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: controller.currentPage == index
                        ? const Color.fromARGB(255, 195, 90, 52)
                        : Colors.grey,
                  ),
                ),
              ),
            )),
      ],
    );
  }
}
