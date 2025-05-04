
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {

  const RegisterPage({ super.key });

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {

  final emailEC = TextEditingController();
  final passwordEC = TextEditingController();

  @override
  void dispose() {
    emailEC.dispose();
    passwordEC.dispose();
    super.dispose();
  }

  Future<void> registerUser() async {
    final credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: emailEC.text, 
      password: passwordEC.text
    );
    credential.user?.sendEmailVerification();
    ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('E-mail de confirmação enviado, por favor verifique o seu e-mail')));
  }

  @override
  Widget build(BuildContext context) {
      return Scaffold(
          appBar: AppBar(
            title: const Text(
              'Cadastro de Usuário',
              style: TextStyle(
                color: Colors.purple,
              ),
            ),
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                children: [
                  TextField(
                    controller: emailEC,
                    decoration: const InputDecoration(
                      label: Text(
                        'Email',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.purple,
                        ),
                        ),
                    ),
                  ),
                  TextField(
                    controller: passwordEC,
                    decoration: const InputDecoration(
                      label: Text(
                        'Senha',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.purple,
                        ),
                      ),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: registerUser,
                    style: ButtonStyle(
                      backgroundColor: WidgetStatePropertyAll(
                        Colors.purple[100],
                      ),
                    ),
                    child: const Text(
                      'Cadastrar usuário',
                      style: TextStyle(
                        color: Colors.purple,
                        fontWeight: FontWeight.bold
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
       );
  }
}