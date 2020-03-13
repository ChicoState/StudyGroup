class Validations {
  // Make singleton
  Validations._();
  static final Validations instance = Validations._();

  String emailValidation(String email) {
    const Pattern p =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    final RegExp regExp = RegExp(p);
    return !regExp.hasMatch(email) ? 'Enter a valid email address' : null;
  }

  // Email validation
  String password(String pass) {
    // Ensure password is at least 6 characters but not more than 20
    const Pattern p = r'^[A-Za-z0-8]{6,20}$';
    final RegExp regExp = RegExp(p);
    return !regExp.hasMatch(pass)
        ? 'Please enter a password between 6 and 20 characters'
        : null;
  }

  String userNameValidation(String user) {
    const Pattern p = r'^[A-Za-z0-9](_?[A-Za-z0-9]){4,16}$';
    final RegExp regExp = RegExp(p);
    return !regExp.hasMatch(user)
        ? 'Enter a valid username (4-16 chars _ or .)'
        : null;
  }
}
