import 'package:flutter/material.dart';
import 'package:pmsna1/widgets/login_modal_widget.dart';
import 'package:social_login_buttons/social_login_buttons.dart';

import '../responsive.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  bool isLoading = false;

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

  final spaceHorizontal = SizedBox(height: 10,);

  final btnGoogle = SocialLoginButton(
    buttonType: SocialLoginButtonType.google, 
    onPressed: () {},
    );

  final btnFacebook = SocialLoginButton(
    buttonType: SocialLoginButtonType.facebook, 
    onPressed: () {},
    );

  final btnGithub = SocialLoginButton(
    buttonType: SocialLoginButtonType.github, 
    onPressed: () {},
    );

 @override
  Widget build(BuildContext context) {
    final txtRegister = Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: TextButton(
        onPressed:  () {
         Navigator.pushNamed(context, '/register');
      }, 
      child: const Text('Crear cuenta',
        style: TextStyle( fontSize: 17,
        decoration: TextDecoration.underline)
       ),
       ),
      );

    
    final btnEmail = SocialLoginButton(
      buttonType: SocialLoginButtonType.generalLogin,
      onPressed: () {
        isLoading = true;
        setState(() {});
        Future.delayed(Duration(milliseconds: 4000)).then((value){
          isLoading = false;
          setState(() {});
          Navigator.pushNamed(context, '/dash');
        });
      },
    );

    final imgLogo = Image.asset('assets/logo_itc.png', height: 300,);
    final logoitc = Positioned(child: imgLogo, top: 15);
    final controles = Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    txtEmail,
                    spaceHorizontal,
                    txtPass,
                    spaceHorizontal,
                    btnEmail,
                    spaceHorizontal,
                    btnGoogle,
                    spaceHorizontal,
                    btnFacebook,
                    spaceHorizontal,
                    btnGithub,
                    spaceHorizontal,
                    txtRegister
                  ],
                );


    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                opacity: .4,
                fit: BoxFit.cover,
                image: AssetImage('assets/fondo_itcelaya.jpg')
            )
            ),
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Responsive(
                  mobile: Column(
                    children: [
                      logoitc,
                      controles,
                  ],
                              ),
                  desktop: Row(
                    children: [
                      Expanded(child: logoitc),
                      Expanded(child: controles),
                    ],
                  )
                ),
                ),
            ), 
          ),
          isLoading ? const LoadingModalWidget() : Container()
        ],
      ),
  );
 }
}


