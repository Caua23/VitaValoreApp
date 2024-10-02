class Login {
  final String email;
  final String password;

  Login({
    required this.password,
    required this.email,
  });

  Map<String, dynamic> toJson() {
    return {'email': email, 'password': password};
  }
}
