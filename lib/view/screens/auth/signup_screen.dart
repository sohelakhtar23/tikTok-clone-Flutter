import 'package:flutter/material.dart';
import 'package:tiktok_clone/constants.dart';
import 'package:tiktok_clone/controller/auth_controller.dart';
import 'package:tiktok_clone/view/widgets/text_input_field.dart';

import 'login_screen.dart';

class SignupScreen extends StatelessWidget {
  SignupScreen({Key? key}) : super(key: key);

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();

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
              'Register',
              style: TextStyle(
                fontSize: 35,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 25),
            Stack(
              children: [
                const CircleAvatar(
                  radius: 64,
                  backgroundColor: kBorderColor,
                  backgroundImage: NetworkImage(
                      'https://www.pngitem.com/pimgs/m/150-1503945_transparent-user-png-default-user-image-png-png.png'),
                ),
                Positioned(
                  bottom: -10,
                  left: 80,
                  child: IconButton(
                    onPressed: () => authController.pickImage(),
                    icon: const Icon(Icons.add_a_photo),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 25),
            TextInputField(
              controller: _nameController,
              icon: Icons.person,
              labelText: 'Username',
            ),
            const SizedBox(height: 10),
            TextInputField(
              controller: _emailController,
              icon: Icons.email,
              labelText: 'Email',
            ),
            const SizedBox(height: 10),
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
              onTap: () => AuthController().registerUser(
                  username: _nameController.text,
                  email: _emailController.text,
                  password: _passController.text,
                  img: authController.profilePhoto),
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: 50,
                decoration: BoxDecoration(
                  color: kButtonColor,
                  borderRadius: BorderRadius.circular(5),
                ),
                child: const Center(
                  child: Text(
                    'Register',
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
                  'Already have an account? ',
                  style: TextStyle(fontSize: 20),
                ),
                TextButton(
                  child: Text(
                    'Login',
                    style: TextStyle(fontSize: 20, color: kButtonColor),
                  ),
                  onPressed: () {
                    print("login pressed!");
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => LoginScreen()));
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
