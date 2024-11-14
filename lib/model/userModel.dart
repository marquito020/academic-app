class UserModel {
  //       "persona_id": 41,
  //       "nombre": "Marco David Toledo Canna",
  //       "rol": "estudiante"
  final int persona_id;
  final String nombre;
  final String email;
  final String rol;

  UserModel({
    required this.persona_id,
    required this.nombre,
    required this.email,
    required this.rol,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      persona_id: json['persona_id'],
      nombre: json['nombre'],
      email: json['email'] ?? '',
      rol: json['rol'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'persona_id': persona_id,
      'nombre': nombre,
      'email': email,
      'rol': rol,
    };
  }

  UserModel copyWith({
    int? persona_id,
    String? nombre,
    String? email,
    String? rol,
  }) {
    return UserModel(
      persona_id: persona_id ?? this.persona_id,
      nombre: nombre ?? this.nombre,
      email: email ?? this.email,
      rol: rol ?? this.rol,
    );
  }

  @override
  String toString() {
    return 'Usermodel{persona_id: $persona_id, nombre: $nombre, rol: $rol}';
  }
}
