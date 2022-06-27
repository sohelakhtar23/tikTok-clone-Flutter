import 'package:flutter/material.dart';
import 'package:tiktok_clone/constants.dart';
import 'package:tiktok_clone/view/screens/auth/signup_screen.dart';
import 'package:tiktok_clone/view/widgets/text_input_field.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Tiktok Clone',
              style: TextStyle(
                fontSize: 35,
                fontWeight: FontWeight.bold,
                color: kButtonColor,
              ),
            ),
            const Text(
              'Login',
              style: TextStyle(
                fontSize: 35,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 25),
            TextInputField(
              controller: _emailController,
              icon: Icons.email,
              labelText: 'Email',
            ),
            const SizedBox(height: 25),
            TextInputField(
              controller: _passController,
              icon: Icons.lock,
              labelText: 'Password',
              isObscure: true,
            ),
            const SizedBox(
              height: 30,
            ),
            InkWell(
              onTap: () => authController.loginUser(
                  _emailController.text, _passController.text),
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: 50,
                decoration: BoxDecoration(
                  color: kButtonColor,
                  borderRadius: BorderRadius.circular(5),
                ),
                child: const Center(
                  child: Text(
                    'Login',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Don\'t have an account? ',
                  style: TextStyle(fontSize: 20),
                ),
                TextButton(
                  child: Text(
                    'Register',
                    style: TextStyle(fontSize: 20, color: kButtonColor),
                  ),
                  onPressed: () {
                    print("Register pressed!");
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => SignupScreen()),
                    );
                  },
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
