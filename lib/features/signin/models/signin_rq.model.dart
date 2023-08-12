class SigninRq {
  String phoneNumber;
  String password;

  SigninRq({
    required this.phoneNumber,
    required this.password,
  });

  factory SigninRq.fromJson(Map<String, dynamic> json) => SigninRq(
        phoneNumber: json["phoneNumber"],
        password: json["password"],
      );

  Map<String, dynamic> toJson() => {
        "phoneNumber": phoneNumber,
        "password": password,
      };
}
