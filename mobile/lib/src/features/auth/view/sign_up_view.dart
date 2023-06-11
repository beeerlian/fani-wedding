import 'package:arx/config/constants/constants.dart';
import 'package:arx/widgets/button/button.dart';
import 'package:arx/widgets/button/outlined_button.dart';
import 'package:arx/widgets/froms/input.dart';
import 'package:flutter/material.dart';
import '../widgets/auth_header.dart';

class SignUpView extends StatefulWidget {
  const SignUpView({super.key});

  @override
  State<SignUpView> createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(Constants.kPaddingL),
          children: [
            const AuthHeader(
              title: 'Daftar Akun',
            ),
            const SizedBox(height: Constants.kPaddingL),
            const SizedBox(height: Constants.kPaddingL),
            XInputCustom(
              labelText: 'Username',
              prefixIcon: Icons.person,
              controller: TextEditingController(),
              textInputAction: TextInputAction.next,
            ),
            const SizedBox(
              height: Constants.kPaddingL,
            ),
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
              labelText: 'Nomor Telepon',
              prefixIcon: Icons.email,
              controller: TextEditingController(),
              keyboardType: TextInputType.phone,
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
            const SizedBox(
              height: Constants.kPaddingL,
            ),
            XInputCustom(
              labelText: 'Ulangi Kata Sandi',
              prefixIcon: Icons.password_rounded,
              controller: TextEditingController(),
              keyboardType: TextInputType.visiblePassword,
              obscureText: true,
            ),
            const SizedBox(height: Constants.kPaddingXL),
            XButton(
              onPressed: () {
                int count = 0;
                Navigator.of(context).popUntil((_) => count++ >= 2);
              },
              title: 'Daftar ',
            ),
            const SizedBox(height: Constants.kPaddingM),
            XOutlinedButton(
              onPressed: () {
                int count = 0;
                Navigator.of(context).popUntil((_) => count++ >= 1);
              },
              title: 'Masuk',
            ),
            const SizedBox(height: Constants.kPaddingL),
          ],
        ),
      ),
    );
  }
}
