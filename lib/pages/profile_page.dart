import 'package:flutter/material.dart';
import 'package:store_app_1/pages/login_page.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  TextEditingController nameController = TextEditingController();
  TextEditingController surnameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  bool obscureText = false;
  bool changePassword = false;

  nameTextFormField(BuildContext context) {
    return TextFormField(
      controller: nameController,
      validator: (value) => value!.isEmpty ? 'Name can\'t be empty' : null,
      enableSuggestions: false,
      enableInteractiveSelection: false,
      style: TextStyle(fontSize: 20),
      decoration: InputDecoration(
        labelText: 'Name',
        labelStyle: TextStyle(fontSize: 20),
        errorStyle: TextStyle(fontSize: 14),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        contentPadding: EdgeInsets.all(15),
      ),
    );
  }

  surnameTextFormField(BuildContext context) {
    return TextFormField(
      controller: surnameController,
      validator: (value) => value!.isEmpty ? 'Surname can\'t be empty' : null,
      enableSuggestions: false,
      enableInteractiveSelection: false,
      style: TextStyle(fontSize: 20),
      decoration: InputDecoration(
        labelText: 'Surname',
        labelStyle: TextStyle(fontSize: 20),
        errorStyle: TextStyle(fontSize: 14),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        contentPadding: EdgeInsets.all(15),
      ),
    );
  }

  emailTextFormField(BuildContext context) {
    return TextFormField(
      controller: emailController,
      validator: (value) => value!.isEmpty ? 'E-mail can\'t be empty' : null,
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
      ),
    );
  }

  passwordTextFormField(BuildContext context) {
    return TextFormField(
      controller: passwordController,
      validator: (value) {
        if (value!.isEmpty) {
          return 'Password can\'t be empty';
        } else if (confirmPasswordController.text.isNotEmpty &&
            value != confirmPasswordController.text) {
          return 'Password doesn\'t match';
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
        labelText: 'New Password',
        labelStyle: TextStyle(fontSize: 20),
        errorMaxLines: 2,
        errorStyle: TextStyle(fontSize: 14),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        contentPadding: EdgeInsets.all(15),
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

  confirmPasswordTextFormField(BuildContext context) {
    return TextFormField(
      controller: confirmPasswordController,
      validator: (value) {
        if (value!.isEmpty) {
          return 'Password can\'t be empty';
        } else if (passwordController.text.isNotEmpty &&
            value != passwordController.text) {
          return 'Password doesn\'t match';
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
        labelText: 'Confirm Password',
        labelStyle: TextStyle(fontSize: 20),
        errorMaxLines: 2,
        errorStyle: TextStyle(fontSize: 14),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        contentPadding: EdgeInsets.all(15),
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

  saveButton(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () {
          FocusScope.of(context).unfocus();
          if (formKey.currentState!.validate()) {
            print("All Right!");
          }
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.save, color: Colors.white, size: 24),
            SizedBox(width: 10),
            Text(
              'Save',
              style: TextStyle(color: Colors.white),
            ),
          ],
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

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        children: [
          Expanded(
            child: ListView(
              padding: EdgeInsets.all(20),
              children: [
                Icon(Icons.account_circle, size: 100, color: Colors.grey),
                SizedBox(height: 20),
                nameTextFormField(context),
                SizedBox(height: 20),
                surnameTextFormField(context),
                SizedBox(height: 20),
                emailTextFormField(context),
                SizedBox(height: 20),
                changePassword
                    ? Column(
                        children: [
                          passwordTextFormField(context),
                          SizedBox(height: 20),
                          confirmPasswordTextFormField(context),
                        ],
                      )
                    : TextButton(
                        child: Text("Change Password?",
                            style: TextStyle(
                                fontSize: 16,
                                decoration: TextDecoration.underline,
                                decorationColor: Theme.of(context).primaryColor)),
                        onPressed: () {
                          setState(() => changePassword = !changePassword);
                        },
                      ),
                SizedBox(height: 20),
                saveButton(context),
              ],
            ),
          ),
          TextButton(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.logout, size: 24),
                SizedBox(width: 10),
                Text("Logout", style: TextStyle(fontSize: 18)),
              ],
            ),
            onPressed: () {
              Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context) => LoginPage()));
            },
          )
        ],
      ),
    );
  }
}
