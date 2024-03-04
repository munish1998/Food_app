import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:foods_app/Login_page.dart';
import 'package:foods_app/Screens/Dress_Screen.dart';
import 'package:foods_app/Screens/Main_Screen.dart';
import 'package:foods_app/Widgets/Category_Widget.dart';
import 'package:foods_app/Widgets/Custom_Drawer_Widget.dart';
import 'package:foods_app/Widgets/Custom_Slider_Image.dart';
import 'package:foods_app/utils.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<String> imageUrls = ['', '', ''];
  int _currentPage = 0;

  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  IconData _selectedIcon = Icons.how_to_reg;
  Future<void> LogOut() async {
    await FirebaseAuth.instance.signOut();
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => LoginPage()));
    Utils.flushBarErrorMessage('LogOut Successfully', context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // drawer: CustomDrawer(),
      body: ListView(
        children: [
          Card(
            elevation: 1,
            child: Container(
                height: 207,
                width: 430,
                // color: Colors.blue,
                child: Stack(
                  children: [
                    Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 65),
                          child: Container(
                            height: MediaQuery.of(context).size.height *
                                0.06, // Adjust height as needed
                            width: MediaQuery.of(context).size.width *
                                0.9, // Adjust width as needed
                            //color: Colors.pink,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Icon(Icons.menu),
                                const SizedBox(
                                  width: 122,
                                  // width: MediaQuery.of(context).size.width * 0.01
                                ),
                                InkWell(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                MainScreen()));
                                  },
                                  child: const Text(
                                    'Home',
                                    style: TextStyle(
                                        fontSize: 20,
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                SizedBox(
                                    width: MediaQuery.of(context).size.width *
                                        0.20),
                                // Heart Icon
                                IconButton(
                                  icon: const Icon(CupertinoIcons.shopping_cart,
                                      color: Colors.black),
                                  onPressed: () {
                                    // Add your heart action here
                                  },
                                ),
                                // Bag Icon
                                IconButton(
                                  icon: const Icon(CupertinoIcons.bag,
                                      color: Colors.black),
                                  onPressed: () {
                                    // Add your bag action here
                                  },
                                ),
                                // IconButton(
                                //   icon: const Icon(Icons.logout, color: Colors.black),
                                //   onPressed: () {
                                //     LogOut();
                                //   },
                                // ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        //  DrawerWidget(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Container(
                              height: 50,
                              width: 330,
                              decoration: BoxDecoration(
                                // color: Colors.green,
                                color: Color.fromARGB(255, 235, 242, 248),
                                borderRadius: BorderRadius.circular(25),
                              ),
                              child: const Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  SizedBox(width: 10),
                                  Icon(Icons.search),
                                  SizedBox(width: 10),
                                  Expanded(
                                    child: TextField(
                                      decoration: InputDecoration(
                                        hintText: 'Search here',
                                        border: InputBorder.none,
                                      ),
                                    ),
                                  ),
                                  SizedBox(width: 10),
                                  Icon(Icons.mic),
                                  SizedBox(width: 10),
                                ],
                              ),
                            ),
                            Icon(Icons.filter_list),
                          ],
                        ),
                      ],
                    ),
                  ],
                )),
          ),
          SizedBox(height: 15),
          Column(
            children: [
              CustomPageView(),
              SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.only(left: 15),
                child: Column(
                  children: [
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          Image.asset('assets/images/image17.png'),
                          SizedBox(width: 10),
                          Image.asset('assets/images/image18.png'),
                          SizedBox(width: 10),
                          Image.asset('assets/images/image17.png'),
                          SizedBox(width: 10),
                          Image.asset('assets/images/image18.png'),
                        ],
                      ),
                    ),
                    //  CategoriesWidget(),
                    const SizedBox(
                      height: 15,
                    ),
                  ],
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(left: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Sale',
                          style: TextStyle(
                              fontSize: 20,
                              color: Colors.black,
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          'See All',
                          style: TextStyle(
                              fontSize: 15,
                              color: Color.fromARGB(255, 195, 90, 52),
                              fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                    Text(
                      'Super summer sale',
                      style: TextStyle(
                          fontSize: 12,
                          color: Colors.grey,
                          fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      Container(
                        width: 140,
                        height: 320,
                        decoration: BoxDecoration(
                            //color: Colors.blue,
                            borderRadius: BorderRadius.circular(20)),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            InkWell(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => DressScreen()));
                              },
                              child: Container(
                                width: 140,
                                height: 211,
                                child: Stack(
                                  children: [
                                    Image.asset(
                                      'assets/images/image19.png',
                                      fit: BoxFit.cover,
                                    ),
                                    Align(
                                      alignment: Alignment.bottomRight,
                                      child: Container(
                                        height: 30,
                                        width: 30,
                                        decoration: const BoxDecoration(
                                            color: Colors.white,
                                            shape: BoxShape.circle),
                                        child: const Center(
                                            child: Icon(
                                          Icons.favorite,
                                          size: 18,
                                          color: Colors.red,
                                        )),
                                      ),
                                    ),
                                    Align(
                                      alignment: Alignment.topLeft,
                                      child: Container(
                                        height: 22,
                                        width: 46,
                                        decoration: const BoxDecoration(
                                          borderRadius: BorderRadius.only(
                                              bottomRight: Radius.circular(15),
                                              topLeft: Radius.circular(15)),
                                          color: Colors.black,
                                          // shape: BoxShape.circle
                                        ),
                                        child: const Center(
                                            child: Text(
                                          '12% off',
                                          style: TextStyle(
                                              fontSize: 10,
                                              color: Colors.white),
                                        )),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            const Text(
                              '* * * *',
                              style:
                                  TextStyle(fontSize: 20, color: Colors.orange),
                            ),
                            const Text(
                              'Sitlly',
                              style:
                                  TextStyle(fontSize: 15, color: Colors.grey),
                            ),
                            const Text(
                              'Evening Dress',
                              style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            ),
                            const Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  '22\$',
                                  style: TextStyle(
                                    fontSize: 18,
                                    color: Colors.blue,
                                  ),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  '18\$',
                                  style: TextStyle(
                                    fontSize: 18,
                                    color: Colors.red,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        width: 15,
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => DressScreen()));
                        },
                        child: Container(
                          width: 140,
                          height: 320,
                          decoration: BoxDecoration(
                              //color: Colors.blue,
                              borderRadius: BorderRadius.circular(20)),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                width: 140,
                                height: 211,
                                child: Stack(
                                  children: [
                                    Image.asset(
                                      'assets/images/image19.png',
                                      fit: BoxFit.cover,
                                    ),
                                    Align(
                                      alignment: Alignment.bottomRight,
                                      child: Container(
                                        height: 30,
                                        width: 30,
                                        decoration: const BoxDecoration(
                                            color: Colors.white,
                                            shape: BoxShape.circle),
                                        child: const Center(
                                            child: Icon(
                                          Icons.favorite,
                                          size: 18,
                                          color: Colors.red,
                                        )),
                                      ),
                                    ),
                                    Align(
                                      alignment: Alignment.topLeft,
                                      child: Container(
                                        height: 22,
                                        width: 46,
                                        decoration: const BoxDecoration(
                                          borderRadius: BorderRadius.only(
                                              bottomRight: Radius.circular(15),
                                              topLeft: Radius.circular(15)),
                                          color: Colors.black,
                                          // shape: BoxShape.circle
                                        ),
                                        child: const Center(
                                            child: Text(
                                          '12% off',
                                          style: TextStyle(
                                              fontSize: 10,
                                              color: Colors.white),
                                        )),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const Text(
                                '* * * *',
                                style: TextStyle(
                                    fontSize: 20, color: Colors.orange),
                              ),
                              const Text(
                                'Sitlly',
                                style:
                                    TextStyle(fontSize: 15, color: Colors.grey),
                              ),
                              const Text(
                                'Evening Dress',
                                style: TextStyle(
                                    fontSize: 18,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold),
                              ),
                              const Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                    '22\$',
                                    style: TextStyle(
                                      fontSize: 18,
                                      color: Colors.blue,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    '18\$',
                                    style: TextStyle(
                                      fontSize: 18,
                                      color: Colors.red,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 15,
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => DressScreen()));
                        },
                        child: Container(
                          width: 140,
                          height: 320,
                          decoration: BoxDecoration(
                              //color: Colors.blue,
                              borderRadius: BorderRadius.circular(20)),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                width: 140,
                                height: 211,
                                child: Stack(
                                  children: [
                                    Image.asset(
                                      'assets/images/image19.png',
                                      fit: BoxFit.cover,
                                    ),
                                    Align(
                                      alignment: Alignment.bottomRight,
                                      child: Container(
                                        height: 30,
                                        width: 30,
                                        decoration: const BoxDecoration(
                                            color: Colors.white,
                                            shape: BoxShape.circle),
                                        child: const Center(
                                            child: Icon(
                                          Icons.favorite,
                                          size: 18,
                                          color: Colors.red,
                                        )),
                                      ),
                                    ),
                                    Align(
                                      alignment: Alignment.topLeft,
                                      child: Container(
                                        height: 22,
                                        width: 46,
                                        decoration: const BoxDecoration(
                                          borderRadius: BorderRadius.only(
                                              bottomRight: Radius.circular(15),
                                              topLeft: Radius.circular(15)),
                                          color: Colors.black,
                                          // shape: BoxShape.circle
                                        ),
                                        child: const Center(
                                            child: Text(
                                          '12% off',
                                          style: TextStyle(
                                              fontSize: 10,
                                              color: Colors.white),
                                        )),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const Text(
                                '* * * *',
                                style: TextStyle(
                                    fontSize: 20, color: Colors.orange),
                              ),
                              const Text(
                                'Sitlly',
                                style:
                                    TextStyle(fontSize: 15, color: Colors.grey),
                              ),
                              const Text(
                                'Evening Dress',
                                style: TextStyle(
                                    fontSize: 18,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold),
                              ),
                              const Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                    '22\$',
                                    style: TextStyle(
                                      fontSize: 18,
                                      color: Colors.blue,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    '18\$',
                                    style: TextStyle(
                                      fontSize: 18,
                                      color: Colors.red,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(left: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'New',
                          style: TextStyle(
                              fontSize: 25,
                              color: Colors.black,
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          'See All',
                          style: TextStyle(
                              fontSize: 15,
                              color: Colors.orange,
                              fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                    Text(
                      'You never seen in before',
                      style: TextStyle(
                          fontSize: 12,
                          color: Colors.grey,
                          fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Container(
                  width: 390,
                  height: 134,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                  ),
                  child: Stack(
                    children: [
                      Align(
                        alignment: Alignment.bottomRight,
                        child: Container(
                          height: 22,
                          width: 46,
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.only(
                                bottomRight: Radius.circular(15),
                                topLeft: Radius.circular(15)),
                            color: Colors.black,
                            // shape: BoxShape.circle
                          ),
                          child: const Center(
                              child: Text(
                            '12% off',
                            style: TextStyle(fontSize: 10, color: Colors.white),
                          )),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                              height: 134,
                              width: 134,
                              decoration: BoxDecoration(
                                  // color: Colors.blue,
                                  borderRadius: BorderRadius.circular(25)),
                              child: Stack(
                                children: [
                                  Image.asset('assets/images/image21.png'),
                                  Align(
                                    alignment: Alignment.topLeft,
                                    child: Container(
                                      height: 30,
                                      width: 30,
                                      decoration: const BoxDecoration(
                                          color: Colors.white,
                                          shape: BoxShape.circle),
                                      child: const Center(
                                          child: Icon(
                                        Icons.favorite,
                                        color: Colors.red,
                                      )),
                                    ),
                                  ),
                                ],
                              )),
                          const SizedBox(
                            width: 15,
                          ),
                          const Padding(
                            padding: EdgeInsets.only(top: 20),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Jacket',
                                  style: TextStyle(
                                      fontSize: 15,
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  'Sitilly',
                                  style: TextStyle(
                                      fontSize: 15,
                                      color: Colors.grey,
                                      fontWeight: FontWeight.bold),
                                ),
                                SizedBox(
                                  height: 1,
                                ),
                                Text(
                                  '* * * *',
                                  style: TextStyle(
                                      fontSize: 20, color: Colors.grey),
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text(
                                      '22\$',
                                      style: TextStyle(
                                        fontSize: 18,
                                        color: Colors.blue,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Text(
                                      '18\$',
                                      style: TextStyle(
                                        fontSize: 18,
                                        color: Colors.red,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  )),
              SizedBox(
                height: 25,
              ),
              Container(
                  width: 390,
                  height: 134,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                  ),
                  child: Stack(
                    children: [
                      Align(
                        alignment: Alignment.bottomRight,
                        child: Container(
                          height: 22,
                          width: 46,
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.only(
                                bottomRight: Radius.circular(15),
                                topLeft: Radius.circular(15)),
                            color: Colors.black,
                            // shape: BoxShape.circle
                          ),
                          child: const Center(
                              child: Text(
                            '12% off',
                            style: TextStyle(fontSize: 10, color: Colors.white),
                          )),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                              height: 134,
                              width: 134,
                              decoration: BoxDecoration(
                                  // color: Colors.blue,
                                  borderRadius: BorderRadius.circular(25)),
                              child: Stack(
                                children: [
                                  Image.asset('assets/images/image22.png'),
                                  Align(
                                    alignment: Alignment.topLeft,
                                    child: Container(
                                      height: 30,
                                      width: 30,
                                      decoration: const BoxDecoration(
                                          color: Colors.white,
                                          shape: BoxShape.circle),
                                      child: const Center(
                                          child: Icon(
                                        Icons.favorite,
                                        size: 18,
                                        color: Colors.red,
                                      )),
                                    ),
                                  ),
                                ],
                              )),
                          const SizedBox(
                            width: 15,
                          ),
                          const Padding(
                            padding: EdgeInsets.only(top: 20),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Jacket',
                                  style: TextStyle(
                                      fontSize: 15,
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  'Sitilly',
                                  style: TextStyle(
                                      fontSize: 15,
                                      color: Colors.grey,
                                      fontWeight: FontWeight.bold),
                                ),
                                SizedBox(
                                  height: 1,
                                ),
                                Text(
                                  '* * * *',
                                  style: TextStyle(
                                      fontSize: 20, color: Colors.grey),
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text(
                                      '22\$',
                                      style: TextStyle(
                                        fontSize: 18,
                                        color: Colors.blue,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Text(
                                      '18\$',
                                      style: TextStyle(
                                        fontSize: 18,
                                        color: Colors.red,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  )),
              SizedBox(
                height: 25,
              ),
              Container(
                  width: 390,
                  height: 134,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                  ),
                  child: Stack(
                    children: [
                      Align(
                        alignment: Alignment.bottomRight,
                        child: Container(
                          height: 22,
                          width: 46,
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.only(
                                bottomRight: Radius.circular(15),
                                topLeft: Radius.circular(15)),
                            color: Colors.black,
                            // shape: BoxShape.circle
                          ),
                          child: const Center(
                              child: Text(
                            '12% off',
                            style: TextStyle(fontSize: 10, color: Colors.white),
                          )),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                              height: 134,
                              width: 134,
                              decoration: BoxDecoration(
                                  // color: Colors.blue,
                                  borderRadius: BorderRadius.circular(25)),
                              child: Stack(
                                children: [
                                  Image.asset('assets/images/image23.png'),
                                  Align(
                                    alignment: Alignment.topLeft,
                                    child: Container(
                                      height: 30,
                                      width: 30,
                                      decoration: const BoxDecoration(
                                          color: Colors.white,
                                          shape: BoxShape.circle),
                                      child: const Center(
                                          child: Icon(
                                        Icons.favorite,
                                        size: 18,
                                        color: Colors.red,
                                      )),
                                    ),
                                  ),
                                ],
                              )),
                          const SizedBox(
                            width: 15,
                          ),
                          const Padding(
                            padding: EdgeInsets.only(top: 20),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Jacket',
                                  style: TextStyle(
                                      fontSize: 15,
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  'Sitilly',
                                  style: TextStyle(
                                      fontSize: 15,
                                      color: Colors.grey,
                                      fontWeight: FontWeight.bold),
                                ),
                                SizedBox(
                                  height: 1,
                                ),
                                Text(
                                  '* * * *',
                                  style: TextStyle(
                                      fontSize: 20, color: Colors.grey),
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text(
                                      '22\$',
                                      style: TextStyle(
                                        fontSize: 18,
                                        color: Colors.blue,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Text(
                                      '18\$',
                                      style: TextStyle(
                                        fontSize: 18,
                                        color: Colors.red,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ))
            ],
          ),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        elevation: 0,
        color: Colors.white,
        shape: const CircularNotchedRectangle(),
        child: Container(
          height: 70,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              IconButton(
                icon: Icon(Icons.home,
                    color: _selectedIcon == Icons.home
                        ? Colors.blue // Set to blue if selected
                        : Colors.grey.shade400),
                onPressed: () {
                  setState(() {
                    _selectedIcon = Icons.home; // Update selected icon
                  });
                },
              ),
              IconButton(
                icon: Icon(Icons.calendar_today,
                    color: _selectedIcon == Icons.calendar_today
                        ? Colors.blue // Set to blue if selected
                        : Colors.grey.shade400),
                onPressed: () {
                  setState(() {
                    _selectedIcon =
                        Icons.calendar_today; // Update selected icon
                  });
                },
              ),
              SizedBox(width: 40), // Adjust the width as needed
              IconButton(
                icon: Icon(Icons.email,
                    color: _selectedIcon == Icons.message
                        ? Colors.blue // Set to blue if selected
                        : Colors.grey.shade400),
                onPressed: () {
                  setState(() {
                    _selectedIcon = Icons.email; // Update selected icon
                  });
                  //  Navigator.push(context, MaterialPageRoute(builder: (context) =>const ChatScreen()));
                },
              ),
              // SizedBox(width: 30), // Adjust the width as needed
              IconButton(
                icon: Icon(Icons.person,
                    color: _selectedIcon == Icons.person
                        ? Colors.blue // Set to blue if selected
                        : Colors.grey.shade400),
                onPressed: () {
                  setState(() {
                    _selectedIcon = Icons.person; // Update selected icon
                  });
                  // Navigator.push(context, MaterialPageRoute(builder: (context) =>const ProfileScreen()));
                },
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Navigator.push(
          //   context,
          //   MaterialPageRoute(
          //     builder: (context) => TopDetails(),
          //   ),
          // );
        },
        shape: CircleBorder(),
        child: Container(
          decoration: const BoxDecoration(
              shape: BoxShape.circle, color: Color.fromARGB(255, 195, 90, 52)),
          child: const Center(
            child: Icon(
              Icons.add,
              color: Colors.white,
            ),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: HomeScreen(),
  ));
}
