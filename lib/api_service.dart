//Properly working api for student signup api
// import 'dart:convert';
// import 'package:http/http.dart' as http;

// class APIService {
//   static Future<Map<String, dynamic>> registerStudent(
//       Map<String, dynamic> userData) async {
//     final url = Uri.parse(
//         'https://websites.softwaredemo.co.in/fobixo_api/public/api/studentRegister');

//     final response = await http.post(
//       url,
//       headers: {"Content-Type": "application/x-www-form-urlencoded"},
//       body: {
//         'fname': userData['fullName'],
//         'email': userData['email'],
//         'mobile_number': userData['whatsappMobileNumber'],
//         'dob': userData['dateOfBirth'],
//         'school': userData['schoolOrCollegeName'],
//         'education': userData['education'],
//         'sport': userData['interestedIn'],
//         'state': userData['state'],
//         'city': userData['city'],
//         'address': userData['address'],
//         'cityforcoaching': userData['selectedCityForCoaching'],
//       },
//     );

//     if (response.statusCode == 200) {
//       final jsonResponse = json.decode(response.body);
//       return jsonResponse;
//     } else {
//       throw Exception('Failed to register user');
//     }
//   }
// }


//login and signup api combined
import 'dart:convert';
import 'package:http/http.dart' as http;

class APIService {
  static Future<Map<String, dynamic>> loginUser(String username, String password) async {
    final url = Uri.parse('https://websites.softwaredemo.co.in/fobixo_api/public/api/userLogin');

    final response = await http.post(
      url,
      headers: {"Content-Type": "application/x-www-form-urlencoded"},
      body: {
        'username': username,
        'password': password,
      },
    );

    if (response.statusCode == 200) {
      final jsonResponse = json.decode(response.body);
      return jsonResponse;
    } else {
      throw Exception('Failed to login user');
    }
  }

  static Future<Map<String, dynamic>> registerStudent(Map<String, dynamic> userData) async {
    final url = Uri.parse('https://websites.softwaredemo.co.in/fobixo_api/public/api/studentRegister');

    final response = await http.post(
      url,
      headers: {"Content-Type": "application/x-www-form-urlencoded"},
      body: {
        'fname': userData['fullName'],
        'email': userData['email'],
        'mobile_number': userData['whatsappMobileNumber'],
        'dob': userData['dateOfBirth'],
        'school': userData['schoolOrCollegeName'],
        'education': userData['education'],
        'sport': userData['interestedIn'],
        'state': userData['state'],
        'city': userData['city'],
        'address': userData['address'],
        'cityforcoaching': userData['selectedCityForCoaching'],
      },
    );

    if (response.statusCode == 200) {
      final jsonResponse = json.decode(response.body);
      return jsonResponse;
    } else {
      throw Exception('Failed to register user');
    }
  }
}
