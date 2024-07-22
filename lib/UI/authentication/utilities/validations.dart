String? phoneValidator(String? phone) {
  RegExp regex = RegExp(
    r'^(\+\d{1,3}[- ]?)?\d{10}$',
    multiLine: false,
  );
  if (!regex.hasMatch(phone!)) {
    return 'Enter valid phone number';
  } else {
    return null;
  }
}

String? emailValidator(String? email) {
  final RegExp emailRegExp = RegExp(
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$');
  if (!emailRegExp.hasMatch(email!)) {
    return 'Required valid email address';
  }
  return null;
}

String? passwordValidator(String? password) {
  final RegExp passwordRegExp =
  RegExp(r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[_\-@&\$%\^!#]).{8,}$');

  if (passwordRegExp.hasMatch(password!)) {
    return null; // Password is valid
  }

  return '';
}

