import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:study_group_app/services/auth.dart';
import 'package:study_group_app/utilities/validations.dart';

class Register extends StatefulWidget {
  // Gives us a control on switching to login page. We can call this function locally
  // which calls the registerOrSignIn function from auth_view.dart
  final Function view;
  Register({this.view});

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  // Controls validation state for form fields
  final _formKey = GlobalKey<FormState>();
  // Instance of Auth class that talks to Firebase
  final _auth = Auth();

  // Firebase auth required
  String _email;
  String _password;
  String _passwordValidation;

  // Stored in Firebase documents, (database)
  String _firstName;
  String _lastName;

  // Validation/error message
  bool _validateState = false;
  String error = '';

  // This function sends the registration information to Firebase, after fields have been
  // validated.
  Future<void> sendRegistrationInfo() async {
    dynamic result = _auth.registerNewUser(_email, _password);
    // Output appropriate error if result is null
    if (result == null) {
      setState(() => error = 'Could not register with that information');
    } else {
      setState(() => _validateState = true);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: AppBar(
        title: Text('Register'),
      ),
      body: Stack(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  // Color(0xFF9FA8DA),
                  // Color(0xFF7986CB),
                  // Color(0xFF5C6BC0),
                  // Color(0xFF5C6BC0),
                  Color(0xFF30CFD0),
                  Color(0xFF330867),
                ],
              ),
            ),
          ),
          Container(
            height: double.infinity,
            child: SingleChildScrollView(
              physics: AlwaysScrollableScrollPhysics(),
              padding: EdgeInsets.symmetric(horizontal: 40, vertical: 27),
              child: Form(
                key: _formKey,
                autovalidate: _validateState,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text('Sign Up Information',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        )),
                    SizedBox(height: 30),
                    Column(
                      children: <Widget>[
                        CircleAvatar(
                          radius: 40.0,
                          backgroundColor: Colors.white,
                          child: FaIcon(FontAwesomeIcons.solidUser,
                              size: 60, color: Colors.grey[800]),
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        SizedBox(height: 10),
                        TextFormField(
                            keyboardType: TextInputType.emailAddress,
                            decoration: InputDecoration(
                              icon: FaIcon(FontAwesomeIcons.envelope),
                              labelText: "Enter an email to register",
                            ),
                            validator: Validations.instance.emailValidation,
                            onSaved: (String val) {
                              _email = val;
                            }),
                        SizedBox(height: 30),
                        TextFormField(
                          decoration: InputDecoration(
                            labelText: "Enter a password",
                            icon: FaIcon(FontAwesomeIcons.lock),
                          ),
                          obscureText: true,
                          onSaved: (String val) {
                            _password = val;
                          },
                        ),
                        SizedBox(height: 30),
                        // TODO Write function to validate passwords match
                        TextFormField(
                          decoration: InputDecoration(
                            labelText: "Confirm Password",
                            icon: FaIcon(FontAwesomeIcons.lock),
                          ),
                          obscureText: true,
                          validator: Validations.instance.password,
                          onSaved: (String val) {
                            _passwordValidation = val;
                          },
                        ),
                      ],
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(vertical: 17),
                      width: double.infinity,
                      child: RaisedButton(
                        onPressed: formValidate,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: Text(
                          'REGISTER',
                          style: TextStyle(
                            color: Color(0xFF316CC6),
                            letterSpacing: 1.5,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    RichText(
                      text: TextSpan(
                        text: "Already have an account? ",
                        style: TextStyle(fontSize: 16),
                        children: [
                          TextSpan(
                            text: 'Log In!',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                widget.view();
                              },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void formValidate() {
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();
      sendRegistrationInfo();
    } else {
      setState(() => _validateState = true);
    }
  }
}
