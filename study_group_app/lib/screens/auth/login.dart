import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:study_group_app/utilities/validations.dart';
import 'package:study_group_app/services/auth.dart';

// Stateful Login Page Class
class LoginPage extends StatefulWidget {
  // Gives us a control on switching to login page. We can call this function locally
  // which calls the registerOrSignIn function from auth_view.dart
  final Function view;
  LoginPage({this.view});
  // Creates the stateful widget LoginPage
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // Form key to validate user entry
  final _formKey = GlobalKey<FormState>();

  // Instance of Auth to call Firebase sign in authentication functions
  final Auth _auth = Auth();

  // Local variables to store email, password, and error
  String email;
  String password;
  String error = '';

  // Holds the state of the forms
  bool _validateState = false;

  Future<void> sendLoginInfo() async {
    dynamic result = await _auth.signInUserWithEmail(email, password);
    if (result == null) {
      print('Error should print');
      setState(() => error = 'Wrong email or password');
    } else {
      setState(() => _validateState = true);
    }
  }

  @override
  void initState() {
    super.initState();
    setState(() {});
  }

  // Main build function, generates the view
  @override
  Widget build(BuildContext context) {
    // Scaffold is from MaterialApp. Implements the basic visual layout
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: AppBar(
        // backgroundColor: Theme.of(context).backgroundColor,
        backgroundColor: Colors.black,
        title: Text('Log In'),
        
      ),
      body: Stack (
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Color(0xFF9FA8DA),
                  Color(0xFF7986CB),
                  Color(0xFF5C6BC0),
                  Color(0xFF5C6BC0),
                ],
              )
            )
          ),
          // Container: UI for Login Form
          Container(
            height: double.infinity,
            child: SingleChildScrollView(
              physics: AlwaysScrollableScrollPhysics(),
              padding: EdgeInsets.symmetric(horizontal:40, vertical:60),
              child: Form(
                key: _formKey,
                autovalidate: _validateState,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'Login Information',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      )
                    ),
                    SizedBox(height:30),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        SizedBox(height:10),
                        TextFormField(
                          keyboardType: TextInputType.emailAddress,
                          decoration: InputDecoration(
                            icon: Icon(Icons.email, color:Colors.white,),
                            labelText: "Email Address",
                          ),
                          validator: Validations.instance.emailValidation,
                          onSaved: (String val) {
                            email = val;
                          }
                        )
                      ],
                    ),
                    SizedBox(height:30),
                    // Password field - actual typed letters are hidden
                    TextFormField(
                      decoration: InputDecoration(
                        labelText: "Password", icon: Icon(Icons.lock, color:Colors.white,)),
                        obscureText: true,
                        onSaved: (String val) {
                          password = val;
                        },
                    ),
                    Container(
                      alignment: Alignment.centerRight,
                      child: FlatButton (
                        onPressed: () {},
                        child: Text(
                          'Forgot Password?',
                          style: TextStyle(
                            color: Colors.white,
                          )
                          ),
                      )
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(vertical:17),
                      width:double.infinity,
                      // Login button
                      child:RaisedButton(
                        onPressed: formValidate,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      child: Text(
                        'LOGIN',
                        style: TextStyle(
                          color: Color(0xFF7986CB),
                          letterSpacing: 1.5,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        )
                      ),
                      )
                    ),
                    Column(
                      children: <Widget>[
                        Text(
                          ' - OR - ',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                          )
                        ),
                        SizedBox(height: 30),
                        RichText(
                          text: TextSpan(
                            text: "Don't have an account? ",
                            style: TextStyle(fontSize: 16),
                            children: [
                              TextSpan(
                                text: 'Sign Up!',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                                recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                   print('WTF');
                                   widget.view();
                                },
                              ),
                            ],
                          ),
                        ),
                        Text(
                          error,
                          style: TextStyle(
                            color: Colors.red,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          )
                        )
                      ],
                    )
                  ],
                ),
              )
            )
          )
        ]
      )
    );
  }

  // Will validate both forms when submit button is pressed
  void formValidate() {
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();
      sendLoginInfo();
    } else {
      setState(() => _validateState = true);
    }
  }
}
