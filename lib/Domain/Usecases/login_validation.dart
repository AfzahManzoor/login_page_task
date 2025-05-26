bool validateLogin(String email, String password) {
  if (email.isEmpty || password.isEmpty) return false;
  final emailRegex = RegExp(r'^[a-zA-Z0-9]+@[a-zA-Z]+\.[a-zA-Z]+');
  return emailRegex.hasMatch(email);
}
