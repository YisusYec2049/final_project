import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int categoryListLength;

  const Result({Key? key, required this.categoryListLength}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text('Longitud de la lista: $categoryListLength');
  }
}
