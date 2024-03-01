import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';


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
  String _password = '';
  String _schoolOrCollegeName = '';
  String _interestedIn = '';
  bool _acceptTermsAndConditions = false;
  bool _isObscured = true;

  // List of cities
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

  // List of interests
  final List<String> interests = [
    'Sports',
    'Arts & Others',
  ];

  // Sign up function (placeholder for now)
  void _signUp() {
    // Validate user input
    if (_fullName.isEmpty ||
        _selectedDate == null ||
        _education.isEmpty ||
        _address.isEmpty ||
        _city.isEmpty ||
        _selectedCityForCoaching.isEmpty ||
        _whatsappMobileNumber.isEmpty ||
        _email.isEmpty ||
        _password.isEmpty ||
        _interestedIn.isEmpty ||
        !_acceptTermsAndConditions) {
      // Show error message
      return;
    }

    // Send sign up request to your backend server (not implemented here)
    print(
        'Signing up with Full Name: $_fullName, Date of Birth: $_selectedDate, Education: $_education, Address: $_address, City: $_city, Select City for Coaching: $_selectedCityForCoaching, WhatsApp Mobile Number: $_whatsappMobileNumber, Email: $_email, Password: $_password, School/College Name: $_schoolOrCollegeName, Interested In: $_interestedIn, Accept Terms and Conditions: $_acceptTermsAndConditions');
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
                      primary: Colors.blue, // Sky blue background color
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                  ),
                  const SizedBox(height: 25.0),
                  // Social Icons
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
                  const SizedBox(height: 50), // Adjust the height for extra scrolling space
                ],
              ),
            ),
            Container(
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
          ],
        ),
      ),
    );
  }
}
