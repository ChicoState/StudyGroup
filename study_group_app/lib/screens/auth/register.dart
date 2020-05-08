import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:study_group_app/services/auth.dart';
import 'package:study_group_app/utilities/loading.dart';
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

  // Local variables
  String _email;
  String _password;
  // String _passwordValidation;
  // Stored in Firebase documents, (database)
  // String _firstName;
  // String _lastName;
  bool loading = false;
  bool _validateState = false;
  String error = '';

  // This function sends the registration information to Firebase, after fields have been
  // validated.
  Future<void> sendRegistrationInfo() async {
    dynamic result = _auth.registerNewUser(_email, _password);
    // Output appropriate error if result is null
    if (result == null) {
      setState(() => error = 'Could not register with that information');
      loading = false;
    } else {
      setState(() => _validateState = true);
    }
  }

  @override
  Widget build(BuildContext context) {
    return loading
        ? Loading()
        : Scaffold(
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
                        Color(0XFF64b3f4),
                        Color(0xFFc2e59c),
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
                          Text(
                            'Sign Up Information',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 30),
                          Column(
                            children: <Widget>[
                              CircleAvatar(
                                radius: 40.0,
                                backgroundColor: Colors.white,
                                child: FaIcon(FontAwesomeIcons.solidUser,
                                    size: 57, color: Colors.grey[800]),
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
                                  labelText: 'Enter an email to register',
                                ),
                                validator: Validations.instance.emailValidation,
                                onSaved: (String val) {
                                  _email = val;
                                },
                              ),
                              SizedBox(height: 30),
                              TextFormField(
                                decoration: InputDecoration(
                                  labelText: 'Enter a password',
                                  icon: FaIcon(FontAwesomeIcons.lock),
                                ),
                                obscureText: true,
                                onSaved: (String val) {
                                  _password = val;
                                },
                              ),
                              SizedBox(height: 30),
                              TextFormField(
                                decoration: InputDecoration(
                                  labelText: 'Confirm Password',
                                  icon: FaIcon(FontAwesomeIcons.lock),
                                ),
                                obscureText: true,
                                validator: Validations.instance.password,
                                onSaved: (String val) {
                                  // _passwordValidation = val;
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
                                  color: Color(0xFF599ECA),
                                  letterSpacing: 1.5,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                          RichText(
                            text: TextSpan(
                              text: 'Already have an account? ',
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
      setState(() => loading = true);
      _formKey.currentState.save();
      sendRegistrationInfo();
    } else {
      setState(() => _validateState = true);
    }
  }
}
