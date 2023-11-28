class User {
  final String phone;
  final String password;
  final String email;
  final bool? state;
  final String name;
  final String nameUser;
  final String typeuser;

  User({
    required this.phone,
    required this.password,
    required this.email,
    this.state,
    required this.name,
    required this.nameUser,
    required this.typeuser,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    try {
      return User(
        phone: json['celular'] ?? '',
        password: json['contrasena'] ?? '',
        email: json['correo'] ?? '',
        state: json['estado'] ?? true,
        name: json['nombre'] ?? '',
        nameUser: json['nombreusuario'] ?? '',
        typeuser: json['tipousuario'] ?? '',
      );
    } catch (e) {
      print('Error al convertir json a User: $e');
      return User(
        phone: '',
        password: '',
        email: '',
        state: false,
        name: '',
        nameUser: '',
        typeuser: '',
      );
    }
  }

  Map<String, dynamic> toJson() {
    return {
      'celular': phone,
      'contraseña': password,
      'correo': email,
      'estado': state,
      'nombre': name,
      'nombreusuario': nameUser,
      'tipousuario': typeuser,
    };
  }
}
