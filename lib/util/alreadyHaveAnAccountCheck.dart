import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AlreadyHaveAnAccount extends StatelessWidget {
  final VoidCallback press;
  final bool login;
  const AlreadyHaveAnAccount({
    Key? key,
    required this.press,
    required this.login,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          login ? '¿No tienes una cuenta?' : '¿Ya teines una cuenta?',
          style: GoogleFonts.kanit(color: const Color(0xFFA4593C)),
        ),
        GestureDetector(
          onTap: press,
          child: Text(
            login ? 'Registrarse' : 'Iniciar sesion',
            style: GoogleFonts.kanit(
                color: const Color(0xFFA4593C), fontWeight: FontWeight.bold),
          ),
        )
      ],
    );
  }
}
