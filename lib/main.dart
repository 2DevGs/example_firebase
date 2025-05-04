import 'package:example_firebase/auth/email_password/login_page.dart';
import 'package:example_firebase/auth/email_password/register_page.dart';
import 'package:example_firebase/auth/show_user.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
  );
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Example Firebase',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      routes: {
        '/auth/email_password/register': (_) => const RegisterPage(),
        '/auth/email_password/login': (_) => const LoginPage(),
        '/auth/show_user': (_) => const ShowUser(),
      },
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}
class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}
class _MyHomePageState extends State<MyHomePage> {

  @override
  void initState() {
    FirebaseAuth.instance.authStateChanges().listen((User? user) {
      print('Usuário logado? ${user != null}');
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextButton(
              onPressed: (){
                Navigator.of(context).pushNamed('/auth/email_password/register');
              }, 
              child: const Text('Register User Email-Password')
            ),
            TextButton(
              onPressed: (){
                Navigator.of(context).pushNamed('/auth/email_password/login');
              }, 
              child: const Text('Login User Email-Password')
            ),
            TextButton(
              onPressed: (){
                Navigator.of(context).pushNamed('/auth/show_user');
              }, 
              child: const Text('Show User Logged')
            ),
          ],
        ),
      ),
    );
  }
}
