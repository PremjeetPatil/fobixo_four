//Working code before database 06/03/24

// import 'package:flutter/material.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// import 'signup_page.dart';
// import 'fobixo.dart'; // Import the Fobixo screen file

// class LoginScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Fobixo',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: LoginPage(),
//     );
//   }
// }

// class LoginPage extends StatefulWidget {
//   const LoginPage({Key? key}) : super(key: key);

//   @override
//   State<LoginPage> createState() => _LoginPageState();
// }

// class _LoginPageState extends State<LoginPage> {
//   bool _rememberMe = false;
//   String _email = '';
//   String _password = '';
//   bool _isObscured = true;

//   // Login function with redirection logic
//   void _login() {
//     // Validate user input
//     if (_email.isEmpty || _password.isEmpty) {
//       // Show error message
//       return;
//     }

//     // Check if entered credentials match the hardcoded values
//     if (_email == 'admin@gmail.com' && _password == 'Fobixo@123') {
//       // Navigate to "Fobixo" page
//       Navigator.push(
//         context,
//         MaterialPageRoute(builder: (context) => Fobixo()),
//       );
//     } else {
//       // Show error message or handle invalid credentials
//       // For simplicity, you can just print a message
//       print('Invalid credentials');
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
//         physics: NeverScrollableScrollPhysics(),
//         child: Container(
//           child: Padding(
//             padding: const EdgeInsets.all(20.0),
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               crossAxisAlignment: CrossAxisAlignment.center,
//               children: [
//                 Text(
//                   'Login',
//                   style: TextStyle(
//                     fontWeight: FontWeight.bold,
//                     fontSize: 24.0,
//                   ),
//                 ),
//                 const SizedBox(height: 10.0),
//                 Text(
//                   'By signing in you are agreeing to our ',
//                   style: TextStyle(color: Colors.black),
//                 ),
//                 Text(
//                   'Term and privacy policy',
//                   style: TextStyle(color: Colors.blue),
//                 ),
//                 const SizedBox(height: 30.0),
//                 // Row(
//                 //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                 //   children: [
//                 //     TextButton(
//                 //       onPressed: () {
//                 //         Navigator.push(
//                 //           context,
//                 //           MaterialPageRoute(
//                 //               builder: (context) => LoginPage()),
//                 //         );
//                 //       },
//                 //       child: Text(
//                 //         'Login',
//                 //         style: TextStyle(color: Colors.blue),
//                 //       ),
//                 //     ),
//                 //     TextButton(
//                 //       onPressed: () {
//                 //         Navigator.push(
//                 //           context,
//                 //           MaterialPageRoute(
//                 //               builder: (context) => SignUpScreen()),
//                 //         );
//                 //       },
//                 //       child: Text(
//                 //         'Register',
//                 //         style: TextStyle(color: Colors.blue),
//                 //       ),
//                 //     ),
//                 //   ],
//                 // ),
//                 const SizedBox(height: 30.0),
//                 Padding(
//                   padding: EdgeInsets.symmetric(horizontal: 20.0),
//                   child: TextFormField(
//                     decoration: InputDecoration(
//                       hintText: 'Email Address',
//                       prefixIcon: Icon(Icons.email),
//                     ),
//                     keyboardType: TextInputType.emailAddress,
//                     onChanged: (value) => setState(() => _email = value),
//                   ),
//                 ),
//                 const SizedBox(height: 30.0),
//                 Padding(
//                   padding: EdgeInsets.symmetric(horizontal: 20.0),
//                   child: TextFormField(
//                     obscureText: _isObscured,
//                     decoration: InputDecoration(
//                       hintText: 'Password',
//                       prefixIcon: Icon(Icons.vpn_key),
//                       suffixIcon: IconButton(
//                         icon: Icon(_isObscured
//                             ? Icons.visibility
//                             : Icons.visibility_off),
//                         onPressed: () {
//                           setState(() {
//                             _isObscured = !_isObscured;
//                           });
//                         },
//                       ),
//                     ),
//                     onChanged: (value) => setState(() => _password = value),
//                   ),
//                 ),
//                 const SizedBox(height: 30.0),
//                 Row(
//                   children: [
//                     Checkbox(
//                       value: _rememberMe,
//                       onChanged: (value) =>
//                           setState(() => _rememberMe = value ?? false),
//                     ),
//                     Text('Remember password'),
//                     Spacer(),
//                     Text(
//                       'Forgot password?',
//                       style: TextStyle(color: Colors.blue),
//                     ),
//                   ],
//                 ),
//                 const SizedBox(height: 30.0),

//                 //Register
//                 TextButton(
//                   onPressed: () {
//                     Navigator.push(
//                       context,
//                       MaterialPageRoute(builder: (context) => SignUpScreen()),
//                     );
//                   },
//                   child: Text(
//                     'Register',
//                     style: TextStyle(color: Colors.blue),
//                   ),
//                 ),
//                 const SizedBox(height: 30.0),

//                 //Login Button
//                 ElevatedButton(
//                   onPressed: _login,
//                   child: Padding(
//                     padding: const EdgeInsets.symmetric(
//                       vertical: 12.0,
//                       horizontal: 70.0,
//                     ),
//                     child: Text(
//                       'Login',
//                       style: TextStyle(color: Colors.white),
//                     ),
//                   ),
//                   style: ElevatedButton.styleFrom(
//                     primary: Colors.blue, // Sky blue background color
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(8.0),
//                     ),
//                   ),
//                 ),
//                 const SizedBox(height: 25.0),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     Icon(FontAwesomeIcons.facebook),
//                     SizedBox(width: 20),
//                     Icon(FontAwesomeIcons.instagram),
//                     SizedBox(width: 20),
//                     Icon(FontAwesomeIcons.pinterest),
//                     SizedBox(width: 20),
//                     Icon(FontAwesomeIcons.linkedin),
//                   ],
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//       bottomNavigationBar: Container(
//         width: double.infinity,
//         decoration: BoxDecoration(
//           image: DecorationImage(
//             image: AssetImage('lib/images/Bottom.png'), // Path to your image
//             fit: BoxFit.cover,
//           ),
//         ),
//         child: SizedBox(
//           height: 100, // Adjust the height as needed
//         ),
//       ),
//     );
//   }
// }


//Working code bitbucket
// import 'package:flutter/material.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// import 'signup_page.dart';
// import 'fobixo.dart'; // Import the Fobixo screen file

// class LoginScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Fobixo',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: LoginPage(),
//     );
//   }
// }

// class LoginPage extends StatefulWidget {
//   const LoginPage({Key? key}) : super(key: key);

//   @override
//   State<LoginPage> createState() => _LoginPageState();
// }

// class _LoginPageState extends State<LoginPage> {
//   bool _rememberMe = false;
//   String _email = '';
//   String _password = '';
//   bool _isObscured = true;

//   // Login function with redirection logic
//   void _login() {
//     // Validate user input
//     if (_email.isEmpty || _password.isEmpty) {
//       // Show error message
//       return;
//     }

//     // Check if entered credentials match the hardcoded values
//     if (_email == 'admin@gmail.com' && _password == 'Fobixo@123') {
//       // Navigate to "Fobixo" page
//       Navigator.push(
//         context,
//         MaterialPageRoute(builder: (context) => Fobixo()),
//       );
//     } else {
//       // Show error message or handle invalid credentials
//       // For simplicity, you can just print a message
//       print('Invalid credentials');
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
//         physics: NeverScrollableScrollPhysics(),
//         child: Container(
//           child: Padding(
//             padding: const EdgeInsets.all(20.0),
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               crossAxisAlignment: CrossAxisAlignment.center,
//               children: [
//                 Text(
//                   'Login',
//                   style: TextStyle(
//                     fontWeight: FontWeight.bold,
//                     fontSize: 24.0,
//                   ),
//                 ),
//                 const SizedBox(height: 10.0),
//                 Text(
//                   'By signing in you are agreeing to our ',
//                   style: TextStyle(color: Colors.black),
//                 ),
//                 Text(
//                   'Term and privacy policy',
//                   style: TextStyle(color: Colors.blue),
//                 ),
//                 const SizedBox(height: 30.0),
//                 // Row(
//                 //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                 //   children: [
//                 //     TextButton(
//                 //       onPressed: () {
//                 //         Navigator.push(
//                 //           context,
//                 //           MaterialPageRoute(
//                 //               builder: (context) => LoginPage()),
//                 //         );
//                 //       },
//                 //       child: Text(
//                 //         'Login',
//                 //         style: TextStyle(color: Colors.blue),
//                 //       ),
//                 //     ),
//                 //     TextButton(
//                 //       onPressed: () {
//                 //         Navigator.push(
//                 //           context,
//                 //           MaterialPageRoute(
//                 //               builder: (context) => SignUpScreen()),
//                 //         );
//                 //       },
//                 //       child: Text(
//                 //         'Register',
//                 //         style: TextStyle(color: Colors.blue),
//                 //       ),
//                 //     ),
//                 //   ],
//                 // ),
//                 const SizedBox(height: 30.0),
//                 Padding(
//                   padding: EdgeInsets.symmetric(horizontal: 20.0),
//                   child: TextFormField(
//                     decoration: InputDecoration(
//                       hintText: 'Email Address',
//                       prefixIcon: Icon(Icons.email),
//                     ),
//                     keyboardType: TextInputType.emailAddress,
//                     onChanged: (value) => setState(() => _email = value),
//                   ),
//                 ),
//                 const SizedBox(height: 30.0),
//                 Padding(
//                   padding: EdgeInsets.symmetric(horizontal: 20.0),
//                   child: TextFormField(
//                     obscureText: _isObscured,
//                     decoration: InputDecoration(
//                       hintText: 'Password',
//                       prefixIcon: Icon(Icons.vpn_key),
//                       suffixIcon: IconButton(
//                         icon: Icon(_isObscured
//                             ? Icons.visibility
//                             : Icons.visibility_off),
//                         onPressed: () {
//                           setState(() {
//                             _isObscured = !_isObscured;
//                           });
//                         },
//                       ),
//                     ),
//                     onChanged: (value) => setState(() => _password = value),
//                   ),
//                 ),
//                 const SizedBox(height: 30.0),
//                 Row(
//                   children: [
//                     Checkbox(
//                       value: _rememberMe,
//                       onChanged: (value) =>
//                           setState(() => _rememberMe = value ?? false),
//                     ),
//                     Text('Remember password'),
//                     Spacer(),
//                     Text(
//                       'Forgot password?',
//                       style: TextStyle(color: Colors.blue),
//                     ),
//                   ],
//                 ),
//                 const SizedBox(height: 30.0),

//                 //Register
//                 TextButton(
//                   onPressed: () {
//                     Navigator.push(
//                       context,
//                       MaterialPageRoute(builder: (context) => SignUpScreen()),
//                     );
//                   },
//                   child: Text(
//                     'Register',
//                     style: TextStyle(color: Colors.blue),
//                   ),
//                 ),
//                 const SizedBox(height: 30.0),

//                 //Login Button
//                 ElevatedButton(
//                   onPressed: _login,
//                   child: Padding(
//                     padding: const EdgeInsets.symmetric(
//                       vertical: 12.0,
//                       horizontal: 70.0,
//                     ),
//                     child: Text(
//                       'Login',
//                       style: TextStyle(color: Colors.white),
//                     ),
//                   ),
//                   style: ElevatedButton.styleFrom(
//                     primary: Colors.blue, // Sky blue background color
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(8.0),
//                     ),
//                   ),
//                 ),
//                 const SizedBox(height: 25.0),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     Icon(FontAwesomeIcons.facebook),
//                     SizedBox(width: 20),
//                     Icon(FontAwesomeIcons.instagram),
//                     SizedBox(width: 20),
//                     Icon(FontAwesomeIcons.pinterest),
//                     SizedBox(width: 20),
//                     Icon(FontAwesomeIcons.linkedin),
//                   ],
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//       bottomNavigationBar: Container(
//         width: double.infinity,
//         decoration: BoxDecoration(
//           image: DecorationImage(
//             image: AssetImage('lib/images/Bottom.png'), // Path to your image
//             fit: BoxFit.cover,
//           ),
//         ),
//         child: SizedBox(
//           height: 100, // Adjust the height as needed
//         ),
//       ),
//     );
//   }
// }

//Working code with database 06/03/2024
// import 'package:flutter/material.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// import 'signup_page.dart';
// import 'fobixo.dart'; // Import the Fobixo screen file
// import 'database_helper.dart'; // Import the DatabaseHelper class

// class LoginScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Fobixo',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: LoginPage(),
//     );
//   }
// }

// class LoginPage extends StatefulWidget {
//   const LoginPage({Key? key}) : super(key: key);

//   @override
//   State<LoginPage> createState() => _LoginPageState();
// }

// class _LoginPageState extends State<LoginPage> {
//   final DatabaseHelper _databaseHelper = DatabaseHelper.instance; // Initialize DatabaseHelper

//   bool _rememberMe = false;
//   String _email = '';
//   String _password = '';
//   bool _isObscured = true;

//   // Login function with redirection logic
//   void _login() async {
//     // Validate user input
//     if (_email.isEmpty || _password.isEmpty) {
//       // Show error message
//       return;
//     }

//     // Authenticate user using the DatabaseHelper
//     bool isAuthenticated = await _databaseHelper.checkUser(_email, _password);

//     if (isAuthenticated) {
//       // Navigate to "Fobixo" page
//       Navigator.push(
//         context,
//         MaterialPageRoute(builder: (context) => Fobixo()),
//       );
//     } else {
//       // Show error message or handle invalid credentials
//       // For simplicity, you can just print a message
//       print('Invalid credentials');
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
//         physics: NeverScrollableScrollPhysics(),
//         child: Container(
//           child: Padding(
//             padding: const EdgeInsets.all(20.0),
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               crossAxisAlignment: CrossAxisAlignment.center,
//               children: [
//                 Text(
//                   'Login',
//                   style: TextStyle(
//                     fontWeight: FontWeight.bold,
//                     fontSize: 24.0,
//                   ),
//                 ),
//                 const SizedBox(height: 10.0),
//                 Text(
//                   'By signing in you are agreeing to our ',
//                   style: TextStyle(color: Colors.black),
//                 ),
//                 Text(
//                   'Term and privacy policy',
//                   style: TextStyle(color: Colors.blue),
//                 ),
//                 const SizedBox(height: 30.0),
//                 const SizedBox(height: 30.0),
//                 Padding(
//                   padding: EdgeInsets.symmetric(horizontal: 20.0),
//                   child: TextFormField(
//                     decoration: InputDecoration(
//                       hintText: 'Email Address',
//                       prefixIcon: Icon(Icons.email),
//                     ),
//                     keyboardType: TextInputType.emailAddress,
//                     onChanged: (value) => setState(() => _email = value),
//                   ),
//                 ),
//                 const SizedBox(height: 30.0),
//                 Padding(
//                   padding: EdgeInsets.symmetric(horizontal: 20.0),
//                   child: TextFormField(
//                     obscureText: _isObscured,
//                     decoration: InputDecoration(
//                       hintText: 'Password',
//                       prefixIcon: Icon(Icons.vpn_key),
//                       suffixIcon: IconButton(
//                         icon: Icon(_isObscured
//                             ? Icons.visibility
//                             : Icons.visibility_off),
//                         onPressed: () {
//                           setState(() {
//                             _isObscured = !_isObscured;
//                           });
//                         },
//                       ),
//                     ),
//                     onChanged: (value) => setState(() => _password = value),
//                   ),
//                 ),
//                 const SizedBox(height: 30.0),
//                 Row(
//                   children: [
//                     Checkbox(
//                       value: _rememberMe,
//                       onChanged: (value) =>
//                           setState(() => _rememberMe = value ?? false),
//                     ),
//                     Text('Remember password'),
//                     Spacer(),
//                     Text(
//                       'Forgot password?',
//                       style: TextStyle(color: Colors.blue),
//                     ),
//                   ],
//                 ),
//                 const SizedBox(height: 30.0),

//                 //Register
//                 TextButton(
//                   onPressed: () {
//                     Navigator.push(
//                       context,
//                       MaterialPageRoute(builder: (context) => SignUpScreen()),
//                     );
//                   },
//                   child: Text(
//                     'Register',
//                     style: TextStyle(color: Colors.blue),
//                   ),
//                 ),
//                 const SizedBox(height: 30.0),

//                 //Login Button
//                 ElevatedButton(
//                   onPressed: _login,
//                   child: Padding(
//                     padding: const EdgeInsets.symmetric(
//                       vertical: 12.0,
//                       horizontal: 70.0,
//                     ),
//                     child: Text(
//                       'Login',
//                       style: TextStyle(color: Colors.white),
//                     ),
//                   ),
//                   style: ElevatedButton.styleFrom(
//                     primary: Colors.blue, // Sky blue background color
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(8.0),
//                     ),
//                   ),
//                 ),
//                 const SizedBox(height: 25.0),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     Icon(FontAwesomeIcons.facebook),
//                     SizedBox(width: 20),
//                     Icon(FontAwesomeIcons.instagram),
//                     SizedBox(width: 20),
//                     Icon(FontAwesomeIcons.pinterest),
//                     SizedBox(width: 20),
//                     Icon(FontAwesomeIcons.linkedin),
//                   ],
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//       bottomNavigationBar: Container(
//         width: double.infinity,
//         decoration: BoxDecoration(
//           image: DecorationImage(
//             image: AssetImage('lib/images/Bottom.png'), // Path to your image
//             fit: BoxFit.cover,
//           ),
//         ),
//         child: SizedBox(
//           height: 100, // Adjust the height as needed
//         ),
//       ),
//     );
//   }
// }

//Api Integrated code working properly
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'signup_page.dart';
import 'fobixo.dart';
import 'api_service.dart'; // Import the APIService class

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fobixo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LoginPage(),
    );
  }
}

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _rememberMe = false;
  String _username = '';
  String _password = '';
  bool _isObscured = true;

  // Login function with redirection logic
  void _login() {
    // Validate user input
    if (_username.isEmpty || _password.isEmpty) {
      // Show error message
      return;
    }

    // Call the login API
    APIService.loginUser(_username, _password).then((response) {
      // Check if login was successful
      if (response['status'] == 'success') {
        // Navigate to Fobixo screen
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => Fobixo()),
        );
      } else {
        // Show error message
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Login failed. Please try again.'),
          ),
        );
      }
    }).catchError((error) {
      // Handle API error
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Failed to login. Please try again later.'),
        ),
      );
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
        physics: NeverScrollableScrollPhysics(),
        child: Container(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Login',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 24.0,
                  ),
                ),
                const SizedBox(height: 10.0),
                Text(
                  'By signing in you are agreeing to our ',
                  style: TextStyle(color: Colors.black),
                ),
                Text(
                  'Term and privacy policy',
                  style: TextStyle(color: Colors.blue),
                ),
                const SizedBox(height: 30.0),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.0),
                  child: TextFormField(
                    decoration: InputDecoration(
                      hintText: 'Username',
                      prefixIcon: Icon(Icons.person),
                    ),
                    onChanged: (value) => setState(() => _username = value),
                  ),
                ),
                const SizedBox(height: 30.0),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.0),
                  child: TextFormField(
                    obscureText: _isObscured,
                    decoration: InputDecoration(
                      hintText: 'Password',
                      prefixIcon: Icon(Icons.vpn_key),
                      suffixIcon: IconButton(
                        icon: Icon(_isObscured
                            ? Icons.visibility
                            : Icons.visibility_off),
                        onPressed: () {
                          setState(() {
                            _isObscured = !_isObscured;
                          });
                        },
                      ),
                    ),
                    onChanged: (value) => setState(() => _password = value),
                  ),
                ),
                const SizedBox(height: 30.0),
                Row(
                  children: [
                    Checkbox(
                      value: _rememberMe,
                      onChanged: (value) =>
                          setState(() => _rememberMe = value ?? false),
                    ),
                    Text('Remember password'),
                    Spacer(),
                    Text(
                      'Forgot password?',
                      style: TextStyle(color: Colors.blue),
                    ),
                  ],
                ),
                const SizedBox(height: 30.0),

                //Register
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => SignUpScreen()),
                    );
                  },
                  child: Text(
                    'Register',
                    style: TextStyle(color: Colors.blue),
                  ),
                ),
                const SizedBox(height: 30.0),

                //Login Button
                ElevatedButton(
                  onPressed: _login,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 12.0,
                      horizontal: 70.0,
                    ),
                    child: Text(
                      'Login',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue, // Sky blue background color
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
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('lib/images/Bottom.png'), // Path to your image
            fit: BoxFit.cover,
          ),
        ),
        child: SizedBox(
          height: 100, // Adjust the height as needed
        ),
      ),
    );
  }
}
