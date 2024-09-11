import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application/components/DrawerComponent.dart';
import '../components/MyInputComponent.dart';

import '../components/MyAppBar.dart';

class SignUp extends StatefulWidget {

  final bool isDarkTheme;
  final VoidCallback onThemeChange;

  const SignUp({super.key,required this.isDarkTheme,required this.onThemeChange});

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {

  String _nameValidate = '';
  String _usernameValidate = '';
  String _emailValidate = '';
  String _passwordValidate = '';

  final _nameController = TextEditingController();
  final _usernameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  void _signUp() async {

    setState(() {
      _nameValidate = _nameController.text.isEmpty ? 'Name can not be empty' : '';
      _usernameValidate = _usernameController.text.isEmpty ? 'Username can not be empty' : '';
      _emailValidate = _emailController.text.isEmpty ? 'Email can not be empty' : '';
      _passwordValidate = _passwordController.text.isEmpty ? 'Password can not be empty' : '';

    });

    if(_nameValidate.length!=0 || _usernameValidate.length!=0
        || _emailValidate.length!=0 || _passwordValidate.length!=0)
      return;

    // Database mapping :
    final FirebaseFirestore db = FirebaseFirestore.instance;
    final CollectionReference users = db.collection('users');

    // Unique Constraint
    // Check Username/Email Exist or not :
    try{
      QuerySnapshot usernameSnapshot = await users.where('username',isEqualTo: _usernameController.text).get();
      QuerySnapshot emailSnapshot = await users.where('email',isEqualTo: _emailController.text).get();

      if(usernameSnapshot.docs.isNotEmpty){
        setState(() {
          _usernameValidate = 'Username already exist';
        });
        return;
      }
      if(emailSnapshot.docs.isNotEmpty){
        setState(() {
          _emailValidate = 'Email already exist';
        });
        return;
      }
    }
    catch(e){
      print(e);
    }


    final Map<String, dynamic> userDocument = {
      'name': '${_nameController.text}',
      'username': '${_usernameController.text}',
      'email': '${_emailController.text}',
      'password': '${_passwordController.text}'
    };

    try{
      await users.add(userDocument);
      Navigator.pushNamed(context,'/');
    }
    catch(e){

    }
    // Add your sign-in logic here, e.g., Firebase or API sign-in

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        title: 'Sign Up',
        leading: true,
        isDarkTheme: widget.isDarkTheme,
        onThemeChange: widget.onThemeChange,
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                MyInputComponent(
                    fieldController: _nameController,
                    fieldType: TextInputType.text,
                    fieldLable: 'Full Name',
                    error: _nameValidate,
                    isDarkTheme: widget.isDarkTheme,
                    onThemeChange: widget.onThemeChange
                ),
                SizedBox(height: 20),
                MyInputComponent(
                  fieldController: _usernameController,
                  fieldType: TextInputType.text,
                  fieldLable: 'Username',
                  error: _usernameValidate,
                  isDarkTheme: widget.isDarkTheme,
                  onThemeChange: widget.onThemeChange
                ),
                SizedBox(height: 20),
                MyInputComponent(
                  fieldController: _emailController,
                  fieldType: TextInputType.emailAddress,
                  fieldLable: 'Email',
                  error: _emailValidate,
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
                  onPressed: _signUp,
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: Text('Signup'),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/login');
                  },
                  child: Text('Already have an account? Login'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
