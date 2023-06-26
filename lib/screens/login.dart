import 'package:flutter/material.dart';
import 'package:front_auth/constant.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final GlobalKey<FormState> formkey = GlobalKey<FormState>();
  bool loading = false;

  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
        centerTitle: true,
      ),
      body: Form(
        child: ListView(
          padding: EdgeInsets.all(32),
          children: [
            TextFormField(
              keyboardType: TextInputType.name,
              validator: (val)=> val!.isEmpty ? 'Нэрээ оруулна уу?' : null,
              decoration: kInputDecoration('username'),
            ),
            SizedBox(height: 10,),
            TextFormField(
              validator: (val)=> val!.length <6 ? '6 аас дээш урттай бичнэ үү' : null,
              obscureText: true,
              decoration: kInputDecoration('password'),
            ),
            SizedBox(height: 10,),
            loading? Center(child: CircularProgressIndicator(),):
            kTextButton('Login',(){
              if (formkey.currentState!.validate()){
                setState(() {
                  loading: true;
                  // _loginUser();
                });
              }
            })
          ],
        ),
      ),
    );
  }
}