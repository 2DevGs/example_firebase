import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ShowUser extends StatefulWidget {

  const ShowUser({ super.key });

  @override
  State<ShowUser> createState() => _ShowUserState();
}

class _ShowUserState extends State<ShowUser> {

  User? user;

  @override
  void initState() {
    user = FirebaseAuth.instance.currentUser;
    super.initState();
  }

   @override
   Widget build(BuildContext context) {
       return Scaffold(
           appBar: AppBar(title: const Text('Usuário Online'),),
           body: Center(
             child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(user?.displayName ?? ''),
                Text(user?.email ?? ''),
                Text(user?.photoURL ?? ''),
                TextButton(
                  style: ButtonStyle(
                    backgroundColor: WidgetStatePropertyAll(Colors.purple[100]),
                  ),
                  onPressed: (){
                    FirebaseAuth.instance.signOut();
                  }, 
                  child: const Text(
                    'Logout',
                    style: TextStyle(
                      color: Colors.purple,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                ),
              ],
             ),
           ),
       );
  }
}