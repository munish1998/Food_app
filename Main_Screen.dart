import 'package:flutter/material.dart';
import 'package:foods_app/Models/Category_Model.dart';
import 'package:foods_app/Models/Products_Models.dart';
import 'package:foods_app/Widgets/All_Products_Widget.dart';
import 'package:foods_app/Widgets/Banner_Widget.dart';
import 'package:foods_app/Widgets/Category_Widget.dart';
import 'package:foods_app/Widgets/Custom_Drawer_Widget.dart';
import 'package:foods_app/Widgets/Heading_Widget.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      drawer: CustomDrawer(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            BannerWidget(),
            HeadingWidget(
                headingTitle: 'munish',
                headingSubTitle: 'rai',
                buttonText: 'See more'),
            BannerWidget(),
            HeadingWidget(
                headingTitle: 'munish',
                headingSubTitle: 'rai',
                buttonText: 'See more'),

            // AllProductsWidget(),
            CategoriesWidget()
          ],
        ),
      ),
    );
  }
}
