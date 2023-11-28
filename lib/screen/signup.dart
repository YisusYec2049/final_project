import 'dart:convert';
import 'dart:math';

import 'package:final_project/model/user.dart';
import 'package:final_project/util/alreadyHaveAnAccountCheck.dart';
import 'package:final_project/util/customButtomLogin.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  bool _obscureText = false;
  final _formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController userController = TextEditingController();
  TextEditingController passController = TextEditingController();
  final String url = 'http://jeyliss05.pythonanywhere.com/api/saveusuario';

  Future<void> sendDataAPI(User user) async {
    try {
      final response = await http.post(
        Uri.parse(url),
        headers: {
          'Content-Type': 'application/json',
        },
        body: jsonEncode(
          user.toJson(),
        ),
      );

      if (response.statusCode == 200) {
        print('Usuario guardado con exito');
        print(response.body);
      } else {
        print(
            'Error al guardar datos del usuario... Respuesta: ${response.statusCode}');
        print(response.body);
      }
    } catch (e) {
      print('Error ${e}');
    }
  }

  @override
  void initState() {
    _obscureText = true;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/fondo.jpeg'),
                  fit: BoxFit.fill,
                  opacity: 0.5),
            ),
          ),
          SingleChildScrollView(
            child: Center(
                child: Form(
              key: _formKey,
              child: Column(
                children: [
                  const SizedBox(
                    height: 100,
                  ),
                  Image.asset(
                    'assets/logo.png',
                    height: 200,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                    child: TextFormField(
                      keyboardType: TextInputType.name,
                      controller: emailController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderSide:
                              const BorderSide(width: 1, color: Colors.orange),
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                              width: 1, color: Color(0xFFA4593C)),
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                              width: 1, color: Color(0xFFA4593C)),
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                              width: 1, color: Color(0xFFA4593C)),
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        prefixIcon: const Icon(
                          Icons.person,
                          color: Color(0xFFA4593C),
                        ),
                        labelText: 'Correo Electronico',
                        labelStyle: const TextStyle(
                            fontSize: 15,
                            color: Color(0xFFA4593C),
                            fontWeight: FontWeight.w300),
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Por favor, llene los datos vacios';
                        }
                        if (!value.contains('@')) {
                          return 'El formato del correo esta incompleto';
                        }
                        return null;
                      },
                      onSaved: (value) => emailController =
                          value?.replaceAll(' ', '') as TextEditingController,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                    child: TextFormField(
                      keyboardType: TextInputType.name,
                      controller: phoneController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderSide:
                              const BorderSide(width: 1, color: Colors.orange),
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                              width: 1, color: Color(0xFFA4593C)),
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                              width: 1, color: Color(0xFFA4593C)),
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                              width: 1, color: Color(0xFFA4593C)),
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        prefixIcon: const Icon(
                          Icons.person,
                          color: Color(0xFFA4593C),
                        ),
                        labelText: 'telefono',
                        labelStyle: const TextStyle(
                            fontSize: 15,
                            color: Color(0xFFA4593C),
                            fontWeight: FontWeight.w300),
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Por favor, llene los datos vacios';
                        }

                        return null;
                      },
                      onSaved: (value) => phoneController =
                          value?.replaceAll(' ', '') as TextEditingController,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                    child: TextFormField(
                      keyboardType: TextInputType.name,
                      controller: userController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderSide:
                              const BorderSide(width: 1, color: Colors.orange),
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                              width: 1, color: Color(0xFFA4593C)),
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                              width: 1, color: Color(0xFFA4593C)),
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                              width: 1, color: Color(0xFFA4593C)),
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        prefixIcon: const Icon(
                          Icons.person,
                          color: Color(0xFFA4593C),
                        ),
                        labelText: 'Usuario',
                        labelStyle: const TextStyle(
                            fontSize: 15,
                            color: Color(0xFFA4593C),
                            fontWeight: FontWeight.w300),
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Por favor, llene los datos vacios';
                        }
                        return null;
                      },
                      onSaved: (value) => userController =
                          value?.replaceAll(' ', '') as TextEditingController,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                    child: TextFormField(
                      controller: passController,
                      obscureText: _obscureText,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderSide:
                              const BorderSide(width: 1, color: Colors.orange),
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                              width: 1, color: Color(0xFFA4593C)),
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                              width: 1, color: Color(0xFFA4593C)),
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                              width: 1, color: Color(0xFFA4593C)),
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        prefixIcon: const Icon(
                          Icons.lock,
                          color: Color(0xFFA4593C),
                        ),
                        suffixIcon: _obscureText == true
                            ? IconButton(
                                icon: const Icon(Icons.visibility),
                                color: const Color(0xFFA4593C),
                                onPressed: () {
                                  setState(() {
                                    _obscureText = !_obscureText;
                                  });
                                },
                              )
                            : IconButton(
                                icon: const Icon(Icons.visibility_off),
                                color: const Color(0xFFA4593C),
                                onPressed: () {
                                  setState(() {
                                    _obscureText = !_obscureText;
                                  });
                                },
                              ),
                        labelText: 'Contraseña',
                        labelStyle: const TextStyle(
                            fontSize: 15,
                            color: Color(0xFFA4593C),
                            fontWeight: FontWeight.w300),
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Por favor, llene los datos vacios';
                        }
                        return null;
                      },
                      onSaved: (value) => passController =
                          value?.replaceAll(' ', '') as TextEditingController,
                    ),
                  ),
                  CustomBottomLogin(
                      press: () async {
                        if (_formKey.currentState!.validate()) {
                          User newUser = User(
                            phone: phoneController.text,
                            password: passController.text,
                            email: emailController.text,
                            state: true,
                            name: userController.text,
                            nameUser: userController.text,
                            typeuser: 'Adoptante',
                          );
                          sendDataAPI(newUser);
                        }
                      },
                      title: 'Registrarse'),
                  AlreadyHaveAnAccount(
                      login: false,
                      press: () {
                        Navigator.pop(context);
                      })
                ],
              ),
            )),
          )
        ],
      ),
    );
  }
}
