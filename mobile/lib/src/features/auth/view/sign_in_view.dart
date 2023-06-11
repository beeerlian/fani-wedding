import 'package:arx/config/constants/constants.dart';
import 'package:arx/widgets/button/button.dart';
import 'package:arx/widgets/button/outlined_button.dart';
import 'package:arx/widgets/froms/input.dart';
import 'package:flutter/material.dart';
import 'package:fani_wedding/src/features/auth/view/sign_up_view.dart';
import '../widgets/auth_header.dart';

class SignInView extends StatefulWidget {
  const SignInView({super.key});

  @override
  State<SignInView> createState() => _SignInViewState();
}

class _SignInViewState extends State<SignInView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(Constants.kPaddingL),
          child: ListView(
            children: [
              const AuthHeader(
                title: 'Masuk Sekarang',
              ),
              const SizedBox(height: Constants.kPaddingL),
              const SizedBox(height: Constants.kPaddingL),
              XInputCustom(
                labelText: 'Email',
                prefixIcon: Icons.email,
                controller: TextEditingController(),
                keyboardType: TextInputType.emailAddress,
                textInputAction: TextInputAction.next,
              ),
              const SizedBox(
                height: Constants.kPaddingL,
              ),
              XInputCustom(
                labelText: 'Kata Sandi',
                prefixIcon: Icons.password_rounded,
                controller: TextEditingController(),
                keyboardType: TextInputType.visiblePassword,
                obscureText: true,
              ),
              const SizedBox(height: Constants.kPaddingXL),
              const SizedBox(height: Constants.kPaddingXL),
              XButton(
                onPressed: () {
                  int count = 0;
                  Navigator.of(context).popUntil((_) => count++ >= 1);
                },
                title: 'Masuk',
              ),
              const SizedBox(height: Constants.kPaddingM),
              XOutlinedButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (ctx) => const SignUpView(),
                    ),
                  );
                },
                title: 'Daftar ',
              ),
              const SizedBox(height: Constants.kPaddingL),
            ],
          ),
        ),
      ),
    );
  }
}
