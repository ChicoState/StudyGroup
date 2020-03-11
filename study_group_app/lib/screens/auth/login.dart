import 'package:flutter/material.dart';
import 'package:study_group_app/utilities/validations.dart';
import 'package:study_group_app/services/auth.dart';

// Stateful Login Page Class
class LoginPage extends StatefulWidget {
  // Determines what view the user will see. Called from listener
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
  String error;

  // Holds the state of the forms
  bool _validateState = false;

  Future<void> sendLoginInfo() async {
    dynamic result = await _auth.signInUserWithEmail(email, password);
    if (result == null) {
      print('Error should print');
      setState(() => error = 'Wrong email or password');
    } else {
      setState(() {
        _validateState = true;
      });
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
        backgroundColor: Colors.grey,
        title: Text('Log in'),
      ),
      // Container: UI for Login Form
      body: Center(
        child: Form(
          key: _formKey,
          autovalidate: _validateState,
          child: Column(
            children: <Widget>[
              Text(
                'Login Information',
                style: TextStyle(fontSize: 20),
              ),
              // Email field
              TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    icon: Icon(Icons.person),
                    labelText: "Email Address",
                  ),
                  validator: Validations.instance.emailValidation,
                  onSaved: (String val) {
                    email = val;
                  }),
              // Password field - actual typed letters are hidden
              TextFormField(
                decoration: InputDecoration(
                    labelText: "Password", icon: Icon(Icons.lock)),
                obscureText: true,
                onSaved: (String val) {
                  password = val;
                },
              ),
              // Login button
              RaisedButton(
                textColor: Colors.white,
                color: Colors.grey,
                onPressed: formValidate,
                child: Text('Login'),
              ),
              SizedBox(height: 12.0),
              Text(error,
                  style: TextStyle(
                      color: Colors.red,
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold)),
            ],
          ),
        ),
      ),
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

/* The following code is for Google Authentication, currently in the works and
    will be comment out for now.

    Handles authentication of user sign-in
    Taken from: https://pub.dev/packages/firebase_auth
    Using for authentication testing for now.

Future<FirebaseUser> _handleSignIn() async {
  final GoogleSignInAccount googleUser = await _googleSignIn.signIn();
  final GoogleSignInAuthentication googleAuth = await googleUser.authentication;

  final AuthCredential credential = GoogleAuthProvider.getCredential(
    accessToken: googleAuth.accessToken,
    idToken: googleAuth.idToken,
  );

  final FirebaseUser user = (await _auth.signInWithCredential(credential)).user;
  print("signed in " + user.displayName);
  return user;
}
 
    From sign-in button onPress call _handleSignIn() method 
    using a future callback for both FirebaseUser and possible exception
    _handleSignIn()
        .then((FirebaseUser user) => print(user))
        .catchError((e) => print(e));
*/
