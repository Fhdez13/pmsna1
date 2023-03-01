import 'dart:io';
import 'package:email_validator/email_validator.dart';
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

   final formkey = GlobalKey<FormState>();
  
  Widget camera(){
    return ElevatedButton(
      child: Text('Capturar desde cámara'),
        onPressed: () {
          pick.pickImage(source: ImageSource.camera).then((image){
              avatar = image;
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
          avatar = image;
          setState(() {});
      });
    },
  );
}

Widget btnvalidator(){
  
  return ElevatedButton(
    child: Text('Registrar'),
    onPressed: (){
      bool formvalidate = formkey.currentState!.validate();
      bool existavatar = avatar!= null;
      if (formvalidate && existavatar) {
        print('El formulario se lleno correctamente');
      }
    },
  );
}

  
  final txtNombre = TextFormField(
    decoration: InputDecoration(
      label: Text('Nombre del usuario'),
      border: OutlineInputBorder()
    ),
    validator: (value) {
      if (value!.isEmpty) {
        return 'Debe llenar el campo de nombre';
      }else{
        return null;
      }
    },
  );
  

   final txtEmail = TextFormField(
    decoration: InputDecoration(
      label: Text('Email User'),
      border: OutlineInputBorder()
    ),
     validator: (value) {
      if (value!.isEmpty) {
        return 'Debe llenar el campo de email del usuario';
      }else if(EmailValidator.validate(value)){
        return null;
      }else{
        return 'No es una dirección de correo valida';
      }
    },
  );
  
  final txtPass = TextFormField(
    decoration: InputDecoration(
      label: Text('Password User'),
      border: OutlineInputBorder()
    ),
     validator: (value) {
      if (value!.isEmpty) {
        return 'Por favor introduzca su password';
      }else{
        return null;
      }
    },
  );


  
  Widget form() {
    return Form(
      key: formkey,
      child: Column(
        children: [
          spaceHorizontal,
          spaceHorizontal,
           avatar == null
          ? CircleAvatar(
            radius: 100,
            child: Icon(
              Icons.person
            ),
          )
          : CircleAvatar(
          radius: 100,
          backgroundImage: FileImage(obtenerAvatar()!),
          ),
          spaceHorizontal,
          spaceHorizontal,
          spaceHorizontal,
          camera(),
          spaceHorizontal,
          galey(),
          spaceHorizontal,
          txtNombre,
          spaceHorizontal,
          txtEmail,
          spaceHorizontal,
          txtPass,
          spaceHorizontal,
          btnvalidator()
        ],
      ),
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
 