import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application/components/DrawerComponent.dart';

import '../components/MyAppBar.dart';
import '../components/MyInputComponent.dart';

class LogIn extends StatefulWidget {

  final bool isDarkTheme;
  final VoidCallback onThemeChange;

  const LogIn(
      {super.key, required this.isDarkTheme, required this.onThemeChange});

  @override
  _LogInState createState() => _LogInState();
}

class _LogInState extends State<LogIn> {

  String _usernameValidate = '';
  String _passwordValidate = '';


  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  void _signIn() async {
    final FirebaseFirestore db = FirebaseFirestore.instance;
    final CollectionReference users = db.collection('users');

    // is Empty :
    setState(() {
      _usernameValidate = _usernameController.text.isEmpty ? 'Username can not be empty' : '';
      _passwordValidate = _passwordController.text.isEmpty ? 'Password can not be empty' : '';
    });

    if (_usernameValidate.length != 0 || _passwordValidate.length != 0)
      return;

    QuerySnapshot user = await users.where('username', isEqualTo: _usernameController.text).get();

    // END::
    if(user.docs.isNotEmpty){
      var userData = user.docs.first.data() as Map<String, dynamic>;
      String password = userData['password']; // Extract the email field

      if(password == _passwordController.text){
        Navigator.pushNamed(context,'/');
      }
      else{
        setState(() {
          _passwordValidate = 'Incorrect password';
        });
      }
    }
    else {
      setState(() {
        _usernameValidate = 'Username Not Exist';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        title: 'Login',
        leading: true,
        isDarkTheme: widget.isDarkTheme,
        onThemeChange: widget.onThemeChange,
      ),
      drawer: DrawerComponent(),
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                MyInputComponent(
                    fieldController: _usernameController,
                    fieldType: TextInputType.emailAddress,
                    fieldLable: 'Username',
                    error: _usernameValidate,
                    isDarkTheme: widget.isDarkTheme,
                    onThemeChange: widget.onThemeChange
                ),
                SizedBox(height: 20),
                MyInputComponent(
                    fieldController: _passwordController,
                    fieldType: TextInputType.text,
                    fieldLable: 'Password',
                    error: _passwordValidate,
                    isDarkTheme: widget.isDarkTheme,
                    onThemeChange: widget.onThemeChange
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: _signIn,
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: Text('Login'),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/signup');
                  },
                  child: Text('Don\'t have an account? Sign Up'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
