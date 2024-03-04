import 'package:flutter/material.dart';
import 'package:foods_app/Utils/App_Constant.dart';

class CustomDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: AppConstant.appScendoryColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(20.0),
          bottomRight: Radius.circular(20.0),
        ),
      ),
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          const DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Welcome to Our Store',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                  ),
                ),
                SizedBox(height: 6),
                CircleAvatar(
                  radius: 30,
                  backgroundColor: Colors.white,
                  // Add your profile picture here
                  // backgroundImage: AssetImage('assets/profile.jpg'),
                ),
                SizedBox(height: 6),
                Text(
                  'Munish',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                  ),
                ),
              ],
            ),
          ),
          ListTile(
            leading: Icon(
              Icons.home,
              color: AppConstant.appTextColor,
            ),
            title: Text('Home'),
            onTap: () {
              // Navigate to the home screen
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: Icon(
              Icons.shopping_cart,
              color: AppConstant.appTextColor,
            ),
            title: Text('Cart'),
            onTap: () {
              // Navigate to the cart screen
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: Icon(
              Icons.favorite,
              color: AppConstant.appTextColor,
            ),
            title: Text('Favorites'),
            onTap: () {
              // Navigate to the favorites screen
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: Icon(
              Icons.settings,
              color: AppConstant.appTextColor,
            ),
            title: Text('Settings'),
            onTap: () {
              // Navigate to the settings screen
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: Icon(
              Icons.logout,
              color: AppConstant.appTextColor,
            ),
            title: Text('Logout'),
            onTap: () {
              // Perform logout action
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}
