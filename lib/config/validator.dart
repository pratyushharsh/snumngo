class Validators {
  static final RegExp _imagePathExp = RegExp(
    r'^.+\.(?:jpg|gif|png)$',
  );

  static final RegExp _emailRegExp = RegExp(
    r'^[a-zA-Z0-9.!#$%&’*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)*$',
  );
  static final RegExp _passwordRegExp = RegExp(
    r'^.{6,}$',
  );

  static final RegExp _pancardValidator = RegExp(
    r'^([a-zA-Z]){5}([0-9]){4}([a-zA-Z]){1}?$'
  );

  static isValidEmail(String email) {
    return _emailRegExp.hasMatch(email);
  }

  static isValidPassword(String password) {
    return _passwordRegExp.hasMatch(password);
  }

  static isValidPanCard(String pancardno) {
    return _pancardValidator.hasMatch(pancardno);
  }

  static isValidImagePath(String image) {
    return _imagePathExp.hasMatch(image);
  }
}
