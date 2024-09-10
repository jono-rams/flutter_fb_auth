import 'package:flutter/material.dart';
import 'package:flutter_auth_tut/shared/styled_button.dart';
import 'package:flutter_auth_tut/shared/styled_text.dart';

class SignInForm extends StatefulWidget {
  const SignInForm({super.key});

  @override
  State<SignInForm> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<SignInForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  String _email = '';
  String _password = '';

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // intro text
            const Center(
              child: StyledBodyText('Sign into your account'),
            ),
            const SizedBox(
              height: 16.0,
            ),

            // email address
            TextFormField(
              controller: _emailController,
              keyboardType: TextInputType.emailAddress,
              decoration: const InputDecoration(
                labelText: 'Email address',
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter a valid email address';
                }
                return null;
              },
              onSaved: (value) {
                _email = value!.trim();
              },
            ),
            const SizedBox(
              height: 16.0,
            ),

            // password
            TextFormField(
              controller: _passwordController,
              obscureText: true,
              decoration: const InputDecoration(
                labelText: 'Password',
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter a password';
                }
                return null;
              },
              onSaved: (value) {
                _password = value!.trim();
              },
            ),
            const SizedBox(
              height: 16.0,
            ),

            // error feedback

            // submit button
            StyledButton(
              onPressed: () async {
                if (_formKey.currentState!.validate()) {
                  // perform sign-in logic here
                  _formKey.currentState!.save();
                  setState(() {
                    // clear form fields
                    _formKey.currentState!.reset();
                  });
                }
              },
              child: const StyledButtonText('Sign In'),
            ),
          ],
        ),
      ),
    );
  }
}
