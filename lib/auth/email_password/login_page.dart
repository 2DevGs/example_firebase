
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {

  const LoginPage({ super.key });

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  final emailEC = TextEditingController();
  final passwordEC = TextEditingController();

  @override
  void dispose() {
    emailEC.dispose();
    passwordEC.dispose();
    super.dispose();
  }

  Future<void> loginUser() async {
    final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: emailEC.text, 
      password: passwordEC.text
    );
    final user = credential.user;
    String message = '';
    if(user != null && !user.emailVerified) {
      message = 'E-mail não confirmado, por favor verifique o seu e-mail';
    } else {
      message = 'Login efetuado como sucesso!!';
    }

    if(message == 'Login efetuado como sucesso!!') {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: Colors.green[300],
          content: Text(message,)));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: Colors.red[500],
          content: Text(message,)));
    }
    await user?.updateDisplayName('Gustaf Nolan ADF');
    print(credential.user?.displayName);
    print(credential.user?.email);
    print(credential.user?.emailVerified);
  }

  @override
  Widget build(BuildContext context) {
      return Scaffold(
          appBar: AppBar(
            title: const Text(
              'Login de Usuário',
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
                    onPressed: loginUser,
                    style: ButtonStyle(
                      backgroundColor: WidgetStatePropertyAll(
                        Colors.purple[100],
                      ),
                    ),
                    child: const Text(
                      'Login',
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