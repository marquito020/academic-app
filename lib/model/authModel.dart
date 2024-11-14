// import 'package:medilab_prokit/model/doctor.dart';

class AuthLogin {
  final String token;
  final String? message;
  // final Person person;

  AuthLogin({
    required this.token,
    required this.message,
    // required this.person,
  });

  factory AuthLogin.fromJson(Map<String, dynamic> json) {
    return AuthLogin(
      token: json['token'],
      message: json['message'] ?? '',
      // person: Person.fromJson(json['person']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'token': token,
      'message': message,
      // 'person': person.toJson(),
    };
  }

  AuthLogin copyWith({
    String? token,
    String? message,
    // Person? person,
  }) {
    return AuthLogin(
      token: token ?? this.token,
      message: message ?? this.message,
      // person: person ?? this.person,
    );
  }

  // @override
  // String toString() {
  //   return 'AuthLogin{token: $token, message: $message, person: $person}';
  // }
}
