//Working code bitbucket
// import 'package:flutter/material.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';

// class SignUpScreen extends StatefulWidget {
//   const SignUpScreen({Key? key}) : super(key: key);

//   @override
//   State<SignUpScreen> createState() => _SignUpScreenState();
// }

// class _SignUpScreenState extends State<SignUpScreen> {
//   String _fullName = '';
//   DateTime? _selectedDate;
//   String _education = '';
//   String _address = '';
//   String _city = '';
//   String _selectedCityForCoaching = '';
//   String _whatsappMobileNumber = '';
//   String _email = '';
//   String _password = '';
//   String _schoolOrCollegeName = '';
//   String _interestedIn = '';
//   bool _acceptTermsAndConditions = false;
//   bool _isObscured = true;

//   // List of cities
//   final List<String> cities = [
//     'Aurangabad',
//     'Nashik',
//     'Pune',
//     'Mumbai',
//     'Nagpur',
//     'Amravati',
//     'Solapur',
//     'Kolhapur',
//     'Thane',
//     'Nanded',
//     'Latur',
//     'Akola',
//     'Satar',
//     'Jalgaon',
//     'Sangli'
//   ];

//   // List of interests
//   final List<String> interests = [
//     'Sports',
//     'Arts & Others',
//   ];

//   // Sign up function (placeholder for now)
//   void _signUp() {
//     // Validate user input
//     if (_fullName.isEmpty ||
//         _selectedDate == null ||
//         _education.isEmpty ||
//         _address.isEmpty ||
//         _city.isEmpty ||
//         _selectedCityForCoaching.isEmpty ||
//         _whatsappMobileNumber.isEmpty ||
//         _email.isEmpty ||
//         _password.isEmpty ||
//         _interestedIn.isEmpty ||
//         !_acceptTermsAndConditions) {
//       // Show error message
//       return;
//     }

//     // Send sign up request to your backend server (not implemented here)
//     print(
//         'Signing up with Full Name: $_fullName, Date of Birth: $_selectedDate, Education: $_education, Address: $_address, City: $_city, Select City for Coaching: $_selectedCityForCoaching, WhatsApp Mobile Number: $_whatsappMobileNumber, Email: $_email, Password: $_password, School/College Name: $_schoolOrCollegeName, Interested In: $_interestedIn, Accept Terms and Conditions: $_acceptTermsAndConditions');
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.white,
//         elevation: 0,
//       ),
//       backgroundColor: Colors.white,
//       body: SingleChildScrollView(
//         child: Column(
//           children: [
//             Padding(
//               padding: const EdgeInsets.all(20.0),
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 crossAxisAlignment: CrossAxisAlignment.center,
//                 children: [
//                   Text(
//                     'Sign Up',
//                     style: TextStyle(
//                       fontWeight: FontWeight.bold,
//                       fontSize: 24.0,
//                     ),
//                   ),
//                   const SizedBox(height: 10.0),
//                   // Full Name
//                   Padding(
//                     padding: EdgeInsets.symmetric(horizontal: 20.0),
//                     child: Row(
//                       children: [
//                         Text(
//                           'Full Name ',
//                           style: TextStyle(color: Colors.black),
//                         ),
//                         Text(
//                           '*',
//                           style: TextStyle(color: Colors.red),
//                         ),
//                       ],
//                     ),
//                   ),
//                   Padding(
//                     padding: EdgeInsets.symmetric(horizontal: 20.0),
//                     child: TextFormField(
//                       decoration: InputDecoration(
//                         hintText: 'Enter Full Name',
//                         prefixIcon: Icon(Icons.person),
//                       ),
//                       onChanged: (value) => setState(() => _fullName = value),
//                     ),
//                   ),
//                   const SizedBox(height: 30.0),
//                   // Date of Birth
//                   Padding(
//                     padding: EdgeInsets.symmetric(horizontal: 20.0),
//                     child: Row(
//                       children: [
//                         Text(
//                           'Date of Birth ',
//                           style: TextStyle(color: Colors.black),
//                         ),
//                         Text(
//                           '*',
//                           style: TextStyle(color: Colors.red),
//                         ),
//                       ],
//                     ),
//                   ),
//                   Padding(
//                     padding: EdgeInsets.symmetric(horizontal: 20.0),
//                     child: InkWell(
//                       onTap: () async {
//                         final DateTime? pickedDate = await showDatePicker(
//                           context: context,
//                           initialDate: DateTime.now(),
//                           firstDate: DateTime(1975),
//                           lastDate: DateTime.now(),
//                         );
//                         if (pickedDate != null && pickedDate != _selectedDate) {
//                           setState(() {
//                             _selectedDate = pickedDate;
//                           });
//                         }
//                       },
//                       child: InputDecorator(
//                         decoration: InputDecoration(
//                           hintText: 'Select Date of Birth',
//                           prefixIcon: Icon(Icons.calendar_today),
//                         ),
//                         child: Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                           children: <Widget>[
//                             Text(
//                               _selectedDate != null
//                                   ? '${_selectedDate!.day}-${_selectedDate!.month}-${_selectedDate!.year}'
//                                   : 'Select Date',
//                             ),
//                             Icon(Icons.arrow_drop_down),
//                           ],
//                         ),
//                       ),
//                     ),
//                   ),
//                   const SizedBox(height: 30.0),
//                   // Education/Qualification
//                   Padding(
//                     padding: EdgeInsets.symmetric(horizontal: 20.0),
//                     child: Row(
//                       children: [
//                         Text(
//                           'Education/Qualification ',
//                           style: TextStyle(color: Colors.black),
//                         ),
//                         Text(
//                           '*',
//                           style: TextStyle(color: Colors.red),
//                         ),
//                       ],
//                     ),
//                   ),
//                   Padding(
//                     padding: EdgeInsets.symmetric(horizontal: 20.0),
//                     child: DropdownButtonFormField<String>(
//                       decoration: InputDecoration(
//                         hintText: 'Select Education/Qualification',
//                         prefixIcon: Icon(Icons.school),
//                       ),
//                       value: _education.isNotEmpty ? _education : null,
//                       items: <String>[
//                         'In School',
//                         'In College',
//                         'Others',
//                       ].map((String value) {
//                         return DropdownMenuItem<String>(
//                           value: value,
//                           child: Text(value),
//                         );
//                       }).toList(),
//                       onChanged: (value) {
//                         setState(() {
//                           _education = value!;
//                         });
//                       },
//                     ),
//                   ),
//                   const SizedBox(height: 30.0),
//                   // Address
//                   Padding(
//                     padding: EdgeInsets.symmetric(horizontal: 20.0),
//                     child: Row(
//                       children: [
//                         Text(
//                           'Address ',
//                           style: TextStyle(color: Colors.black),
//                         ),
//                         Text(
//                           '*',
//                           style: TextStyle(color: Colors.red),
//                         ),
//                       ],
//                     ),
//                   ),
//                   Padding(
//                     padding: EdgeInsets.symmetric(horizontal: 20.0),
//                     child: TextFormField(
//                       decoration: InputDecoration(
//                         hintText: 'Enter Address',
//                         prefixIcon: Icon(Icons.location_on),
//                       ),
//                       onChanged: (value) => setState(() => _address = value),
//                     ),
//                   ),
//                   const SizedBox(height: 30.0),
//                   // City
//                   Padding(
//                     padding: EdgeInsets.symmetric(horizontal: 20.0),
//                     child: Row(
//                       children: [
//                         Text(
//                           'City ',
//                           style: TextStyle(color: Colors.black),
//                         ),
//                         Text(
//                           '*',
//                           style: TextStyle(color: Colors.red),
//                         ),
//                       ],
//                     ),
//                   ),
//                   Padding(
//                     padding: EdgeInsets.symmetric(horizontal: 20.0),
//                     child: DropdownButtonFormField<String>(
//                       decoration: InputDecoration(
//                         hintText: 'Select City',
//                         prefixIcon: Icon(Icons.location_city),
//                       ),
//                       value: _city.isNotEmpty ? _city : null,
//                       items: cities.map((String value) {
//                         return DropdownMenuItem<String>(
//                           value: value,
//                           child: Text(value),
//                         );
//                       }).toList(),
//                       onChanged: (value) {
//                         setState(() {
//                           _city = value!;
//                         });
//                       },
//                     ),
//                   ),
//                   const SizedBox(height: 30.0),
//                   // Select City for Coaching
//                   Padding(
//                     padding: EdgeInsets.symmetric(horizontal: 20.0),
//                     child: Row(
//                       children: [
//                         Text(
//                           'Select City for Coaching ',
//                           style: TextStyle(color: Colors.black),
//                         ),
//                         Text(
//                           '*',
//                           style: TextStyle(color: Colors.red),
//                         ),
//                       ],
//                     ),
//                   ),
//                   Padding(
//                     padding: EdgeInsets.symmetric(horizontal: 20.0),
//                     child: DropdownButtonFormField<String>(
//                       decoration: InputDecoration(
//                         hintText: 'Select City for Coaching',
//                         prefixIcon: Icon(Icons.location_city),
//                       ),
//                       value: _selectedCityForCoaching.isNotEmpty
//                           ? _selectedCityForCoaching
//                           : null,
//                       items: cities.map((String value) {
//                         return DropdownMenuItem<String>(
//                           value: value,
//                           child: Text(value),
//                         );
//                       }).toList(),
//                       onChanged: (value) {
//                         setState(() {
//                           _selectedCityForCoaching = value!;
//                         });
//                       },
//                     ),
//                   ),
//                   const SizedBox(height: 30.0),
//                   // Whatsapp Mobile Number
//                   Padding(
//                     padding: EdgeInsets.symmetric(horizontal: 20.0),
//                     child: Row(
//                       children: [
//                         Text(
//                           'Whatsapp Mobile Number ',
//                           style: TextStyle(color: Colors.black),
//                         ),
//                         Text(
//                           '*',
//                           style: TextStyle(color: Colors.red),
//                         ),
//                       ],
//                     ),
//                   ),
//                   Padding(
//                     padding: EdgeInsets.symmetric(horizontal: 20.0),
//                     child: TextFormField(
//                       decoration: InputDecoration(
//                         hintText: 'Enter Whatsapp Mobile Number',
//                         prefixIcon: Icon(Icons.phone),
//                       ),
//                       onChanged: (value) =>
//                           setState(() => _whatsappMobileNumber = value),
//                     ),
//                   ),
//                   const SizedBox(height: 30.0),
//                   // Email
//                   Padding(
//                     padding: EdgeInsets.symmetric(horizontal: 20.0),
//                     child: Row(
//                       children: [
//                         Text(
//                           'Email ',
//                           style: TextStyle(color: Colors.black),
//                         ),
//                         Text(
//                           '*',
//                           style: TextStyle(color: Colors.red),
//                         ),
//                       ],
//                     ),
//                   ),
//                   Padding(
//                     padding: EdgeInsets.symmetric(horizontal: 20.0),
//                     child: TextFormField(
//                       decoration: InputDecoration(
//                         hintText: 'Enter Email',
//                         prefixIcon: Icon(Icons.email),
//                       ),
//                       onChanged: (value) => setState(() => _email = value),
//                     ),
//                   ),
//                   const SizedBox(height: 30.0),
//                   // School/College Name
//                   Padding(
//                     padding: EdgeInsets.symmetric(horizontal: 20.0),
//                     child: Row(
//                       children: [
//                         Text(
//                           'School/College Name ',
//                           style: TextStyle(color: Colors.black),
//                         ),
//                       ],
//                     ),
//                   ),
//                   Padding(
//                     padding: EdgeInsets.symmetric(horizontal: 20.0),
//                     child: TextFormField(
//                       decoration: InputDecoration(
//                         hintText: 'Enter School/College Name',
//                         prefixIcon: Icon(Icons.school),
//                       ),
//                       onChanged: (value) =>
//                           setState(() => _schoolOrCollegeName = value),
//                     ),
//                   ),
//                   const SizedBox(height: 30.0),
//                   // Interested In
//                   Padding(
//                     padding: EdgeInsets.symmetric(horizontal: 20.0),
//                     child: Row(
//                       children: [
//                         Text(
//                           'Interested in ',
//                           style: TextStyle(color: Colors.black),
//                         ),
//                         Text(
//                           '*',
//                           style: TextStyle(color: Colors.red),
//                         ),
//                       ],
//                     ),
//                   ),
//                   Padding(
//                     padding: EdgeInsets.symmetric(horizontal: 20.0),
//                     child: DropdownButtonFormField<String>(
//                       decoration: InputDecoration(
//                         hintText: 'Select Interest',
//                         prefixIcon: Icon(Icons.star),
//                       ),
//                       value: _interestedIn.isNotEmpty ? _interestedIn : null,
//                       items: interests.map((String value) {
//                         return DropdownMenuItem<String>(
//                           value: value,
//                           child: Text(value),
//                         );
//                       }).toList(),
//                       onChanged: (value) {
//                         setState(() {
//                           _interestedIn = value!;
//                         });
//                       },
//                     ),
//                   ),
//                   const SizedBox(height: 30.0),
//                   // Accept Terms and Conditions
//                   Padding(
//                     padding: EdgeInsets.symmetric(horizontal: 20.0),
//                     child: Row(
//                       children: [
//                         Checkbox(
//                           value: _acceptTermsAndConditions,
//                           onChanged: (value) {
//                             setState(() {
//                               _acceptTermsAndConditions = value!;
//                             });
//                           },
//                         ),
//                         Flexible(
//                           child: Text(
//                             'I accept the ',
//                             style: TextStyle(color: Colors.black),
//                           ),
//                         ),
//                         GestureDetector(
//                           onTap: () {
//                             // Handle your terms and conditions navigation or action
//                           },
//                           child: Text(
//                             'Terms and Conditions',
//                             style: TextStyle(
//                               color: Colors.blue,
//                               decoration: TextDecoration.underline,
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                   const SizedBox(height: 30.0),
//                   // Sign Up Button
//                   ElevatedButton(
//                     onPressed: _signUp,
//                     child: Padding(
//                       padding: const EdgeInsets.symmetric(
//                         vertical: 12.0,
//                         horizontal: 70.0,
//                       ),
//                       child: Text(
//                         'Sign Up',
//                         style: TextStyle(color: Colors.white),
//                       ),
//                     ),
//                     style: ElevatedButton.styleFrom(
//                       primary: Colors.blue, // Sky blue background color
//                       shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(8.0),
//                       ),
//                     ),
//                   ),
//                   const SizedBox(height: 25.0),
//                   // Social Icons
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       Icon(FontAwesomeIcons.facebook),
//                       SizedBox(width: 20),
//                       Icon(FontAwesomeIcons.instagram),
//                       SizedBox(width: 20),
//                       Icon(FontAwesomeIcons.pinterest),
//                       SizedBox(width: 20),
//                       Icon(FontAwesomeIcons.linkedin),
//                     ],
//                   ),
//                   const SizedBox(height: 50), // Adjust the height for extra scrolling space
//                 ],
//               ),
//             ),
//             Container(
//               width: double.infinity,
//               decoration: BoxDecoration(
//                 image: DecorationImage(
//                   image: AssetImage('lib/images/Bottom.png'), // Path to your image
//                   fit: BoxFit.cover,
//                 ),
//               ),
//               child: SizedBox(
//                 height: 100, // Adjust the height as needed
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

//working code with database
// import 'package:flutter/material.dart';
// import 'package:fobixo_four/database_helper.dart'; // Import your database helper class
// import 'login_screen.dart'; // Import the login page
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';

// class SignUpScreen extends StatefulWidget {
//   const SignUpScreen({Key? key}) : super(key: key);

//   @override
//   State<SignUpScreen> createState() => _SignUpScreenState();
// }

// class _SignUpScreenState extends State<SignUpScreen> {
//   final DatabaseHelper _databaseHelper =
//       DatabaseHelper.instance; // Use the default constructor

//   String _fullName = '';
//   DateTime? _selectedDate;
//   String _education = '';
//   String _address = '';
//   String _city = '';
//   String _selectedCityForCoaching = '';
//   String _whatsappMobileNumber = '';
//   String _email = '';
//   String _password = '';
//   String _schoolOrCollegeName = '';
//   String _interestedIn = '';
//   bool _acceptTermsAndConditions = false;
//   bool _isObscured = true;
//   String _message = ''; // Store message for displaying success or error

//   final List<String> cities = [
//     'Aurangabad',
//     'Nashik',
//     'Pune',
//     'Mumbai',
//     'Nagpur',
//     'Amravati',
//     'Solapur',
//     'Kolhapur',
//     'Thane',
//     'Nanded',
//     'Latur',
//     'Akola',
//     'Satar',
//     'Jalgaon',
//     'Sangli'
//   ];

//   final List<String> interests = [
//     'Sports',
//     'Arts & Others',
//   ];

//   void _signUp() async {
//     // Validate user input
//     if (_fullName.isEmpty ||
//         _selectedDate == null ||
//         _education.isEmpty ||
//         _address.isEmpty ||
//         _city.isEmpty ||
//         _selectedCityForCoaching.isEmpty ||
//         _whatsappMobileNumber.isEmpty ||
//         _email.isEmpty ||
//         _password.isEmpty ||
//         _interestedIn.isEmpty ||
//         !_acceptTermsAndConditions) {
//       setState(() {
//         _message = 'Please fill all required fields'; // Error message
//       });
//       return;
//     }

//     // Prepare user data
//     Map<String, dynamic> userData = {
//       'fullName': _fullName,
//       'dateOfBirth': _selectedDate!.toString(),
//       'education': _education,
//       'address': _address,
//       'city': _city,
//       'selectedCityForCoaching': _selectedCityForCoaching,
//       'whatsappMobileNumber': _whatsappMobileNumber,
//       'email': _email,
//       'password': _password,
//       'schoolOrCollegeName': _schoolOrCollegeName,
//       'interestedIn': _interestedIn,
//     };

//     // Insert user data into the database
//     int userId = await _databaseHelper.insertUser(userData);

//     if (userId != 0) {
//       setState(() {
//         _message = 'User registered successfully'; // Success message
//       });
//       // Navigate to login page after successful signup
//       Navigator.pushReplacement(
//         context,
//         MaterialPageRoute(builder: (context) => LoginPage()),
//       );
//     } else {
//       setState(() {
//         _message = 'Failed to register user'; // Error message
//       });
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.white,
//         elevation: 0,
//       ),
//       backgroundColor: Colors.white,
//       body: SingleChildScrollView(
//         child: Column(
//           children: [
//             Padding(
//               padding: const EdgeInsets.all(20.0),
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 crossAxisAlignment: CrossAxisAlignment.center,
//                 children: [
//                   Text(
//                     'Sign Up',
//                     style: TextStyle(
//                       fontWeight: FontWeight.bold,
//                       fontSize: 24.0,
//                     ),
//                   ),
//                   const SizedBox(height: 10.0),
//                   // Add other fields similarly
//                   Padding(
//                     padding: EdgeInsets.symmetric(horizontal: 20.0),
//                     child: TextFormField(
//                       decoration: InputDecoration(
//                         hintText: 'Enter Full Name',
//                         prefixIcon: Icon(Icons.person),
//                       ),
//                       onChanged: (value) => setState(() => _fullName = value),
//                     ),
//                   ),
//                   const SizedBox(height: 30.0),
//                   // Add Date of Birth field
//                   Padding(
//                     padding: EdgeInsets.symmetric(horizontal: 20.0),
//                     child: InkWell(
//                       onTap: () async {
//                         final DateTime? pickedDate = await showDatePicker(
//                           context: context,
//                           initialDate: DateTime.now(),
//                           firstDate: DateTime(1975),
//                           lastDate: DateTime.now(),
//                         );
//                         if (pickedDate != null && pickedDate != _selectedDate) {
//                           setState(() {
//                             _selectedDate = pickedDate;
//                           });
//                         }
//                       },
//                       child: InputDecorator(
//                         decoration: InputDecoration(
//                           hintText: 'Select Date of Birth',
//                           prefixIcon: Icon(Icons.calendar_today),
//                         ),
//                         child: Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                           children: <Widget>[
//                             Text(
//                               _selectedDate != null
//                                   ? '${_selectedDate!.day}-${_selectedDate!.month}-${_selectedDate!.year}'
//                                   : 'Select Date',
//                             ),
//                             Icon(Icons.arrow_drop_down),
//                           ],
//                         ),
//                       ),
//                     ),
//                   ),
//                   const SizedBox(height: 30.0),
//                   // Add Education/Qualification field
//                   Padding(
//                     padding: EdgeInsets.symmetric(horizontal: 20.0),
//                     child: DropdownButtonFormField<String>(
//                       decoration: InputDecoration(
//                         hintText: 'Select Education/Qualification',
//                         prefixIcon: Icon(Icons.school),
//                       ),
//                       value: _education.isNotEmpty ? _education : null,
//                       items: <String>[
//                         'In School',
//                         'In College',
//                         'Others',
//                       ].map((String value) {
//                         return DropdownMenuItem<String>(
//                           value: value,
//                           child: Text(value),
//                         );
//                       }).toList(),
//                       onChanged: (value) {
//                         setState(() {
//                           _education = value!;
//                         });
//                       },
//                     ),
//                   ),
//                   const SizedBox(height: 30.0),
//                   // Add Address field
//                   Padding(
//                     padding: EdgeInsets.symmetric(horizontal: 20.0),
//                     child: TextFormField(
//                       decoration: InputDecoration(
//                         hintText: 'Enter Address',
//                         prefixIcon: Icon(Icons.location_on),
//                       ),
//                       onChanged: (value) => setState(() => _address = value),
//                     ),
//                   ),
//                   const SizedBox(height: 30.0),
//                   // Add City field
//                   Padding(
//                     padding: EdgeInsets.symmetric(horizontal: 20.0),
//                     child: DropdownButtonFormField<String>(
//                       decoration: InputDecoration(
//                         hintText: 'Select City',
//                         prefixIcon: Icon(Icons.location_city),
//                       ),
//                       value: _city.isNotEmpty ? _city : null,
//                       items: cities.map((String value) {
//                         return DropdownMenuItem<String>(
//                           value: value,
//                           child: Text(value),
//                         );
//                       }).toList(),
//                       onChanged: (value) {
//                         setState(() {
//                           _city = value!;
//                         });
//                       },
//                     ),
//                   ),
//                   const SizedBox(height: 30.0),
//                   // Add Select City for Coaching field
//                   Padding(
//                     padding: EdgeInsets.symmetric(horizontal: 20.0),
//                     child: DropdownButtonFormField<String>(
//                       decoration: InputDecoration(
//                         hintText: 'Select City for Coaching',
//                         prefixIcon: Icon(Icons.location_city),
//                       ),
//                       value: _selectedCityForCoaching.isNotEmpty
//                           ? _selectedCityForCoaching
//                           : null,
//                       items: cities.map((String value) {
//                         return DropdownMenuItem<String>(
//                           value: value,
//                           child: Text(value),
//                         );
//                       }).toList(),
//                       onChanged: (value) {
//                         setState(() {
//                           _selectedCityForCoaching = value!;
//                         });
//                       },
//                     ),
//                   ),
//                   const SizedBox(height: 30.0),
//                   // Add Whatsapp Mobile Number field
//                   Padding(
//                     padding: EdgeInsets.symmetric(horizontal: 20.0),
//                     child: TextFormField(
//                       decoration: InputDecoration(
//                         hintText: 'Enter Whatsapp Mobile Number',
//                         prefixIcon: Icon(Icons.phone),
//                       ),
//                       onChanged: (value) =>
//                           setState(() => _whatsappMobileNumber = value),
//                     ),
//                   ),
//                   const SizedBox(height: 30.0),
//                   // Add Email field
//                   Padding(
//                     padding: EdgeInsets.symmetric(horizontal: 20.0),
//                     child: TextFormField(
//                       decoration: InputDecoration(
//                         hintText: 'Enter Email',
//                         prefixIcon: Icon(Icons.email),
//                       ),
//                       onChanged: (value) => setState(() => _email = value),
//                     ),
//                   ),
//                   const SizedBox(height: 30.0),
//                   // Add Password field
//                   Padding(
//                     padding: EdgeInsets.symmetric(horizontal: 20.0),
//                     child: TextFormField(
//                       obscureText: _isObscured,
//                       decoration: InputDecoration(
//                         hintText: 'Password',
//                         prefixIcon: Icon(Icons.vpn_key),
//                         suffixIcon: IconButton(
//                           icon: Icon(_isObscured
//                               ? Icons.visibility
//                               : Icons.visibility_off),
//                           onPressed: () {
//                             setState(() {
//                               _isObscured = !_isObscured;
//                             });
//                           },
//                         ),
//                       ),
//                       onChanged: (value) => setState(() => _password = value),
//                     ),
//                   ),
//                   const SizedBox(height: 30.0),
//                   // Add School/College Name field
//                   Padding(
//                     padding: EdgeInsets.symmetric(horizontal: 20.0),
//                     child: TextFormField(
//                       decoration: InputDecoration(
//                         hintText: 'Enter School/College Name',
//                         prefixIcon: Icon(Icons.school),
//                       ),
//                       onChanged: (value) =>
//                           setState(() => _schoolOrCollegeName = value),
//                     ),
//                   ),
//                   const SizedBox(height: 30.0),
//                   // Add Interested In field
//                   Padding(
//                     padding: EdgeInsets.symmetric(horizontal: 20.0),
//                     child: DropdownButtonFormField<String>(
//                       decoration: InputDecoration(
//                         hintText: 'Select Interest',
//                         prefixIcon: Icon(Icons.star),
//                       ),
//                       value: _interestedIn.isNotEmpty ? _interestedIn : null,
//                       items: interests.map((String value) {
//                         return DropdownMenuItem<String>(
//                           value: value,
//                           child: Text(value),
//                         );
//                       }).toList(),
//                       onChanged: (value) {
//                         setState(() {
//                           _interestedIn = value!;
//                         });
//                       },
//                     ),
//                   ),
//                   const SizedBox(height: 30.0),
//                   // Add Accept Terms and Conditions checkbox
//                   Padding(
//                     padding: EdgeInsets.symmetric(horizontal: 20.0),
//                     child: Row(
//                       children: [
//                         Checkbox(
//                           value: _acceptTermsAndConditions,
//                           onChanged: (value) {
//                             setState(() {
//                               _acceptTermsAndConditions = value!;
//                             });
//                           },
//                         ),
//                         Flexible(
//                           child: Text(
//                             'I accept the ',
//                             style: TextStyle(color: Colors.black),
//                           ),
//                         ),
//                         GestureDetector(
//                           onTap: () {
//                             // Handle your terms and conditions navigation or action
//                           },
//                           child: Text(
//                             'Terms and Conditions',
//                             style: TextStyle(
//                               color: Colors.blue,
//                               decoration: TextDecoration.underline,
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                   const SizedBox(height: 30.0),
//                   // Add Sign Up Button
//                   ElevatedButton(
//                     onPressed: _signUp,
//                     child: Padding(
//                       padding: const EdgeInsets.symmetric(
//                         vertical: 12.0,
//                         horizontal: 70.0,
//                       ),
//                       child: Text(
//                         'Sign Up',
//                         style: TextStyle(color: Colors.white),
//                       ),
//                     ),
//                     style: ElevatedButton.styleFrom(
//                       primary: Colors.blue, // Sky blue background color
//                       shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(8.0),
//                       ),
//                     ),
//                   ),
//                   const SizedBox(height: 25.0),
//                   //Social Icons
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       Icon(FontAwesomeIcons.facebook),
//                       SizedBox(width: 20),
//                       Icon(FontAwesomeIcons.instagram),
//                       SizedBox(width: 20),
//                       Icon(FontAwesomeIcons.pinterest),
//                       SizedBox(width: 20),
//                       Icon(FontAwesomeIcons.linkedin),
//                     ],
//                   ),
//                   const SizedBox(height: 50), // Adjust the height for extra scrolling space
//                 ],
//               ),
//             ),
//             Container(
//               width: double.infinity,
//               decoration: BoxDecoration(
//                 image: DecorationImage(
//                   image:
//                       AssetImage('lib/images/Bottom.png'), // Path to your image
//                   fit: BoxFit.cover,
//                 ),
//               ),
//               child: SizedBox(
//                 height: 100, // Adjust the height as needed
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }


//Properly workong code with api integrated
import 'package:flutter/material.dart';
import 'login_screen.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'api_service.dart'; // Import API service

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  String _fullName = '';
  DateTime? _selectedDate;
  String _education = '';
  String _address = '';
  String _city = '';
  String _selectedCityForCoaching = '';
  String _whatsappMobileNumber = '';
  String _email = '';
  String _schoolOrCollegeName = ''; // Updated initialization
  String _interestedIn = '';
  String _selectedState = 'Maharashtra';
  bool _acceptTermsAndConditions = false;
  String _message = '';

  final List<String> cities = [
    'Aurangabad',
    'Nashik',
    'Pune',
    'Mumbai',
    'Nagpur',
    'Amravati',
    'Solapur',
    'Kolhapur',
    'Thane',
    'Nanded',
    'Latur',
    'Akola',
    'Satar',
    'Jalgaon',
    'Sangli'
  ];

  final List<String> interests = [
    'Sports',
    'Arts & Others',
  ];

  void _signUp() async {
    if (_fullName.isEmpty ||
        _selectedDate == null ||
        _education.isEmpty ||
        _address.isEmpty ||
        _city.isEmpty ||
        _selectedCityForCoaching.isEmpty ||
        _whatsappMobileNumber.isEmpty ||
        _email.isEmpty ||
        _interestedIn.isEmpty ||
        _schoolOrCollegeName.isEmpty || // Validation for School/College Name
        !_acceptTermsAndConditions) {
      setState(() {
        _message = 'Please fill all required fields';
      });
      return;
    }

    Map<String, dynamic> userData = {
      'fullName': _fullName,
      'dateOfBirth': _selectedDate!.toString(),
      'education': _education,
      'address': _address,
      'city': _city,
      'selectedCityForCoaching': _selectedCityForCoaching,
      'whatsappMobileNumber': _whatsappMobileNumber,
      'email': _email,
      'schoolOrCollegeName': _schoolOrCollegeName,
      'interestedIn': _interestedIn,
      'state': _selectedState,
    };

    try {
      final response = await APIService.registerStudent(userData);

      // Handle API response (if needed)
      print(response);

      setState(() {
        _message = 'Signup Successful';
      });

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => LoginPage()),
      );
    } catch (e) {
      setState(() {
        _message = 'Failed to register user: $e';
      });
    }
  }

  void _clearSignUpForm() {
    setState(() {
      _fullName = '';
      _selectedDate = null;
      _education = '';
      _address = '';
      _city = '';
      _selectedCityForCoaching = '';
      _whatsappMobileNumber = '';
      _email = '';
      _schoolOrCollegeName = '';
      _interestedIn = '';
      _selectedState = 'Maharashtra';
      _acceptTermsAndConditions = false;
      _message = '';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Sign Up',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 24.0,
                    ),
                  ),
                  const SizedBox(height: 10.0),
                  // Full Name
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.0),
                    child: Row(
                      children: [
                        Text(
                          'Full Name ',
                          style: TextStyle(color: Colors.black),
                        ),
                        Text(
                          '*',
                          style: TextStyle(color: Colors.red),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.0),
                    child: TextFormField(
                      decoration: InputDecoration(
                        hintText: 'Enter Full Name',
                        prefixIcon: Icon(Icons.person),
                      ),
                      onChanged: (value) => setState(() => _fullName = value),
                    ),
                  ),
                  const SizedBox(height: 30.0),
                  // Date of Birth
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.0),
                    child: Row(
                      children: [
                        Text(
                          'Date of Birth ',
                          style: TextStyle(color: Colors.black),
                        ),
                        Text(
                          '*',
                          style: TextStyle(color: Colors.red),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.0),
                    child: InkWell(
                      onTap: () async {
                        final DateTime? pickedDate = await showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime(1975),
                          lastDate: DateTime.now(),
                        );
                        if (pickedDate != null && pickedDate != _selectedDate) {
                          setState(() {
                            _selectedDate = pickedDate;
                          });
                        }
                      },
                      child: InputDecorator(
                        decoration: InputDecoration(
                          hintText: 'Select Date of Birth',
                          prefixIcon: Icon(Icons.calendar_today),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text(
                              _selectedDate != null
                                  ? '${_selectedDate!.day}-${_selectedDate!.month}-${_selectedDate!.year}'
                                  : 'Select Date',
                            ),
                            Icon(Icons.arrow_drop_down),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 30.0),
                  // Education/Qualification
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.0),
                    child: Row(
                      children: [
                        Text(
                          'Education/Qualification ',
                          style: TextStyle(color: Colors.black),
                        ),
                        Text(
                          '*',
                          style: TextStyle(color: Colors.red),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.0),
                    child: DropdownButtonFormField<String>(
                      decoration: InputDecoration(
                        hintText: 'Select Education/Qualification',
                        prefixIcon: Icon(Icons.school),
                      ),
                      value: _education.isNotEmpty ? _education : null,
                      items: <String>[
                        'In School',
                        'In College',
                        'Others',
                      ].map((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                      onChanged: (value) {
                        setState(() {
                          _education = value!;
                        });
                      },
                    ),
                  ),
                  const SizedBox(height: 30.0),
                  // Address
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.0),
                    child: Row(
                      children: [
                        Text(
                          'Address ',
                          style: TextStyle(color: Colors.black),
                        ),
                        Text(
                          '*',
                          style: TextStyle(color: Colors.red),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.0),
                    child: TextFormField(
                      decoration: InputDecoration(
                        hintText: 'Enter Address',
                        prefixIcon: Icon(Icons.location_on),
                      ),
                      onChanged: (value) => setState(() => _address = value),
                    ),
                  ),
                  const SizedBox(height: 30.0),
                  // State
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.0),
                    child: Row(
                      children: [
                        Text(
                          'State ',
                          style: TextStyle(color: Colors.black),
                        ),
                        Text(
                          '*',
                          style: TextStyle(color: Colors.red),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.0),
                    child: DropdownButtonFormField<String>(
                      decoration: InputDecoration(
                        hintText: 'Select State',
                        prefixIcon: Icon(Icons.location_city),
                      ),
                      value: _selectedState.isNotEmpty ? _selectedState : null,
                      items: <String>[
                        'Maharashtra',
                        // Add other states here
                      ].map((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                      onChanged: (value) {
                        setState(() {
                          _selectedState = value!;
                        });
                      },
                    ),
                  ),
                  const SizedBox(height: 30.0),
                  // City
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.0),
                    child: Row(
                      children: [
                        Text(
                          'City ',
                          style: TextStyle(color: Colors.black),
                        ),
                        Text(
                          '*',
                          style: TextStyle(color: Colors.red),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.0),
                    child: DropdownButtonFormField<String>(
                      decoration: InputDecoration(
                        hintText: 'Select City',
                        prefixIcon: Icon(Icons.location_city),
                      ),
                      value: _city.isNotEmpty ? _city : null,
                      items: cities.map((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                      onChanged: (value) {
                        setState(() {
                          _city = value!;
                        });
                      },
                    ),
                  ),
                  const SizedBox(height: 30.0),
                  // Select City for Coaching
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.0),
                    child: Row(
                      children: [
                        Text(
                          'Select City for Coaching ',
                          style: TextStyle(color: Colors.black),
                        ),
                        Text(
                          '*',
                          style: TextStyle(color: Colors.red),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.0),
                    child: DropdownButtonFormField<String>(
                      decoration: InputDecoration(
                        hintText: 'Select City for Coaching',
                        prefixIcon: Icon(Icons.location_city),
                      ),
                      value: _selectedCityForCoaching.isNotEmpty
                          ? _selectedCityForCoaching
                          : null,
                      items: cities.map((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                      onChanged: (value) {
                        setState(() {
                          _selectedCityForCoaching = value!;
                        });
                      },
                    ),
                  ),
                  const SizedBox(height: 30.0),
                  // Whatsapp Mobile Number
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.0),
                    child: Row(
                      children: [
                        Text(
                          'Whatsapp Mobile Number ',
                          style: TextStyle(color: Colors.black),
                        ),
                        Text(
                          '*',
                          style: TextStyle(color: Colors.red),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.0),
                    child: TextFormField(
                      decoration: InputDecoration(
                        hintText: 'Enter Whatsapp Mobile Number',
                        prefixIcon: Icon(Icons.phone),
                      ),
                      onChanged: (value) =>
                          setState(() => _whatsappMobileNumber = value),
                    ),
                  ),
                  const SizedBox(height: 30.0),
                  // Email
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.0),
                    child: Row(
                      children: [
                        Text(
                          'Email ',
                          style: TextStyle(color: Colors.black),
                        ),
                        Text(
                          '*',
                          style: TextStyle(color: Colors.red),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.0),
                    child: TextFormField(
                      decoration: InputDecoration(
                        hintText: 'Enter Email',
                        prefixIcon: Icon(Icons.email),
                      ),
                      onChanged: (value) => setState(() => _email = value),
                    ),
                  ),
                  const SizedBox(height: 30.0),
                  // School/College Name
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.0),
                    child: Row(
                      children: [
                        Text(
                          'School/College Name ',
                          style: TextStyle(color: Colors.black),
                        ),
                        Text(
                          '*', // Visual indication of mandatory field
                          style: TextStyle(color: Colors.red),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.0),
                    child: TextFormField(
                      decoration: InputDecoration(
                        hintText: 'Enter School/College Name',
                        prefixIcon: Icon(Icons.school),
                      ),
                      onChanged: (value) =>
                          setState(() => _schoolOrCollegeName = value),
                    ),
                  ),
                  const SizedBox(height: 30.0),
                  // Interested In
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.0),
                    child: Row(
                      children: [
                        Text(
                          'Interested in ',
                          style: TextStyle(color: Colors.black),
                        ),
                        Text(
                          '*',
                          style: TextStyle(color: Colors.red),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.0),
                    child: DropdownButtonFormField<String>(
                      decoration: InputDecoration(
                        hintText: 'Select Interest',
                        prefixIcon: Icon(Icons.star),
                      ),
                      value: _interestedIn.isNotEmpty ? _interestedIn : null,
                      items: interests.map((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                      onChanged: (value) {
                        setState(() {
                          _interestedIn = value!;
                        });
                      },
                    ),
                  ),
                  const SizedBox(height: 30.0),
                  // Accept Terms and Conditions
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.0),
                    child: Row(
                      children: [
                        Checkbox(
                          value: _acceptTermsAndConditions,
                          onChanged: (value) {
                            setState(() {
                              _acceptTermsAndConditions = value!;
                            });
                          },
                        ),
                        Flexible(
                          child: Text(
                            'I accept the ',
                            style: TextStyle(color: Colors.black),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            // Handle your terms and conditions navigation or action
                          },
                          child: Text(
                            'Terms and Conditions',
                            style: TextStyle(
                              color: Colors.blue,
                              decoration: TextDecoration.underline,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 30.0),
                  // Show message based on signup attempt result
                  _message.isNotEmpty
                      ? Text(
                          _message,
                          style: TextStyle(
                            color: _message.startsWith('Signup Successful')
                                ? Colors.green
                                : Colors.red,
                          ),
                        )
                      : SizedBox(),
                  const SizedBox(height: 30.0),
                  // Sign Up Button
                  ElevatedButton(
                    onPressed: _signUp,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 12.0,
                        horizontal: 70.0,
                      ),
                      child: Text(
                        'Sign Up',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                  ),
                  const SizedBox(height: 25.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(FontAwesomeIcons.facebook),
                      SizedBox(width: 20),
                      Icon(FontAwesomeIcons.instagram),
                      SizedBox(width: 20),
                      Icon(FontAwesomeIcons.pinterest),
                      SizedBox(width: 20),
                      Icon(FontAwesomeIcons.linkedin),
                    ],
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                ],
              ),
            ),
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('lib/images/Bottom.png'),
                  fit: BoxFit.cover,
                ),
              ),
              child: SizedBox(
                height: 100,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
