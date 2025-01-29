import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:store_app_1/pages/menu.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  var obscureText = true;

  emailTextFormField(BuildContext context) {
    return TextFormField(
      controller: emailController,
      validator: (value) => value!.isEmpty ? 'Please enter email' : null,
      enableSuggestions: false,
      enableInteractiveSelection: false,
      style: TextStyle(fontSize: 20),
      decoration: InputDecoration(
        labelText: 'E-mail',
        labelStyle: TextStyle(fontSize: 20),
        errorStyle: TextStyle(fontSize: 14),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        contentPadding: EdgeInsets.all(15),
        prefixIcon: Icon(
          Icons.person,
          color: Theme.of(context).primaryColor,
        ),
      ),
    );
  }

  passwordTextFormField(BuildContext context) {
    return TextFormField(
      controller: passwordController,
      validator: (value) {
        if (value!.isEmpty) {
          return 'Please enter a password';
        } else if (value.length < 8) {
          return 'Password must be at least 8 characters';
        } else if (!RegExp(r'[A-Z]').hasMatch(value)) {
          return 'Password must contain at least one uppercase letter';
        } else if (!RegExp(r'[a-z]').hasMatch(value)) {
          return 'Password must contain at least one lowercase letter';
        } else if (!RegExp(r'[0-9]').hasMatch(value)) {
          return 'Password must contain at least one number';
        } else if (!RegExp(r'[!@#$%^&*(),.?":{}|<>]').hasMatch(value)) {
          return 'Password must contain at least one special character';
        }
        return null;
      },
      style: TextStyle(fontSize: 20),
      obscureText: obscureText,
      enableSuggestions: false,
      enableInteractiveSelection: false,
      decoration: InputDecoration(
        labelText: 'Password',
        labelStyle: TextStyle(fontSize: 20),
        errorMaxLines: 2,
        errorStyle: TextStyle(fontSize: 14),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        contentPadding: EdgeInsets.all(15),
        prefixIcon: Icon(
          Icons.lock,
          color: Theme.of(context).primaryColor,
        ),
        suffixIcon: IconButton(
          icon: Icon(
            obscureText ? Icons.visibility : Icons.visibility_off,
            color: Theme.of(context).primaryColor,
          ),
          onPressed: () {
            setState(() {
              obscureText = !obscureText;
            });
          },
        ),
      ),
      textInputAction: TextInputAction.done,
    );
  }

  enterButton(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () {
          FocusScope.of(context).unfocus();
          if (formKey.currentState!.validate()) {
            Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (context) => Menu()));
          }
        },
        child: Text(
          'Enter',
          style: TextStyle(color: Colors.white),
        ),
        style: ElevatedButton.styleFrom(
          backgroundColor: Color.fromARGB(255, 0, 204, 204),
          textStyle: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          padding: EdgeInsets.all(20),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
    );
  }

  // createAccountButton(BuildContext context) {
  //   return TextButton(
  //     onPressed: () {},
  //     child: Text(
  //       'Sign Up',
  //       style: TextStyle(
  //         color: Theme.of(context).primaryColor,
  //         fontSize: 20,
  //         decoration: TextDecoration.underline,
  //         decorationColor: Theme.of(context).primaryColor,
  //       ),
  //     ),
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: formKey,
        child: Container(
          color: Theme.of(context).primaryColor,
          child: Column(
            children: <Widget>[
              Container(
                  margin: EdgeInsets.only(top: 40),
                  width: 300,
                  child: Image.asset('images/MarketApp.png')),
              SizedBox(height: 40),
              Expanded(
                child: Container(
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(25),
                          topRight: Radius.circular(25))),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text("Log In",
                            style: TextStyle(
                                fontSize: 26,
                                color: Colors.black54,
                                fontWeight: FontWeight.bold)),
                        SizedBox(height: 20),
                        emailTextFormField(context),
                        SizedBox(height: 40),
                        passwordTextFormField(context),
                        SizedBox(height: 40),
                        enterButton(context),
                        SizedBox(height: 40),
                        Text("v.1.0.0",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Colors.grey,
                                fontWeight: FontWeight.bold))
                      ],
                    ),
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
