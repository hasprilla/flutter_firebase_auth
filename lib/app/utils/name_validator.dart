bool isValidName(String name) {
  return RegExp(r'^[a-zA-Z]+$').hasMatch(name);
}
