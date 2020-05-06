import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:study_group_app/models/user.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:study_group_app/services/user_service.dart';

//class ProfileSettingsPage extends StatelessWidget {
  class ProfileSettings extends StatefulWidget {
  // Gives us a control on switching to login page. We can call this function locally
  // which calls the registerOrSignIn function from auth_view.dart
  final User user;
  ProfileSettings({this.user});

  @override
  _ProfileSettingsState createState() => _ProfileSettingsState();
}

class _ProfileSettingsState extends State<ProfileSettings> {
  //final User user;
  //ProfileSettings({this.user});

  // Controls validation state for form fields
  final _formKey = GlobalKey<FormState>();
  String newUserName;
  String error = '';
  bool loading = false;
  bool _validateState = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: AppBar(
        backgroundColor: Theme.of(context).appBarTheme.color,
        title: Text('Edit Profile'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[

            const SizedBox(height: 10.0),

            Card(
              elevation: 4.0,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
              margin: const EdgeInsets.fromLTRB(29.0, 8.0, 29.0, 16.0),
              color: Colors.white,
              child: Column(
                children: <Widget>[  

                  /* ----- Edit Name ------ */
                  ListTile(
                    onTap: () {
                      // Action to edit name in Firebase
                    },
                    title: Text('${widget.user.firstName} ${widget.user.lastName}'), // Grab from Firebase
                    leading: Icon(Icons.face),
                    trailing: Icon(Icons.edit),
                  ),

                  _divider(),

                  /* ----- Edit Username ------ */
                  ListTile(
                    onTap: () {
                      // Action to edit username in Firebase
                      showDialog(
                        context: context,
                        barrierDismissible: true,
                        // User Input: gets new name
                        builder: (_) => AlertDialog(
                          title: Text('Change your name'),
                          content: TextFormField(
                            key: _formKey,
                            decoration: InputDecoration(
                              hintText: '${widget.user.userName}',
                            ),
                            validator: (String value) {
                              if (value.isEmpty) {
                                return 'Enter a valid username.\n';
                              }
                                return null;
                              },
                            onSaved: (String value) {
                              // Store new username value
                              newUserName = value;
                            },
                          ),
                          actions: [
                            FlatButton(
                              child: Text("Submit"),
                              // Save new name to Firebase
                              onPressed: formValidate,
                            )
                          ],
                        )
                      );
                    },
                    title: Text('${widget.user.userName}'),
                    leading: Icon(Icons.verified_user),
                    trailing: Icon(Icons.edit),
                  ),

                  _divider(),

                  /* ----- Edit Email ------ */
                  ListTile(
                    onTap: () {
                      // Action to edit password in Firebase
                    },
                    title: Text('${widget.user.email}'), // Grab from Firebase
                    leading: Icon(Icons.email),
                    trailing: Icon(Icons.edit),
                  ),

                  _divider(),

                  /* ----- Edit Password ------ */
                  ListTile(
                    onTap: () {
                      // Action to edit password in Firebase
                    },
                    title: Text('Change Password'), // Grab from Firebase
                    leading: Icon(Icons.lock_outline),
                    trailing: Icon(Icons.edit),
                  ),
                ]
              ),
            ),
          ],
        )
      ),
    );
  }

  // Styling: Divider between settings
  Container _divider()
  {
    return Container(
      width: double.infinity,
      height: 1.0,
      color: Colors.grey.shade300,
      margin: const EdgeInsets.symmetric(horizontal: 8.0,),
    );
  }

  // Firebase: Send profile changes to Firebase after fields have been validated
  Future<void> sendUserNameInfo() async {
    String string_uid = widget.user.uid.toString();
    dynamic result = UserService(uid: string_uid).updateUserName(newUserName);
    // Output appropriate error if result is null
    if (result == null) {
      setState(() => error = 'Could not register with that information');
      loading = false;
    } else {
      setState(() => _validateState = true);
    }
  }

  void formValidate() {
    if (_formKey.currentState.validate()) {
      setState(() => loading = true);
      _formKey.currentState.save();
      sendUserNameInfo();
    } else {
      setState(() => _validateState = true);
    }
  }
}