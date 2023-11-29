import 'dart:convert';

import 'package:final_project/firebase_auth_implementation/firebase_auth_services.dart';
import 'package:final_project/model/user.dart' as local;
import 'package:final_project/providers/userProvider.dart';
import 'package:final_project/screen/home_admin.dart';
import 'package:final_project/screen/home_adopter.dart';
import 'package:final_project/screen/signup.dart';
import 'package:final_project/util/alreadyHaveAnAccountCheck.dart';
import 'package:final_project/util/customButtomLogin.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final FirebaseAuthService _auth = FirebaseAuthService();
  bool _obscureText = false;
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    _obscureText = true;
    super.initState();
  }

  Future<void> _handleLogin() async {
    final url = "http://jeyliss05.pythonanywhere.com/api/usuarios";

    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      final List<dynamic> usersData = json.decode(response.body);

      final user = usersData.firstWhere(
        (userData) =>
            userData['correo'] == emailController.text &&
            userData['contrasena'] == passController.text,
        orElse: () => null,
      );

      if (user != null) {
        final loggedInUser = local.User.fromJson(user);

        Provider.of<UserProvider>(context, listen: false).setUser(loggedInUser);

        if (loggedInUser.typeuser == 'Admin') {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => const Home_Adm(),
            ),
          );
        } else if (loggedInUser.typeuser == 'Adopter') {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => HomeAdopter(user: loggedInUser),
            ),
          );
        }
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Credenciales incorrectas'),
            duration: Duration(seconds: 2),
          ),
        );
      }
    }
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
              //key: _formKey,
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
                    height: 100,
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
                          Icons.email,
                          color: Color(0xFFA4593C),
                        ),
                        labelText: 'email',
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
                      onSaved: (value) => emailController =
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
                  CustomBottomLogin(press: _signIn, title: 'Ingresar'),
                  AlreadyHaveAnAccount(
                      press: () async {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return const SignUp();
                            },
                          ),
                        );
                      },
                      login: true)
                ],
              ),
            )),
          )
        ],
      ),
    );
  }

  void _signIn() async {
    String email = emailController.text;
    String password = passController.text;

    User? user = await _auth.signInEmailAndPassword(email, password);

    if (user != null) {
      print('User is successfully created');
      _handleLogin();
    } else {
      print('Some error happend');
    }
  }
}
