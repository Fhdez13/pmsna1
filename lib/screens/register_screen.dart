import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final ImagePicker pick = ImagePicker();
  XFile? avatar;

  File? obtenerAvatar(){
      if(avatar != null){
        return File(avatar!.path);
      }
      return null;
  }
  
   final spaceHorizontal = SizedBox(height: 10,);

  
  Widget camera(){
    return ElevatedButton(
      child: Text('Capturar desde cámara'),
        onPressed: () {
          pick.pickImage(source: ImageSource.camera).then((image){
              avatar: image;
              setState(() {});
        });
        },
      );
    }
  
  Widget galey(){
    return ElevatedButton(
      child: Text('Capturar desde la galeria'),
        onPressed: () {
        pick.pickImage(source: ImageSource.gallery).then((image){
          avatar: image;
          setState(() {});
      });
    },
  );
}

  
  final txtNombre = TextFormField(
    decoration: InputDecoration(
      label: Text('Nombre del usuario'),
      border: OutlineInputBorder()
    ),
  );

   final txtEmail = TextFormField(
    decoration: InputDecoration(
      label: Text('Email User'),
      border: OutlineInputBorder()
    ),
  );
  
  final txtPass = TextFormField(
    decoration: InputDecoration(
      label: Text('Password User'),
      border: OutlineInputBorder()
    ),
  );
  
  Widget form() {
    return Column(
      children: [
         avatar == null
        ? SizedBox()
        : Image(
        height: 200,
        image: FileImage(obtenerAvatar()!),
        ),
        camera(),
        galey(),
        txtNombre,
        spaceHorizontal,
        txtEmail,
        spaceHorizontal,
        txtPass,


      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          Container(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: form(
                )
                ),
            ), 
          ),
        ],
      ),
  );
 }
}
 