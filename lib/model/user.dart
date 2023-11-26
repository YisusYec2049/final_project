class User {
  final String phone;
  final String password;
  final String email;
  final bool state;
  final int id;
  final String name;
  final String nameUser;
  final String typeuser;

  User(
      {required this.phone,
      required this.password,
      required this.email,
      required this.state,
      required this.id,
      required this.name,
      required this.nameUser,
      required this.typeuser});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
        phone: json['celular'],
        password: json['contrasena'] as String? ?? '',
        email: json['correo'],
        state: json['estado'],
        id: json['id'],
        name: json['nombre'],
        nameUser: json['nombreusuario'] as String? ?? '',
        typeuser: json['tipousuario']);
  }

  Map<String, dynamic> toJson() {
    return {
      'celular': phone,
      'contraseña': password,
      'correo': email,
      'estado': state,
      'id': id,
      'nombre': name,
      'nombreusuario': nameUser,
      'tipousuario': typeuser
    };
  }
}
