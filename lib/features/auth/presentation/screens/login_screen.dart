import 'package:fb_clone/core/constants/constants.dart';
import 'package:fb_clone/core/widget/round_button.dart';
import 'package:fb_clone/core/widget/roundtextfield.dart';
import 'package:fb_clone/features/auth/presentation/screens/create_account_screen.dart';
import 'package:fb_clone/features/auth/providers/auth_provider.dart';
import 'package:fb_clone/features/auth/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final _formkey = GlobalKey<FormState>();

class LoginScreen extends ConsumerStatefulWidget {
  const LoginScreen({super.key});

  @override
  ConsumerState<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {
  late final TextEditingController _emailController;
  late final TextEditingController _passwordController;
  bool isLoading = false;

  @override
  void initState() {
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  Future<void> login() async {
    if (_formkey.currentState!.validate()) {
      _formkey.currentState!.save();
      setState(() {
        isLoading = true;
      });
      await ref.read(authProvider).signIn(
          email: _emailController.text, password: _passwordController.text);
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: Constants.defaultPadding,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Image.asset(
              "assets/icons/fb_logo.png",
              width: 60,
            ),
            Form(
              key: _formkey,
              child: Column(
                children: [
                  RoundTextField(
                    controller: _emailController,
                    hintText: 'Email',
                    textInputAction: TextInputAction.next,
                    keyboardType: TextInputType.emailAddress,
                    validator: validateEmail,
                  ),
                  const SizedBox(height: 20),
                  // Password Text Field
                  RoundTextField(
                    controller: _passwordController,
                    hintText: 'Password',
                    textInputAction: TextInputAction.done,
                    keyboardType: TextInputType.visiblePassword,
                    validator: validatePassword,
                    isPassword: true,
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  RoundButton(
                      onPressed: () {
                        login();
                      },
                      label: "Login"),
                  const SizedBox(
                    height: 15,
                  ),
                  const Text(
                    "Forgot Password",
                    style: TextStyle(fontSize: 18),
                  )
                ],
              ),
            ),
            Column(
              children: [
                RoundButton(
                  onPressed: () {
                    Navigator.of(context)
                        .pushNamed(CreateAccountScreen.routeName);
                  },
                  label: "Create new account",
                  color: Colors.transparent,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      "assets/icons/meta_logo.png",
                      height: 40,
                    ),
                    const Text(
                      "Meta",
                      style: TextStyle(fontSize: 20),
                    ),
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
