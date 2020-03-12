import 'package:flutter/material.dart';
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

  /** Local Variables **/

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
        backgroundColor: Theme.of(context).backgroundColor,
        title: Text('Register'),
      ),
      body: Center(
        child: Form(
          key: _formKey,
          autovalidate: _validateState,
          child: Column(
            children: <Widget>[
              TextFormField(
                decoration: InputDecoration(
                  icon: Icon(Icons.email),
                  hintText: 'Enter an email for registration',
                  labelText: 'Email',
                ),
                keyboardType: TextInputType.emailAddress,
                validator: Validations.instance.emailValidation,
                onSaved: (String val) {
                  _email = val;
                },
              ),
              SizedBox(height: 12),
              TextFormField(
                decoration: InputDecoration(
                  icon: Icon(Icons.lock),
                  hintText: 'Enter a password between 6-20 characters',
                  labelText: 'Password',
                ),
                obscureText: true,
                validator: Validations.instance.password,
                onSaved: (String val) {
                  _password = val;
                },
              ),
              TextFormField(
                decoration: InputDecoration(
                    icon: Icon(Icons.lock), hintText: 'Confirm password'),
                obscureText: true,
                validator: Validations.instance.password,
                onSaved: (String val) {
                  _passwordValidation = val;
                },
              ),
              RaisedButton(
                textColor: Colors.white,
                color: Theme.of(context).buttonColor,
                child: Text("Register"),
                onPressed: formValidate,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
              ),
            ],
          ),
        ),
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
