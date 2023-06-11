import 'package:arx/config/constants/constants.dart';
import 'package:arx/widgets/button/button.dart';
import 'package:arx/widgets/button/outlined_button.dart';
import 'package:arx/widgets/froms/input.dart';
import 'package:fani_wedding/src/dialogs/widget/x_alert_dialog.dart';
import 'package:fani_wedding/src/features/auth/bloc/auth_bloc.dart';
import 'package:fani_wedding/src/utils/fetch_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../widgets/auth_header.dart';

class SignUpView extends StatefulWidget {
  const SignUpView({super.key});

  @override
  State<SignUpView> createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final numberController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => AuthBloc()),
      ],
      child: Scaffold(
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
                controller: nameController,
                textInputAction: TextInputAction.next,
              ),
              const SizedBox(
                height: Constants.kPaddingL,
              ),
              XInputCustom(
                labelText: 'Email',
                prefixIcon: Icons.email,
                controller: emailController,
                keyboardType: TextInputType.emailAddress,
                textInputAction: TextInputAction.next,
              ),
              const SizedBox(
                height: Constants.kPaddingL,
              ),
              XInputCustom(
                labelText: 'Nomor Telepon',
                prefixIcon: Icons.email,
                controller: numberController,
                keyboardType: TextInputType.phone,
                textInputAction: TextInputAction.next,
              ),
              const SizedBox(
                height: Constants.kPaddingL,
              ),
              XInputCustom(
                labelText: 'Kata Sandi',
                prefixIcon: Icons.password_rounded,
                controller: passwordController,
                keyboardType: TextInputType.visiblePassword,
                obscureText: true,
              ),
              const SizedBox(height: Constants.kPaddingXL),
              BlocConsumer<AuthBloc, AuthState>(
                listener: (context, state) {
                  if (state.register.status == FetchingStatus.success) {
                    int count = 0;
                    Navigator.of(context).popUntil((_) => count++ >= 2);
                  } else if (state.register.status == FetchingStatus.failed) {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return XAlertDialog(
                          title: "Register Failed",
                          content: state.register.error,
                        );
                      },
                    );
                  }
                },
                builder: (context, state) {
                  return XButton(
                    busy: state.register.status == FetchingStatus.loading,
                    onPressed: () {
                      context.read<AuthBloc>().add(RegisterEvent(
                          name: nameController.text,
                          email: emailController.text,
                          password: passwordController.text,
                          number: numberController.text));
                    },
                    title: 'Daftar ',
                  );
                },
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
      ),
    );
  }
}
