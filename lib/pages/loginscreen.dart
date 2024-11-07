import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController emailController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 28),
              //welcome text
              const Text(
                'Welcome Back 👋',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
              ),
              const SizedBox(height: 8),

              //cta text
              const Text(
                'I am happy to see you again. You can \n continue where you left off by logging in',
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: Colors.grey),
              ),
              const SizedBox(height: 32),

              //email textfield
              Customtextfield(
                controller: emailController,
                prefixicon: const Icon(Icons.email),
                hinttext: 'Email Address',
              ),
              const SizedBox(height: 16),

// password textfield
              Customtextfield(
                controller: passwordController,
                prefixicon: const Icon(Icons.lock),
                hinttext: 'Password',
              ),
              const SizedBox(height: 16),

              //forgot password text
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: 20,
                  ),
                  Text('forgot password ?')
                ],
              ),
              const SizedBox(height: 24),

              //sign in button
              InkWell(
                onTap: () => Navigator.pushNamed(context, '/home'),
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 141, vertical: 16),
                  decoration: const BoxDecoration(
                      color: Color.fromRGBO(71, 90, 215, 1),
                      borderRadius: BorderRadius.all(Radius.circular(12))),
                  child: const Center(
                      child: Text(
                    'Sign in',
                    style: TextStyle(color: Colors.white),
                  )),
                ),
              ),

              const SizedBox(height: 48),

              // or
              const Center(child: Text('or')),

              const SizedBox(height: 48),

              //sign in with google
              Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: const BorderRadius.all(Radius.circular(12)),
                      border: Border.all(color: Colors.grey)),
                  child: Row(
                    children: [
                      Image.asset(
                        'assets/icons/google-logo.png',
                        height: 24,
                        width: 24,
                      ),
                      const SizedBox(width: 53),
                      const Text(
                        'Sign In with Google',
                        style: TextStyle(color: Colors.black),
                      ),
                    ],
                  )),
              const SizedBox(height: 16),

              //sign in facebook
              Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: const BorderRadius.all(Radius.circular(12)),
                      border: Border.all(color: Colors.grey)),
                  child: Row(
                    children: [
                      Image.asset(
                        'assets/icons/facebook-logo.png',
                        height: 24,
                        width: 24,
                      ),
                      const SizedBox(width: 53),
                      const Text(
                        'Sign In with facebook',
                        style: TextStyle(color: Colors.black),
                      ),
                    ],
                  )),
              const SizedBox(height: 50),

              Center(
                child: Text.rich(
                  TextSpan(
                    text:
                        "Don't have an account? ", // Default style for the first part
                    style: const TextStyle(
                      color: Colors.grey, // Set your color
                      fontSize: 16, // Default font size
                    ),
                    children: <TextSpan>[
                      TextSpan(
                        text: 'Sign Up',
                        style: const TextStyle(
                          color: Colors
                              .black, // Different color for the 'Sign Up' text
                          fontWeight: FontWeight.bold, // Make it bold
                          fontSize: 18, // Slightly larger font size
                        ),
                        recognizer: TapGestureRecognizer()..onTap = () {},
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class Customtextfield extends StatelessWidget {
  const Customtextfield(
      {super.key, this.hinttext, this.controller, this.prefixicon});
  final String? hinttext;
  final TextEditingController? controller;
  final Widget? prefixicon;
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
          contentPadding: const EdgeInsets.all(16),
          hintText: hinttext,
          prefixIcon: prefixicon,
          enabledBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(12),
            ),
          ),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Color.fromRGBO(71, 90, 215, 1)),
            borderRadius: BorderRadius.all(
              Radius.circular(12),
            ),
          )),
    );
  }
}
