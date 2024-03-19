//Original code before 11/03/2024

// import 'package:flutter/material.dart';
// import 'dart:async';

// class Fobixo extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         appBar: PreferredSize(
//           preferredSize: Size.fromHeight(kToolbarHeight),
//           child: AppBar(
//             title: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Row(
//                   children: [
//                     Text(
//                       'Fob',
//                       style: TextStyle(
//                         fontWeight: FontWeight.bold,
//                         color: Colors.blue,
//                       ),
//                     ),
//                     Text(
//                       'ixo',
//                       style: TextStyle(
//                         fontWeight: FontWeight.bold,
//                         color: Colors.orange,
//                       ),
//                     ),
//                   ],
//                 ),
//                 Row(
//                   children: [
//                     IconButton(
//                       icon: Icon(Icons.notifications),
//                       onPressed: () {
//                         // Add notification icon onPressed functionality
//                       },
//                     ),
//                     IconButton(
//                       icon: Icon(Icons.account_circle),
//                       onPressed: () {
//                         // Add profile icon onPressed functionality
//                       },
//                     ),
//                   ],
//                 ),
//               ],
//             ),
//           ),
//         ),
//         body: Padding(
//           padding: const EdgeInsets.symmetric(vertical: 10.0),
//           child: Column(
//             children: [
//               ImageSlider(),
//               SizedBox(
//                   height: 20), // Add some space between the slider and cards
//               Expanded(
//                 flex: 3,
//                 child: SingleChildScrollView(
//                   child: Column(
//                     children: [
//                       MyCard(
//                         name: 'Laxmi Super Market',
//                         rating: '4.1',
//                         numRatings: '(176 Ratings)',
//                         address: 'New Link Road Andheri West, Mumbai',
//                         imageName: 'Mart.jpg',
//                       ),
//                       MyCard(
//                         name: 'DMart',
//                         rating: '4.3',
//                         numRatings: '(550 Ratings)',
//                         address: 'Delhi',
//                         imageName: 'Dmart.jpg',
//                       ),
//                       MyCard(
//                         name: 'BigBazar',
//                         rating: '4.0',
//                         numRatings: '(250 Ratings)',
//                         address: 'Mumbai',
//                         imageName: 'BigBazar.jpeg',
//                       ),
//                       MyCard(
//                         name: 'Fortune Mart',
//                         rating: '4.5',
//                         numRatings: '(150 Ratings)',
//                         address: 'Pune',
//                         imageName: 'FortuneMart.jpg',
//                       ),
//                       MyCard(
//                         name: 'Jio Mart',
//                         rating: '4.6',
//                         numRatings: '(800 Ratings)',
//                         address: 'Navi Mumbai',
//                         imageName: 'JioMart.jpg',
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

// class ImageSlider extends StatefulWidget {
//   @override
//   _ImageSliderState createState() => _ImageSliderState();
// }

// class _ImageSliderState extends State<ImageSlider> {
//   late PageController _pageController;
//   late Timer _timer;
//   int _currentPage = 0;

//   @override
//   void initState() {
//     super.initState();
//     _pageController = PageController(initialPage: _currentPage);

//     _timer = Timer.periodic(Duration(seconds: 2), (Timer timer) {
//       // Calculate the next page index, ensuring endless circular scrolling
//       _currentPage =
//           (_pageController.page!.toInt() + 1) % 8; // Move to the next page

//       if (_pageController.hasClients) {
//         _pageController.animateToPage(
//           _currentPage,
//           duration: Duration(milliseconds: 500),
//           curve: Curves.easeInOut,
//         );
//       }
//     });

//     // Handle page transitions to continue scrolling
//     _pageController.addListener(() {
//       if (_pageController.page!.floor() - _currentPage.floor() >= 1.0) {
//         // Jump to the beginning to maintain continuous scrolling
//         _pageController.jumpToPage(0);
//         _currentPage = 0;
//       }
//     });
//   }

//   @override
//   void dispose() {
//     _pageController.dispose();
//     _timer.cancel();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Expanded(
//       child: PageView.builder(
//         controller: _pageController,
//         scrollDirection: Axis.horizontal,
//         onPageChanged: (int page) {
//           setState(() {
//             _currentPage = page;
//           });
//         },
//         itemBuilder: (BuildContext context, int index) {
//           return Image.asset(
//             'lib/images/${[
//               'One',
//               'Two',
//               'Three',
//               'Four',
//               'Five',
//               'Six',
//               'Seven',
//               'Eight'
//             ][index]}.jpg',
//             fit: BoxFit.cover,
//           );
//         },
//         itemCount: 8,
//       ),
//     );
//   }
// }

// class MyCard extends StatelessWidget {
//   final String name;
//   final String rating;
//   final String numRatings;
//   final String address;
//   final String imageName;

//   MyCard({
//     required this.name,
//     required this.rating,
//     required this.numRatings,
//     required this.address,
//     required this.imageName,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Card(
//       clipBehavior: Clip.antiAlias,
//       shape: RoundedRectangleBorder(
//         borderRadius: BorderRadius.circular(10.0),
//       ),
//       elevation: 4.0,
//       margin: EdgeInsets.all(10.0),
//       child: Container(
//         height: 400,
//         child: Column(
//           children: [
//             Stack(
//               children: [
//                 Image.asset(
//                   'lib/images/$imageName',
//                   width: double.infinity,
//                   height: 200.0,
//                   fit: BoxFit.cover,
//                 ),
//                 Positioned(
//                   bottom: 10.0,
//                   left: 10.0,
//                   child: Container(
//                     padding: EdgeInsets.all(5.0),
//                     decoration: BoxDecoration(
//                       color: Colors.black.withOpacity(0.5),
//                       borderRadius: BorderRadius.circular(5.0),
//                     ),
//                     child: Row(
//                       children: [
//                         Icon(
//                           Icons.star,
//                           size: 12.0,
//                           color: Colors.yellow,
//                         ),
//                         Text(
//                           rating,
//                           style: TextStyle(
//                             color: Colors.white,
//                             fontSize: 12.0,
//                           ),
//                         ),
//                         Text(
//                           numRatings,
//                           style: TextStyle(
//                             color: Colors.white,
//                             fontSize: 12.0,
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//             Padding(
//               padding: const EdgeInsets.all(16.0),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       Text(
//                         name,
//                         style: TextStyle(
//                           fontWeight: FontWeight.bold,
//                           fontSize: 20.0,
//                         ),
//                       ),
//                       Icon(
//                         Icons.verified,
//                         size: 16.0,
//                         color: Colors.blue,
//                       ),
//                     ],
//                   ),
//                   SizedBox(height: 5.0),
//                   Text(
//                     address,
//                     style: TextStyle(
//                       fontSize: 14.0,
//                     ),
//                   ),
//                   SizedBox(height: 20.0),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                     children: [
//                       Container(
//                         width: 150,
//                         decoration: BoxDecoration(
//                           color: Colors.orange,
//                           borderRadius: BorderRadius.circular(5.0),
//                         ),
//                         child: TextButton(
//                           onPressed: () {},
//                           child: Text(
//                             'Show Number',
//                             style: TextStyle(
//                               color: Colors.white,
//                             ),
//                           ),
//                         ),
//                       ),
//                       Container(
//                         width: 150,
//                         decoration: BoxDecoration(
//                           color: Colors.blue,
//                           borderRadius: BorderRadius.circular(5.0),
//                         ),
//                         child: ElevatedButton(
//                           onPressed: () {},
//                           child: Text(
//                             'Get Best Deal',
//                             style: TextStyle(
//                               color: Colors.white,
//                             ),
//                           ),
//                           style: ElevatedButton.styleFrom(
//                             primary: Colors.blue,
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

//11/03/2024 Updated code
// import 'package:flutter/material.dart';
// import 'dart:async';
// import 'Tennis.dart';
// import 'Badminton.dart';
// import 'Chess.dart';
// import 'Cricket.dart';
// import 'Football.dart';

// class Fobixo extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         appBar: PreferredSize(
//           preferredSize: Size.fromHeight(kToolbarHeight + 56),
//           child: AppBar(
//             title: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Row(
//                   children: [
//                     Text(
//                       'Fob',
//                       style: TextStyle(
//                         fontWeight: FontWeight.bold,
//                         color: Colors.blue,
//                       ),
//                     ),
//                     Text(
//                       'ixo',
//                       style: TextStyle(
//                         fontWeight: FontWeight.bold,
//                         color: Colors.orange,
//                       ),
//                     ),
//                   ],
//                 ),
//                 Row(
//                   children: [
//                     IconButton(
//                       icon: Icon(Icons.notifications),
//                       onPressed: () {
//                         // Add notification icon onPressed functionality
//                       },
//                     ),
//                     IconButton(
//                       icon: Icon(Icons.account_circle),
//                       onPressed: () {
//                         // Add profile icon onPressed functionality
//                       },
//                     ),
//                   ],
//                 ),
//               ],
//             ),
//             bottom: PreferredSize(
//               preferredSize: Size.fromHeight(56.0),
//               child: Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
//                 child: TextField(
//                   decoration: InputDecoration(
//                     hintText: 'Search for Stores, Products...',
//                     prefixIcon: Icon(Icons.search),
//                     border: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(10.0),
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//           ),
//         ),
//         body: Column(
//           children: [
//             ImageSlider(),
//             SizedBox(height: 20),
//             SingleChildScrollView(
//               scrollDirection: Axis.horizontal,
//               child: Row(
//                 children: [
//                   OptionBox(imagePath: 'lib/images/Football.jpg', screenName: 'Football',),
//                   OptionBox(imagePath: 'lib/images/Badminton.jpg', screenName: 'Badminton',),
//                   OptionBox(imagePath: 'lib/images/Tennis.png', screenName: 'Tennis',),
//                   OptionBox(imagePath: 'lib/images/Chess.jpg', screenName: 'Chess',),
//                   OptionBox(imagePath: 'lib/images/Cricket.jpg', screenName: 'Cricket',),
//                 ],
//               ),
//             ),
//             Expanded(
//               child: SingleChildScrollView(
//                 child: Column(
//                   children: [
//                     MyCard(
//                       name: 'Laxmi Super Market',
//                       rating: '4.1',
//                       numRatings: '(176 Ratings)',
//                       address: 'New Link Road Andheri West, Mumbai',
//                       imageName: 'Mart.jpg',
//                     ),
//                     MyCard(
//                       name: 'DMart',
//                       rating: '4.3',
//                       numRatings: '(550 Ratings)',
//                       address: 'Delhi',
//                       imageName: 'Dmart.jpg',
//                     ),
//                     MyCard(
//                       name: 'BigBazar',
//                       rating: '4.0',
//                       numRatings: '(250 Ratings)',
//                       address: 'Mumbai',
//                       imageName: 'BigBazar.jpeg',
//                     ),
//                     MyCard(
//                       name: 'Fortune Mart',
//                       rating: '4.5',
//                       numRatings: '(150 Ratings)',
//                       address: 'Pune',
//                       imageName: 'FortuneMart.jpg',
//                     ),
//                     MyCard(
//                       name: 'Jio Mart',
//                       rating: '4.6',
//                       numRatings: '(800 Ratings)',
//                       address: 'Navi Mumbai',
//                       imageName: 'JioMart.jpg',
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// class ImageSlider extends StatefulWidget {
//   @override
//   _ImageSliderState createState() => _ImageSliderState();
// }

// class _ImageSliderState extends State<ImageSlider> {
//   late PageController _pageController;
//   late Timer _timer;
//   int _currentPage = 0;

//   @override
//   void initState() {
//     super.initState();
//     _pageController = PageController(initialPage: _currentPage);

//     _timer = Timer.periodic(Duration(seconds: 2), (Timer timer) {
//       _currentPage = (_pageController.page!.toInt() + 1) % 8;

//       if (_pageController.hasClients) {
//         _pageController.animateToPage(
//           _currentPage,
//           duration: Duration(milliseconds: 500),
//           curve: Curves.easeInOut,
//         );
//       }
//     });

//     _pageController.addListener(() {
//       if (_pageController.page!.floor() - _currentPage.floor() >= 1.0) {
//         _pageController.jumpToPage(0);
//         _currentPage = 0;
//       }
//     });
//   }

//   @override
//   void dispose() {
//     _pageController.dispose();
//     _timer.cancel();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       height: 180,
//       child: PageView.builder(
//         controller: _pageController,
//         scrollDirection: Axis.horizontal,
//         itemBuilder: (BuildContext context, int index) {
//           return Padding(
//             padding: EdgeInsets.symmetric(horizontal: 8.0),
//             child: ClipRRect(
//               borderRadius: BorderRadius.circular(10.0),
//               child: Image.asset(
//                 'lib/images/${[
//                   'One',
//                   'Two',
//                   'Three',
//                   'Four',
//                   'Five',
//                   'Six',
//                   'Seven',
//                   'Eight'
//                 ][index]}.jpg',
//                 fit: BoxFit.cover,
//               ),
//             ),
//           );
//         },
//         itemCount: 8,
//       ),
//     );
//   }
// }

// class OptionBox extends StatelessWidget {
//   final String imagePath;
//   final String screenName;

//   const OptionBox({Key? key, required this.imagePath, required this.screenName}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: () {
//         // Navigate to the Football screen when the Football image is tapped
//         if (screenName == 'Badminton') {
//           Navigator.push(
//             context,
//             MaterialPageRoute(builder: (context) => BadmintonScreen()),
//           );
//         } else if (screenName == 'Tennis') {
//           Navigator.push(
//             context,
//             MaterialPageRoute(builder: (context) => TennisScreen()),
//           );
//         } else if (screenName == 'Football') {
//           Navigator.push(
//             context,
//             MaterialPageRoute(builder: (context) => FootballScreen()),
//           );
//         } else if (screenName == 'Chess') {
//           Navigator.push(
//             context,
//             MaterialPageRoute(builder: (context) => ChessScreen()),
//           );
//         } else if (screenName == 'Cricket') {
//           Navigator.push(
//             context,
//             MaterialPageRoute(builder: (context) => CricketScreen()),
//           );
//         }
//       },
//       child: Container(
//         width: 50,
//         height: 50,
//         margin: EdgeInsets.symmetric(horizontal: 8.0),
//         decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(10),
//           color: Colors.grey[200],
//         ),
//         child: Image.asset(
//           imagePath,
//           fit: BoxFit.contain,
//         ),
//       ),
//     );
//   }
// }

// class MyCard extends StatelessWidget {
//   final String name;
//   final String rating;
//   final String numRatings;
//   final String address;
//   final String imageName;

//   MyCard({
//     required this.name,
//     required this.rating,
//     required this.numRatings,
//     required this.address,
//     required this.imageName,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Card(
//       clipBehavior: Clip.antiAlias,
//       shape: RoundedRectangleBorder(
//         borderRadius: BorderRadius.circular(10.0),
//       ),
//       elevation: 4.0,
//       margin: EdgeInsets.all(10.0),
//       child: Container(
//         height: 400,
//         child: Column(
//           children: [
//             Stack(
//               children: [
//                 Image.asset(
//                   'lib/images/$imageName',
//                   width: double.infinity,
//                   height: 200.0,
//                   fit: BoxFit.cover,
//                 ),
//                 Positioned(
//                   bottom: 10.0,
//                   left: 10.0,
//                   child: Container(
//                     padding: EdgeInsets.all(5.0),
//                     decoration: BoxDecoration(
//                       color: Colors.black.withOpacity(0.5),
//                       borderRadius: BorderRadius.circular(5.0),
//                     ),
//                     child: Row(
//                       children: [
//                         Icon(
//                           Icons.star,
//                           size: 12.0,
//                           color: Colors.yellow,
//                         ),
//                         Text(
//                           rating,
//                           style: TextStyle(
//                             color: Colors.white,
//                             fontSize: 12.0,
//                           ),
//                         ),
//                         Text(
//                           numRatings,
//                           style: TextStyle(
//                             color: Colors.white,
//                             fontSize: 12.0,
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//             Padding(
//               padding: const EdgeInsets.all(16.0),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       Text(
//                         name,
//                         style: TextStyle(
//                           fontWeight: FontWeight.bold,
//                           fontSize: 20.0,
//                         ),
//                       ),
//                       Icon(
//                         Icons.verified,
//                         size: 16.0,
//                         color: Colors.blue,
//                       ),
//                     ],
//                   ),
//                   SizedBox(height: 5.0),
//                   Text(
//                     address,
//                     style: TextStyle(
//                       fontSize: 14.0,
//                     ),
//                   ),
//                   SizedBox(height: 20.0),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                     children: [
//                       Container(
//                         width: 150,
//                         decoration: BoxDecoration(
//                           color: Colors.orange,
//                           borderRadius: BorderRadius.circular(5.0),
//                         ),
//                         child: TextButton(
//                           onPressed: () {},
//                           child: Text(
//                             'Show Number',
//                             style: TextStyle(
//                               color: Colors.white,
//                             ),
//                           ),
//                         ),
//                       ),
//                       Container(
//                         width: 150,
//                         decoration: BoxDecoration(
//                           color: Colors.blue,
//                           borderRadius: BorderRadius.circular(5.0),
//                         ),
//                         child: ElevatedButton(
//                           onPressed: () {},
//                           child: Text(
//                             'Get Best Deal',
//                             style: TextStyle(
//                               color: Colors.white,
//                             ),
//                           ),
//                           style: ElevatedButton.styleFrom(
//                             primary: Colors.blue,
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

//12/03/24
// import 'package:flutter/material.dart';
// import 'dart:async';
// import 'Sport.dart';


// class Fobixo extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         appBar: PreferredSize(
//           preferredSize: Size.fromHeight(kToolbarHeight + 56),
//           child: AppBar(
//             title: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Row(
//                   children: [
//                     Text(
//                       'Fob',
//                       style: TextStyle(
//                         fontWeight: FontWeight.bold,
//                         color: Colors.blue,
//                       ),
//                     ),
//                     Text(
//                       'ixo',
//                       style: TextStyle(
//                         fontWeight: FontWeight.bold,
//                         color: Colors.orange,
//                       ),
//                     ),
//                   ],
//                 ),
//                 Row(
//                   children: [
//                     IconButton(
//                       icon: Icon(Icons.notifications),
//                       onPressed: () {
//                         // Add notification icon onPressed functionality
//                       },
//                     ),
//                     IconButton(
//                       icon: Icon(Icons.account_circle),
//                       onPressed: () {
//                         // Add profile icon onPressed functionality
//                       },
//                     ),
//                   ],
//                 ),
//               ],
//             ),
//             bottom: PreferredSize(
//               preferredSize: Size.fromHeight(40.0), // Reduced height for search area
//               child: Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
//                 child: Container(
//                   height: 40.0, // Reduced height for search box
//                   child: TextField(
//                     decoration: InputDecoration(
//                       hintText: 'Search for Stores, Products...',
//                       prefixIcon: Icon(Icons.search),
//                       border: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(10.0),
//                       ),
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//           ),
//         ),
//         body: Column(
//           children: [
//             ImageSlider(),
//             SizedBox(height: 20),
//             SingleChildScrollView(
//               scrollDirection: Axis.horizontal,
//               child: Row(
//                 children: [
//                   OptionBox(imagePath: 'lib/images/newBasketball.png', screenName: 'Sport',),
//                   OptionBox(imagePath: 'lib/images/newCricket.png', screenName: 'Sport',),
//                   OptionBox(imagePath: 'lib/images/newFootball.png', screenName: 'Sport',),
//                   OptionBox(imagePath: 'lib/images/newRollers.png', screenName: 'Sport',),
//                   OptionBox(imagePath: 'lib/images/newBadminton.png', screenName: 'Sport',),
//                   OptionBox(imagePath: 'lib/images/newTabletennis.png', screenName: 'Sport',),
//                   OptionBox(imagePath: 'lib/images/newLawntennis.png', screenName: 'Sport',),
//                   OptionBox(imagePath: 'lib/images/newChess.png', screenName: 'Sport',),
//                   OptionBox(imagePath: 'lib/images/newKarate.png', screenName: 'Sport',),
//                   OptionBox(imagePath: 'lib/images/newOther.png', screenName: 'Sport',),
//                   OptionBox(imagePath: 'lib/images/newSpiritual.png', screenName: 'Sport',),
//                   OptionBox(imagePath: 'lib/images/newPhotography.png', screenName: 'Sport',),
//                   OptionBox(imagePath: 'lib/images/newSinging.png', screenName: 'Sport',),
//                   OptionBox(imagePath: 'lib/images/newDrawing.png', screenName: 'Sport',),
//                   OptionBox(imagePath: 'lib/images/newLanguages.png', screenName: 'Sport',),
//                   OptionBox(imagePath: 'lib/images/newYoga.png', screenName: 'Sport',),
//                   OptionBox(imagePath: 'lib/images/newDance.png', screenName: 'Sport',),
//                   OptionBox(imagePath: 'lib/images/newIT.png', screenName: 'Sport',),
//                   OptionBox(imagePath: 'lib/images/newMusic.png', screenName: 'Sport',),
//                   OptionBox(imagePath: 'lib/images/newOthers.png', screenName: 'Sport',),
//                 ],
//               ),
//             ),
//             Expanded(
//               child: SingleChildScrollView(
//                 child: Column(
//                   children: [
//                     MyCard(
//                       name: 'Laxmi Super Market',
//                       rating: '4.1',
//                       numRatings: '(176 Ratings)',
//                       address: 'New Link Road Andheri West, Mumbai',
//                       imageName: 'Mart.jpg',
//                     ),
//                     MyCard(
//                       name: 'DMart',
//                       rating: '4.3',
//                       numRatings: '(550 Ratings)',
//                       address: 'Delhi',
//                       imageName: 'Dmart.jpg',
//                     ),
//                     MyCard(
//                       name: 'BigBazar',
//                       rating: '4.0',
//                       numRatings: '(250 Ratings)',
//                       address: 'Mumbai',
//                       imageName: 'BigBazar.jpeg',
//                     ),
//                     MyCard(
//                       name: 'Fortune Mart',
//                       rating: '4.5',
//                       numRatings: '(150 Ratings)',
//                       address: 'Pune',
//                       imageName: 'FortuneMart.jpg',
//                     ),
//                     MyCard(
//                       name: 'Jio Mart',
//                       rating: '4.6',
//                       numRatings: '(800 Ratings)',
//                       address: 'Navi Mumbai',
//                       imageName: 'JioMart.jpg',
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// class ImageSlider extends StatefulWidget {
//   @override
//   _ImageSliderState createState() => _ImageSliderState();
// }

// class _ImageSliderState extends State<ImageSlider> {
//   late PageController _pageController;
//   late Timer _timer;
//   int _currentPage = 0;

//   @override
//   void initState() {
//     super.initState();
//     _pageController = PageController(initialPage: _currentPage);

//     _timer = Timer.periodic(Duration(seconds: 2), (Timer timer) {
//       _currentPage = (_pageController.page!.toInt() + 1) % 8;

//       if (_pageController.hasClients) {
//         _pageController.animateToPage(
//           _currentPage,
//           duration: Duration(milliseconds: 500),
//           curve: Curves.easeInOut,
//         );
//       }
//     });

//     _pageController.addListener(() {
//       if (_pageController.page!.floor() - _currentPage.floor() >= 1.0) {
//         _pageController.jumpToPage(0);
//         _currentPage = 0;
//       }
//     });
//   }

//   @override
//   void dispose() {
//     _pageController.dispose();
//     _timer.cancel();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       height: 180,
//       child: PageView.builder(
//         controller: _pageController,
//         scrollDirection: Axis.horizontal,
//         itemBuilder: (BuildContext context, int index) {
//           return Padding(
//             padding: EdgeInsets.symmetric(horizontal: 8.0),
//             child: ClipRRect(
//               borderRadius: BorderRadius.circular(10.0),
//               child: Image.asset(
//                 'lib/images/${[
//                   'One',
//                   'Two',
//                   'Three',
//                   'Four',
//                   'Five',
//                   'Six',
//                   'Seven',
//                   'Eight'
//                 ][index]}.jpg',
//                 fit: BoxFit.cover,
//               ),
//             ),
//           );
//         },
//         itemCount: 8,
//       ),
//     );
//   }
// }

// class OptionBox extends StatelessWidget {
//   final String imagePath;
//   final String screenName;

//   const OptionBox({Key? key, required this.imagePath, required this.screenName}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: () {
//         // Navigate to the Sport screen when any image is tapped
//         Navigator.push(
//           context,
//           MaterialPageRoute(builder: (context) => SportScreen()),
//         );
//       },
//       child: Container(
//         width: 50,
//         height: 50,
//         margin: EdgeInsets.symmetric(horizontal: 8.0),
//         decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(10),
//           color: Colors.grey[200],
//         ),
//         child: Image.asset(
//           imagePath,
//           fit: BoxFit.contain,
//         ),
//       ),
//     );
//   }
// }

// class MyCard extends StatelessWidget {
//   final String name;
//   final String rating;
//   final String numRatings;
//   final String address;
//   final String imageName;

//   MyCard({
//     required this.name,
//     required this.rating,
//     required this.numRatings,
//     required this.address,
//     required this.imageName,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Card(
//       clipBehavior: Clip.antiAlias,
//       shape: RoundedRectangleBorder(
//         borderRadius: BorderRadius.circular(10.0),
//       ),
//       elevation: 4.0,
//       margin: EdgeInsets.all(10.0),
//       child: Container(
//         height: 400,
//         child: Column(
//           children: [
//             Stack(
//               children: [
//                 Image.asset(
//                   'lib/images/$imageName',
//                   width: double.infinity,
//                   height: 200.0,
//                   fit: BoxFit.cover,
//                 ),
//                 Positioned(
//                   bottom: 10.0,
//                   left: 10.0,
//                   child: Container(
//                     padding: EdgeInsets.all(5.0),
//                     decoration: BoxDecoration(
//                       color: Colors.black.withOpacity(0.5),
//                       borderRadius: BorderRadius.circular(5.0),
//                     ),
//                     child: Row(
//                       children: [
//                         Icon(
//                           Icons.star,
//                           size: 12.0,
//                           color: Colors.yellow,
//                         ),
//                         Text(
//                           rating,
//                           style: TextStyle(
//                             color: Colors.white,
//                             fontSize: 12.0,
//                           ),
//                         ),
//                         Text(
//                           numRatings,
//                           style: TextStyle(
//                             color: Colors.white,
//                             fontSize: 12.0,
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//             Padding(
//               padding: const EdgeInsets.all(16.0),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       Text(
//                         name,
//                         style: TextStyle(
//                           fontWeight: FontWeight.bold,
//                           fontSize: 20.0,
//                         ),
//                       ),
//                       Icon(
//                         Icons.verified,
//                         size: 16.0,
//                         color: Colors.blue,
//                       ),
//                     ],
//                   ),
//                   SizedBox(height: 5.0),
//                   Text(
//                     address,
//                     style: TextStyle(
//                       fontSize: 14.0,
//                     ),
//                   ),
//                   SizedBox(height: 20.0),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                     children: [
//                       Container(
//                         width: 150,
//                         decoration: BoxDecoration(
//                           color: Colors.orange,
//                           borderRadius: BorderRadius.circular(5.0),
//                         ),
//                         child: TextButton(
//                           onPressed: () {},
//                           child: Text(
//                             'Show Number',
//                             style: TextStyle(
//                               color: Colors.white,
//                             ),
//                           ),
//                         ),
//                       ),
//                       Container(
//                         width: 150,
//                         decoration: BoxDecoration(
//                           color: Colors.blue,
//                           borderRadius: BorderRadius.circular(5.0),
//                         ),
//                         child: ElevatedButton(
//                           onPressed: () {},
//                           child: Text(
//                             'Get Best Deal',
//                             style: TextStyle(
//                               color: Colors.white,
//                             ),
//                           ),
//                           style: ElevatedButton.styleFrom(
//                             primary: Colors.blue,
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'dart:async';
import 'Sport.dart';


class Fobixo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(kToolbarHeight + 56),
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
            bottom: PreferredSize(
              preferredSize: Size.fromHeight(40.0), // Reduced height for search area
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                child: Container(
                  height: 40.0, // Reduced height for search box
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Search for Stores, Products...',
                      prefixIcon: Icon(Icons.search),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
        body: Container(
          decoration: BoxDecoration(
            color: Colors.grey[200], // Background color for the entire page
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0), // Padding for the entire page content
            child: Column(
              children: [
                ImageSlider(),
                SizedBox(height: 20),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      OptionBox(imagePath: 'lib/images/newBasketball.png', screenName: 'Sport',),
                      OptionBox(imagePath: 'lib/images/newCricket.png', screenName: 'Sport',),
                      OptionBox(imagePath: 'lib/images/newFootball.png', screenName: 'Sport',),
                      OptionBox(imagePath: 'lib/images/newRollers.png', screenName: 'Sport',),
                      OptionBox(imagePath: 'lib/images/newBadminton.png', screenName: 'Sport',),
                      OptionBox(imagePath: 'lib/images/newTabletennis.png', screenName: 'Sport',),
                      OptionBox(imagePath: 'lib/images/newLawntennis.png', screenName: 'Sport',),
                      OptionBox(imagePath: 'lib/images/newChess.png', screenName: 'Sport',),
                      OptionBox(imagePath: 'lib/images/newKarate.png', screenName: 'Sport',),
                      OptionBox(imagePath: 'lib/images/newOther.png', screenName: 'Sport',),
                      OptionBox(imagePath: 'lib/images/newSpiritual.png', screenName: 'Sport',),
                      OptionBox(imagePath: 'lib/images/newPhotography.png', screenName: 'Sport',),
                      OptionBox(imagePath: 'lib/images/newSinging.png', screenName: 'Sport',),
                      OptionBox(imagePath: 'lib/images/newDrawing.png', screenName: 'Sport',),
                      OptionBox(imagePath: 'lib/images/newLanguages.png', screenName: 'Sport',),
                      OptionBox(imagePath: 'lib/images/newYoga.png', screenName: 'Sport',),
                      OptionBox(imagePath: 'lib/images/newDance.png', screenName: 'Sport',),
                      OptionBox(imagePath: 'lib/images/newIT.png', screenName: 'Sport',),
                      OptionBox(imagePath: 'lib/images/newMusic.png', screenName: 'Sport',),
                      OptionBox(imagePath: 'lib/images/newOthers.png', screenName: 'Sport',),
                    ],
                  ),
                ),
                Expanded(
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
      _currentPage = (_pageController.page!.toInt() + 1) % 8;

      if (_pageController.hasClients) {
        _pageController.animateToPage(
          _currentPage,
          duration: Duration(milliseconds: 500),
          curve: Curves.easeInOut,
        );
      }
    });

    _pageController.addListener(() {
      if (_pageController.page!.floor() - _currentPage.floor() >= 1.0) {
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
    return Container(
      height: 180,
      child: PageView.builder(
        controller: _pageController,
        scrollDirection: Axis.horizontal,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10.0),
              child: Image.asset(
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
              ),
            ),
          );
        },
        itemCount: 8,
      ),
    );
  }
}

class OptionBox extends StatelessWidget {
  final String imagePath;
  final String screenName;

  const OptionBox({Key? key, required this.imagePath, required this.screenName}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Navigate to the Sport screen when any image is tapped
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => SportScreen()),
        );
      },
      child: Container(
        width: 50,
        height: 50,
        margin: EdgeInsets.symmetric(horizontal: 8.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.grey[300], // Background color for OptionBox
        ),
        child: Image.asset(
          imagePath,
          fit: BoxFit.contain,
        ),
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
