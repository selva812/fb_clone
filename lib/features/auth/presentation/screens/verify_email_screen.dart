import 'package:fb_clone/core/constants/constants.dart';
import 'package:fb_clone/core/screens/homescreen.dart';
import 'package:fb_clone/core/utils/utils.dart';
import 'package:fb_clone/core/widget/round_button.dart';
import 'package:fb_clone/features/auth/providers/auth_provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class VerifyEmailScreen extends ConsumerWidget {
  const VerifyEmailScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Padding(
        padding: Constants.defaultPadding,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            RoundButton(
              onPressed: () async {
                await ref.read(authProvider).verifyEmail().then((value) {
                  if (value == null) {
                    showToastMessage(
                        text: "Email verification send to your email");
                  }
                });
              },
              label: "Verify Email",
            ),
            const SizedBox(
              height: 20,
            ),
            RoundButton(
              onPressed: () async {
                await FirebaseAuth.instance.currentUser!.reload();
                final emailVerified =
                    FirebaseAuth.instance.currentUser?.emailVerified;
                if (emailVerified == true) {
                  // Fix this later
                  Navigator.of(context).pushNamed(HomeScreen.routeName);
                }
              },
              label: "Refresh",
            ),
            const SizedBox(
              height: 20,
            ),
            RoundButton(
              onPressed: () {
                ref.read(authProvider).signOut();
              },
              label: "Change Email",
            ),
          ],
        ),
      ),
    );
  }
}