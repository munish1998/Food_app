import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:foods_app/Controllers/Slider_Image_Controller.dart';

class BannerWidget extends StatefulWidget {
  const BannerWidget({Key? key}) : super(key: key);

  @override
  State<BannerWidget> createState() => _BannerWidgetState();
}

class _BannerWidgetState extends State<BannerWidget> {
  final CarouselController carouselController = CarouselController();
  final bannerController _bannerController = Get.put(bannerController());

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Obx(() {
        if (_bannerController.bannerUrls.isEmpty) {
          return CircularProgressIndicator();
        } else {
          return CarouselSlider(
            items: _bannerController.bannerUrls
                .map(
                  (imageUrl) => ClipRRect(
                    borderRadius: BorderRadius.circular(10.0),
                    child: CachedNetworkImage(
                      imageUrl: imageUrl,
                      fit: BoxFit.cover,
                      width: MediaQuery.of(context).size.width - 10,
                      placeholder: (context, url) => const ColoredBox(
                        color: Colors.white,
                        child: Center(
                          child: CupertinoActivityIndicator(),
                        ),
                      ),
                      errorWidget: (context, url, error) => Icon(Icons.error),
                    ),
                  ),
                )
                .toList(),
            options: CarouselOptions(
              scrollDirection: Axis.horizontal,
              autoPlay: true,
              aspectRatio: 2.5,
              viewportFraction: 1,
            ),
          );
        }
      }),
    );
  }
}
