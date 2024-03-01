import 'package:flutter/material.dart';
import 'dart:async';


class Fobixo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(kToolbarHeight),
          child: AppBar(
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Text(
                      'Fob',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.blue,
                      ),
                    ),
                    Text(
                      'ixo',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.orange,
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    IconButton(
                      icon: Icon(Icons.notifications),
                      onPressed: () {
                        // Add notification icon onPressed functionality
                      },
                    ),
                    IconButton(
                      icon: Icon(Icons.account_circle),
                      onPressed: () {
                        // Add profile icon onPressed functionality
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10.0),
          child: Column(
            children: [
              ImageSlider(),
              SizedBox(height: 20), // Add some space between the slider and cards
              Expanded(
                flex: 3,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      MyCard(
                        name: 'Laxmi Super Market',
                        rating: '4.1',
                        numRatings: '(176 Ratings)',
                        address: 'New Link Road Andheri West, Mumbai',
                        imageName: 'Mart.jpg',
                      ),
                      MyCard(
                        name: 'DMart',
                        rating: '4.3',
                        numRatings: '(550 Ratings)',
                        address: 'Delhi',
                        imageName: 'Dmart.jpg',
                      ),
                      MyCard(
                        name: 'BigBazar',
                        rating: '4.0',
                        numRatings: '(250 Ratings)',
                        address: 'Mumbai',
                        imageName: 'BigBazar.jpeg',
                      ),
                      MyCard(
                        name: 'Fortune Mart',
                        rating: '4.5',
                        numRatings: '(150 Ratings)',
                        address: 'Pune',
                        imageName: 'FortuneMart.jpg',
                      ),
                      MyCard(
                        name: 'Jio Mart',
                        rating: '4.6',
                        numRatings: '(800 Ratings)',
                        address: 'Navi Mumbai',
                        imageName: 'JioMart.jpg',
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ImageSlider extends StatefulWidget {
  @override
  _ImageSliderState createState() => _ImageSliderState();
}

class _ImageSliderState extends State<ImageSlider> {
  late PageController _pageController;
  late Timer _timer;
  int _currentPage = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: _currentPage);

    _timer = Timer.periodic(Duration(seconds: 2), (Timer timer) {
      // Calculate the next page index, ensuring endless circular scrolling
      _currentPage =
          (_pageController.page!.toInt() + 1) % 8; // Move to the next page

      if (_pageController.hasClients) {
        _pageController.animateToPage(
          _currentPage,
          duration: Duration(milliseconds: 500),
          curve: Curves.easeInOut,
        );
      }
    });

    // Handle page transitions to continue scrolling
    _pageController.addListener(() {
      if (_pageController.page!.floor() - _currentPage.floor() >= 1.0) {
        // Jump to the beginning to maintain continuous scrolling
        _pageController.jumpToPage(0);
        _currentPage = 0;
      }
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: PageView.builder(
        controller: _pageController,
        scrollDirection: Axis.horizontal,
        onPageChanged: (int page) {
          setState(() {
            _currentPage = page;
          });
        },
        itemBuilder: (BuildContext context, int index) {
          return Image.asset(
            'lib/images/${[
              'One',
              'Two',
              'Three',
              'Four',
              'Five',
              'Six',
              'Seven',
              'Eight'
            ][index]}.jpg',
            fit: BoxFit.cover,
          );
        },
        itemCount: 8,
      ),
    );
  }
}

class MyCard extends StatelessWidget {
  final String name;
  final String rating;
  final String numRatings;
  final String address;
  final String imageName;

  MyCard({
    required this.name,
    required this.rating,
    required this.numRatings,
    required this.address,
    required this.imageName,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      elevation: 4.0,
      margin: EdgeInsets.all(10.0),
      child: Container(
        height: 400,
        child: Column(
          children: [
            Stack(
              children: [
                Image.asset(
                  'lib/images/$imageName',
                  width: double.infinity,
                  height: 200.0,
                  fit: BoxFit.cover,
                ),
                Positioned(
                  bottom: 10.0,
                  left: 10.0,
                  child: Container(
                    padding: EdgeInsets.all(5.0),
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.5),
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                    child: Row(
                      children: [
                        Icon(
                          Icons.star,
                          size: 12.0,
                          color: Colors.yellow,
                        ),
                        Text(
                          rating,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 12.0,
                          ),
                        ),
                        Text(
                          numRatings,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 12.0,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        name,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20.0,
                        ),
                      ),
                      Icon(
                        Icons.verified,
                        size: 16.0,
                        color: Colors.blue,
                      ),
                    ],
                  ),
                  SizedBox(height: 5.0),
                  Text(
                    address,
                    style: TextStyle(
                      fontSize: 14.0,
                    ),
                  ),
                  SizedBox(height: 20.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        width: 150,
                        decoration: BoxDecoration(
                          color: Colors.orange,
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                        child: TextButton(
                          onPressed: () {},
                          child: Text(
                            'Show Number',
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                      Container(
                        width: 150,
                        decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                        child: ElevatedButton(
                          onPressed: () {},
                          child: Text(
                            'Get Best Deal',
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                          style: ElevatedButton.styleFrom(
                            primary: Colors.blue,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}