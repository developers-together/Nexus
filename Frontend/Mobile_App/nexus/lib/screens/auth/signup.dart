// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'package:flutter/material.dart';
import 'package:Nexus/Login.dart';
class SignupPage extends StatefulWidget {
  @override
  State<SignupPage> createState() => _SignupPageState();
}
class _SignupPageState extends State<SignupPage> {
  bool passwordVisible1 = true;
  bool passwordVisible2 = true;
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _confirmPasswordController = TextEditingController();
  bool _passwordsMatch = true; // Flag to track if passwords match
  final _formKey = GlobalKey<FormState>();
  @override
  void dispose() {
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Color(0xFF747EF5),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_ios_rounded,
          size: 35,
          color: Color(0xFF3B3084),
          ),
          ),
      ),
      body:Container(
        padding: EdgeInsets.only(top: 30),
        color: Color(0xFF747EF5),
        child: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                color: Color(0xFF453F87),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(40.0),
                  topRight: Radius.circular(40.0),
                ),
              ),
              height: double.infinity,
              width: double.infinity,
            ),
            Positioned.fill(
              child: SafeArea(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 0),
                      child: Text(
                        "Sign Up",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontFamily: 'arial',
                          fontSize: 35,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 40),
                      child: Column(
                        children: <Widget>[
                          SizedBox(height: 5),
                          // username text field position
                          buildusernameField(),
                          SizedBox(height: 20),
                          // Email text field position
                          buildEmailField(),
                          SizedBox(height: 20),
                          // Password text field position
                          buildPasswordField(),
                          SizedBox(height: 20),
                          // confirm Password text field position
                          buildconfirmPasswordField(),
                          SizedBox(height: 10),
                          // Error message if passwords don't match
                          if (!_passwordsMatch)
                            Text(
                              'Passwords do not match',
                              style: TextStyle(
                                color: Colors.red,
                              ),
                            ),
                          SizedBox(height: 10),
                          // White login button
                          MaterialButton(
                            elevation: 10,
                            minWidth: MediaQuery.of(context).size.width - 60,
                            height: 60,
                            // Check if passwords match
                            onPressed: () {
                              if (_passwordController.text != _confirmPasswordController.text) {
                                setState((){
                                    _passwordsMatch = false;
                                  }
                                );
                              } else {
                                setState(() {
                                  _passwordsMatch = true;
                                });
                              }
                              if (_formKey.currentState != null && _formKey.currentState!.validate()) {
                                // All fields are valid, perform login
                                // Add your login logic here
                              } else {
                                // Validation failed, show error message
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text('Please fill in all fields'),
                                  ),
                                );
                              }
                            },
                            color: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: Text(
                              "Sign Up",
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 24,
                                color: Color(0xFF3B3084),
                              ),
                            ),
                          ),
                          SizedBox(height: 10),
                        ],
                      ),
                    ),
                    // Sign up button and text
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          "Already have an Account?",
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(width: 0),
                        // Sign up button
                        MaterialButton(
                          elevation: 10,
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => LoginPage(),
                              ),
                            );
                          },
                          child: Text(
                            "Login",
                            style: TextStyle(
                              fontFamily: 'arial',
                              fontWeight: FontWeight.w600,
                              fontSize: 18,
                              color: Colors.white,
                              decoration: TextDecoration.underline,
                              decorationColor: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
  Widget buildusernameField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Row(
          children: [
            Icon(
              Icons.person_rounded,
              color: Colors.white,
            ),
            SizedBox(width: 5),
            Text(
              "Full Name",
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w400,
                color: Colors.white,
              ),
            ),
          ],
        ),
        SizedBox(
          height: 5,
        ),
        TextFormField(
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter your Full Name';
            }
            return null;
            },
          cursorColor: Colors.white,
          style: TextStyle(
            color: Colors.white,
          ),
          decoration: InputDecoration(
            fillColor: const Color.fromARGB(26, 255, 255, 255),
            filled: true,
            hintText: "Enter your Full Name",
            hintStyle: TextStyle(
              color: Colors.grey,
              fontSize: 12,
            ),
            contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Color(0xFF747EF5)),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.white),
            ),
            border: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.white),
            ),
          ),
        ),
      ],
    );
  }
  Widget buildEmailField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Row(
          children: [
            Icon(
              Icons.email_outlined,
              color: Colors.white,
            ),
            SizedBox(width: 5),
            Text(
              "Email",
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w400,
                color: Colors.white,
              ),
            ),
          ],
        ),
        SizedBox(
          height: 5,
        ),
        TextFormField(
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter your Email';
            }
            return null;
            },
          cursorColor: Colors.white,
          style: TextStyle(
            color: Colors.white,
          ),
          decoration: InputDecoration(
            fillColor: const Color.fromARGB(26, 255, 255, 255),
            filled: true,
            hintText: "Enter your Email",
            hintStyle: TextStyle(
              color: Colors.grey,
              fontSize: 12,
            ),
            contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Color(0xFF747EF5)),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.white),
            ),
            border: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.white),
            ),
          ),
        ),
      ],
    );
  }
  Widget buildPasswordField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Row(
          children: [
            Expanded(
              child: Row(
                children: [
                  Icon(
                    Icons.lock,
                    color: Colors.white,
                  ),
                  SizedBox(width: 5),
                  Text(
                    "Password",
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w400,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        SizedBox(
          height: 5,
        ),
        TextFormField(
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter your Password';
            }
            return null;
            },
          controller: _passwordController,
          cursorColor: Colors.white,
          style: TextStyle(
            color: Colors.white,
          ),
          obscureText: passwordVisible1,
          decoration: InputDecoration(
            fillColor: const Color.fromARGB(26, 255, 255, 255),
            filled: true,
            hintText: "Enter your Password",
            hintStyle: TextStyle(
              color: Colors.grey,
              fontSize: 12,
            ),
            contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Color(0xFF747EF5)),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.white),
            ),
            border: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.white),
            ),
            suffixIcon: IconButton(
              onPressed: () {
                setState(() {
                  passwordVisible1 = !passwordVisible1;
                });
              },
              icon:Row(
                mainAxisSize: MainAxisSize.min,
                  children: [ 
                    Text(passwordVisible1 ? "Show" : "Hide",
                    style: 
                      TextStyle(
                        color: Color.fromARGB(255, 172, 179, 248),
                      ),
                    ),
                    SizedBox(width: 2,),
                    // Icon(
                    // passwordVisible1 ? Icons.visibility : Icons.visibility_off,
                    // color: Colors.grey,
                    // ),
                  ],
              ),
          ),
        ),
        ),
      ],
    );
  }
  Widget buildconfirmPasswordField(){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Row(
          children: [
            Expanded(
              child: Row(
                children: [
                  Icon(
                    Icons.lock,
                    color: Colors.white,
                  ),
                  SizedBox(width: 5),
                  Text(
                    "Confirm Password",
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w400,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        SizedBox(
          height: 5,
        ),
        TextFormField(
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter your Password again';
            }
            return null;
            },
          controller: _confirmPasswordController,
          cursorColor: Colors.white,
          style: TextStyle(
            color: Colors.white,
          ),
          obscureText: passwordVisible2,
          decoration: InputDecoration(
            fillColor: const Color.fromARGB(26, 255, 255, 255),
            filled: true,
            hintText: "Enter your Password again",
            hintStyle: TextStyle(
              color: Colors.grey,
              fontSize: 12,
            ),
            contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Color(0xFF747EF5)),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.white),
            ),
            border: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.white),
            ),
            suffixIcon: IconButton(
              onPressed: () {
                setState(() {
                  passwordVisible2 = !passwordVisible2;
                });
              },
              icon:Row(
                mainAxisSize: MainAxisSize.min,
                  children: [ 
                    Text(passwordVisible2 ? "Show" : "Hide",
                    style: TextStyle(
                      color: Color.fromARGB(255, 172, 179, 248),
                    ),
                    ),
                    SizedBox(width: 2,),
                    // Icon(
                    // passwordVisible2 ? Icons.visibility : Icons.visibility_off,
                    // color: Colors.grey,
                    // ),
                  ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}