import 'package:flutter/material.dart';
import 'package:flutter_auth_tut/services/auth_service.dart';
import 'package:flutter_auth_tut/shared/styled_button.dart';
import 'package:flutter_auth_tut/shared/styled_text.dart';

class SignUpForm extends StatefulWidget {
  const SignUpForm({super.key});

  @override
  State<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
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
              child: StyledBodyText('Sign up for an account'),
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
                if (value.length < 8) {
                  return 'Password must be at least 8 characters long';
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
                  // perform sign-up logic here
                  _formKey.currentState!.save();

                  final user = await AuthService.signUp(_email, _password);

                  setState(() {
                    // clear form fields
                    _formKey.currentState!.reset();
                  });
                }
              },
              child: const StyledButtonText('Sign up'),
            ),
          ],
        ),
      ),
    );
  }
}
