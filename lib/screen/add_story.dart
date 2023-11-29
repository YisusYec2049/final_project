import 'dart:io';
import 'package:final_project/screen/story_admin.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';

class Add_story extends StatefulWidget {
  const Add_story({Key? key}) : super(key: key);

  @override
  State<Add_story> createState() => _Add_storyState();
}

class _Add_storyState extends State<Add_story> {
  File? _image;
  final FocusNode _nameFocus = FocusNode();

  @override
  void initState() {
    super.initState();
  }

  Future<void> _pickImage() async {
    print("Clic en el contenedor para agregar foto");

    try {
      final ImagePicker _picker = ImagePicker();
      final XFile? pickedFile =
          await _picker.pickImage(source: ImageSource.gallery);

      if (pickedFile != null) {
        setState(() {
          _image = File(pickedFile.path);
        });
      } else {
        print("No se seleccionó ninguna imagen");
      }
    } catch (e) {
      print("Error al seleccionar una imagen: $e");
    }
  }

  void _showSuccessDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
          contentPadding: EdgeInsets.zero,
          content: Container(
            width: double.infinity,
            height: 100.0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15.0),
            ),
            child: const Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.pets,
                  size: 45.0,
                  color: Color(0xFFF87D28),
                ),
                SizedBox(height: 10.0),
                Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Text(
                    'La Historia ha sido guardada con éxito.',
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text(
                'Cerrar',
                style: TextStyle(color: Color(0xFFF87D28)),
              ),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          // Fondo blanco
          Container(
            color: Colors.white,
          ),

          Container(
            padding: const EdgeInsets.fromLTRB(30.0, 50.0, 30.0, 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  icon: const Icon(
                    Icons.arrow_back,
                    color: Colors.black,
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Story_Adm()),
                    );
                  },
                ),
                // Título central
                Text(
                  'Registrar Historia',
                  style: GoogleFonts.roboto(
                    fontSize: 25.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                // Espaciador
                const SizedBox(width: 40.0),
              ],
            ),
          ),

          Padding(
            padding: const EdgeInsets.fromLTRB(30.0, 25.0, 30.0, 8.0),
            child: Center(
              child: InkWell(
                onTap: _pickImage,
                child: Container(
                  width: 290.0,
                  height: 200.0,
                  decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(25.0),
                  ),
                  child: _image != null
                      ? Image.file(
                          _image!,
                          width: 290.0,
                          height: 200.0,
                          fit: BoxFit.cover,
                        )
                      : const Icon(
                          Icons.add_a_photo,
                          size: 80.0,
                          color: Color(0xFFF87D28),
                        ),
                ),
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.fromLTRB(30.0, 20.0, 30.0, 5.0),
            child: Center(
              child: Container(
                width: 330.0,
                height: 60.0,
                padding: const EdgeInsets.symmetric(horizontal: 2.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25.0),
                  border: Border.all(
                    color: const Color(0xFFF87D28),
                    width: 1.0,
                  ),
                ),
                child: Row(
                  children: [
                    const Padding(padding: EdgeInsets.all(5.0)),
                    const Icon(
                      Icons.text_fields,
                      size: 20.0,
                      color: Color(0xFFF87D28),
                    ),
                    const SizedBox(width: 10.0),
                    Expanded(
                      child: TextField(
                        focusNode: _nameFocus,
                        decoration: const InputDecoration(
                          hintText: 'Nombre',
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.fromLTRB(30.0, 20.0, 30.0, 5.0),
            child: Center(
              child: Container(
                width: 330.0,
                height: 230.0,
                padding: const EdgeInsets.symmetric(horizontal: 2.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(18.0),
                  border: Border.all(
                    color: const Color(0xFFF87D28),
                    width: 1.0,
                  ),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(top: 10.0, left: 10.0),
                      child: Icon(
                        Icons.description,
                        size: 20.0,
                        color: Color(0xFFF87D28),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: TextField(
                          focusNode: _nameFocus,
                          decoration: const InputDecoration(
                            hintText: 'Descripcion',
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),

          Container(
            child: Padding(
              padding: const EdgeInsets.all(55.0),
              child: Positioned(
                child: Center(
                  child: Container(
                    width: 200.0,
                    height: 50.0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25.0),
                      gradient: const LinearGradient(
                        colors: [
                          Color(0xFFF87D28),
                          Color(0xFFA4593C),
                        ],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                    ),
                    child: ElevatedButton(
                      onPressed: () {
                        _showSuccessDialog();
                      },
                      style: ElevatedButton.styleFrom(
                        primary: Colors.transparent,
                        elevation: 0.0, // Sin sombra
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25.0),
                          side: const BorderSide(color: Colors.white),
                        ),
                      ),
                      child: const Text(
                        'Guardar',
                        style: TextStyle(
                          fontSize: 18.0,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
