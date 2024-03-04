import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class DressScreen extends StatefulWidget {
  const DressScreen({Key? key}) : super(key: key);

  @override
  State<DressScreen> createState() => _DressScreenState();
}

class _DressScreenState extends State<DressScreen> {
  IconData _selectedIcon = Icons.how_to_reg;
  String _selectedSize = '';
  final PageController _pageController = PageController();
  final PageController _pageController1 = PageController();
  int _currentPage = 0;
  int _currentPage1 = 0;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: Scaffold(
        appBar: AppBar(
          leading: const Icon(Icons.arrow_back, color: Colors.black),
          title: const Text(
            'Evening Dress',
            style: TextStyle(
              color: Colors.black,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          actions: [
            IconButton(
              icon: Icon(Icons.search, color: Colors.black),
              onPressed: () {
                // Add your search action here
              },
            ),
            IconButton(
              icon: const Icon(CupertinoIcons.heart, color: Colors.black),
              onPressed: () {
                // Add your favorite action here
              },
            ),
            IconButton(
              icon: const Icon(CupertinoIcons.bag, color: Colors.black),
              onPressed: () {
                // Add your bag action here
              },
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 399,
                child: PageView(
                  controller: _pageController,
                  onPageChanged: (int page) {
                    setState(() {
                      _currentPage = page;
                    });
                  },
                  children: [
                    _buildDressContainer('assets/images/image24.png'),
                    _buildDressContainer('assets/images/image24.png'),
                    _buildDressContainer('assets/images/image24.png'),
                    _buildDressContainer('assets/images/image24.png'),
                    _buildDressContainer('assets/images/image24.png'),
                    // Add more containers as needed
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List<Widget>.generate(
                  5, // Number of containers in PageView
                  (int index) {
                    return ClipOval(
                      child: AnimatedContainer(
                        duration: Duration(milliseconds: 300),
                        height: 10,
                        width: (index == _currentPage) ? 20 : 10,
                        margin: const EdgeInsets.symmetric(horizontal: 5),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: (index == _currentPage)
                              ? Color.fromARGB(255, 195, 90, 52)
                              : Colors.grey[400],
                        ),
                      ),
                    );
                  },
                ),
              ),

              const SizedBox(height: 20), // Add space between the two rows
              Padding(
                padding: const EdgeInsets.only(left: 30, right: 30),
                child: SizedBox(
                  height: 100,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 4, // Number of dress images
                    itemBuilder: (BuildContext context, int index) {
                      return _buildDressImages(
                        'assets/images/image${index + 25}.png',
                        index,
                      );
                    },
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 26, top: 25),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Evening Dress',
                      style: TextStyle(
                          fontSize: 18,
                          color: Colors.black,
                          fontWeight: FontWeight.bold),
                    ),
                    const Text(
                      'Sitlly',
                      style: TextStyle(fontSize: 15, color: Colors.grey),
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
                    const Text(
                      '* * * *',
                      style: TextStyle(fontSize: 25, color: Colors.orange),
                    ),
                    const Text(
                      'About ',
                      style: TextStyle(
                          fontSize: 15,
                          color: Color.fromARGB(149, 0, 0, 0),
                          fontWeight: FontWeight.bold),
                    ),
                    const Text(
                      'In Publishing and design ipsum is a placeholder text',
                      style: TextStyle(fontSize: 14, color: Colors.grey),
                    ),
                    const Text(
                      'Commenly used to demonstrate the form of document',
                      style: TextStyle(fontSize: 14, color: Colors.grey),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Padding(
                      padding: EdgeInsets.only(right: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Select Size',
                            style: TextStyle(
                                fontSize: 15,
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            'Size Chart',
                            style: TextStyle(
                                fontSize: 12,
                                color: Colors.brown,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        _buildSizeContainer('XXS',
                            isSelected: _selectedSize == 'XXS'),
                        SizedBox(width: 13),
                        _buildSizeContainer('XS',
                            isSelected: _selectedSize == 'XS'),
                        SizedBox(width: 13),
                        _buildSizeContainer('S',
                            isSelected: _selectedSize == 'S'),
                        SizedBox(width: 13),
                        _buildSizeContainer('M',
                            isSelected: _selectedSize == 'M'),
                        SizedBox(width: 13),
                        _buildSizeContainer('XL',
                            isSelected: _selectedSize == 'XL'),
                      ],
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                            height: 60,
                            width: 182,
                            decoration: BoxDecoration(color: Colors.black),
                            child: Stack(
                              children: [
                                Center(
                                  child: Padding(
                                    padding: const EdgeInsets.only(right: 12),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        IconButton(
                                          icon: const Icon(
                                              CupertinoIcons.shopping_cart,
                                              color: Colors.white),
                                          onPressed: () {
                                            // Add your heart action here
                                          },
                                        ),
                                        const Text(
                                          'Add to Cart',
                                          style: TextStyle(
                                              fontSize: 20,
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold),
                                        )
                                      ],
                                    ),
                                  ),
                                )
                              ],
                            )),
                        const SizedBox(
                          width: 10,
                        ),
                        Container(
                            height: 60,
                            width: 182,
                            decoration: const BoxDecoration(
                              color: Color.fromARGB(255, 195, 90, 52),
                            ),
                            child: Stack(
                              children: [
                                Center(
                                  child: Padding(
                                    padding: const EdgeInsets.only(right: 12),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        IconButton(
                                          icon: const Icon(CupertinoIcons.bag,
                                              color: Colors.white),
                                          onPressed: () {
                                            // Add your bag action here
                                          },
                                        ),
                                        const Text(
                                          'Buy Now',
                                          style: TextStyle(
                                              fontSize: 20,
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold),
                                        )
                                      ],
                                    ),
                                  ),
                                )
                              ],
                            )),
                      ],
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Container(
                      width: 380,
                      height: 162,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10)),
                      child: Image.asset(
                        'assets/images/image29.png',
                        fit: BoxFit.cover,
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    const Text(
                      'Rating and Review',
                      style: TextStyle(
                          fontSize: 20,
                          color: Colors.black,
                          fontWeight: FontWeight.bold),
                    ),
                    Row(
                      children: [
                        Container(
                          height: 10,
                          width: 10,
                          decoration: BoxDecoration(
                            color: Colors.green,
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: const Stack(
                            children: [
                              Center(
                                child: Icon(
                                  Icons.check,
                                  color: Colors.white,
                                ),
                              )
                            ],
                          ),
                        ),
                        const Text('By Verified Buyers Only',
                            style:
                                TextStyle(fontSize: 15, color: Colors.green)),
                      ],
                    ),
                    Container(
                      height: 98,
                      width: 347,
                      // color: Colors.yellow,
                      child: Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: Row(
                          // mainAxisAlignment: MainAxisAlignment.start,
                          // crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const Padding(
                              padding: EdgeInsets.only(top: 20),
                              child: Column(
                                // crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Text(
                                        '4.5',
                                        style: TextStyle(
                                            fontSize: 12, color: Colors.black),
                                      ),
                                      Text(
                                        '*',
                                        style: TextStyle(
                                            fontSize: 20, color: Colors.green),
                                      )
                                    ],
                                  ),
                                  Text(
                                    '24 Rating',
                                    style: TextStyle(
                                        fontSize: 12, color: Colors.grey),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(
                              width: 80,
                            ),
                            Container(
                              height: 98,
                              width: 199,
                              // color: Colors.red,
                              child: Column(
                                children: [
                                  _buildRatingRow(
                                      5, 7), // Rating row with rating 5 and 7
                                  _buildRatingRow(
                                      4, 6), // Rating row with rating 4 and 6
                                  _buildRatingRow(
                                      3, 5), // Rating row with rating 3 and 5
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const Text(
                      'Customer Also Liked',
                      style: TextStyle(
                          fontSize: 20,
                          color: Colors.black,
                          fontWeight: FontWeight.bold),
                    ),
                    const Text(
                      'Super Sale',
                      style: TextStyle(
                          fontSize: 15,
                          color: Colors.grey,
                          fontWeight: FontWeight.bold),
                    ),
                    SingleChildScrollView(
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
                                                bottomRight:
                                                    Radius.circular(15),
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
                                  style: TextStyle(
                                      fontSize: 15, color: Colors.grey),
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
                          Container(
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
                                        'assets/images/image30.png',
                                        //  scale: 0.1,
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
                                                bottomRight:
                                                    Radius.circular(15),
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
                                  style: TextStyle(
                                      fontSize: 15, color: Colors.grey),
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
                          Container(
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
                                                bottomRight:
                                                    Radius.circular(15),
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
                                  style: TextStyle(
                                      fontSize: 15, color: Colors.grey),
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
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
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
                shape: BoxShape.circle, color: Colors.brown),
            child: const Center(
              child: Icon(
                Icons.add,
                color: Colors.white,
              ),
            ),
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      ),
    );
  }

  Widget _buildDressContainer(String imagePath) {
    return Container(
      width: 430,
      decoration: const BoxDecoration(),
      child: Stack(
        children: [
          Image.asset(
            imagePath,
            fit: BoxFit.cover,
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.grey[200],
                  ),
                  child: IconButton(
                    icon: const Icon(Icons.share, color: Colors.black),
                    onPressed: () {
                      // Add your share action here
                    },
                  ),
                ),
                SizedBox(width: 10),
                Container(
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.red,
                  ),
                  child: IconButton(
                    icon: const Icon(Icons.favorite, color: Colors.white),
                    onPressed: () {
                      // Add your favorite action here
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDressImages(String imagePath, int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _pageController.animateToPage(
            index,
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeInOut,
          );
        });
      },
      child: Padding(
        padding: const EdgeInsets.all(2.0),
        child: Container(
          width: 80,
          decoration: BoxDecoration(),
          child: Stack(
            children: [
              Image.asset(
                imagePath,
                fit: BoxFit.cover,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSizeContainer(String size, {bool isSelected = false}) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedSize = size;
        });
      },
      child: Container(
        height: 44,
        width: 66,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.grey, width: 2),
          color: isSelected ? Colors.black : Colors.transparent,
        ),
        child: Center(
          child: Text(
            size,
            style: TextStyle(
              fontSize: 12,
              color: isSelected ? Colors.white : Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildRatingRow(int rating1, int rating2) {
    // Calculate the percentage of the progress
    double progress = (rating1 / 5) * 100;

    // Determine the color based on the rating
    Color progressColor;
    if (rating1 >= 4) {
      progressColor = Colors.green; // Green color for good ratings
    } else {
      progressColor = Colors.red; // Red color for low ratings
    }

    return Row(
      children: [
        Text(
          rating1.toString(),
          style: TextStyle(fontSize: 20, color: Colors.black),
        ),
        const Text(
          '*',
          style: TextStyle(fontSize: 20, color: Colors.green),
        ),
        const SizedBox(
          width: 5,
        ),
        Container(
          width: 145,
          height: 4,
          color: Colors.red,
          child: LinearProgressIndicator(
            backgroundColor:
                Colors.grey, // Background color of the progress bar
            valueColor: AlwaysStoppedAnimation<Color>(
                progressColor), // Color of the progress bar
            value: progress / 100, // Value of the progress bar (percentage)
          ),
        ),
        const SizedBox(
          width: 5,
        ),
        Text(
          rating2.toString(),
          style: TextStyle(fontSize: 20, color: Colors.black),
        ),
      ],
    );
  }
}
